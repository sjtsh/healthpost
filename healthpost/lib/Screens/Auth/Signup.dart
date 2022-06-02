import 'package:flutter/material.dart';
import 'package:healthpost/Screens/Navigation/HomeScreen.dart';

import '../../Services/Auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isValidated = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: ListView(children: [
        SizedBox(height: 20,),
          Text(
            "Sign Up,\nYour Personal Health Post",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xff435244)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),
          Divider(
            color: Color(0xff4FA5D2),
            thickness: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Your Name",
                errorText: nameController.text == "" && isValidated
                    ? "Name cannot be empty"
                    : null,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                errorText: emailController.text == "" && isValidated
                    ? "Email cannot be empty"
                    : null,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Phone No.",
                errorText: phoneController.text == "" && isValidated
                    ? "Phone cannot be empty"
                    : null,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Current Address",
                errorText: addressController.text == "" && isValidated
                    ? "Address cannot be empty"
                    : null,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "New Password",
                errorText: passwordController.text == "" && isValidated
                    ? "Password cannot be empty"
                    : null,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: confirmController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                errorText: passwordController.text != confirmController.text
                    ? "Passwords do not match"
                    : null,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 60,
              color: Color(0xff4FA5D2),
              onPressed: () {
                setState(() {
                  isValidated = true;
                });
                if (nameController.text != "" &&
                    emailController.text != "" &&
                    phoneController.text != "" &&
                    addressController.text != "" &&
                    passwordController.text != "" &&
                    passwordController.text == confirmController.text) {
                  Auth()
                      .signUp(
                          nameController.text,
                          passwordController.text,
                          emailController.text,
                          phoneController.text,
                          addressController.text)
                      .then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return HomeScreen();
                    }));
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())));
                  });
                }
              },
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Container(
            decoration: BoxDecoration(border: Border.all(color: Color(0xff4FA5D2))),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Color(0xff4FA5D2), fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
        ]),
      ),
    );
  }
}
