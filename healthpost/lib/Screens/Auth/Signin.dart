import 'package:flutter/material.dart';
import 'package:healthpost/Screens/Navigation/HomeScreen.dart';
import 'package:lottie/lottie.dart';

import '../../Services/Auth.dart';
import 'Signup.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isValidation = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Lottie.network(
                      "https://assets6.lottiefiles.com/packages/lf20_l13zwx3i.json"),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Color(0xff4FA5D2),
                              size: 40,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  errorText:
                                      isValidation && emailController.text == ""
                                          ? "Email cannot be empty"
                                          : null,
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.vpn_key,
                              color: Color(0xff4FA5D2),
                              size: 40,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  errorText: isValidation &&
                                          passwordController.text == ""
                                      ? "Password cannot be empty"
                                      : null,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(context, MaterialPageRoute(builder: (_) {
                      //       return ForgotPassword();
                      //     }));
                      //   },
                      //   child: Container(
                      //     width: double.infinity,
                      //     alignment: Alignment.centerRight,
                      //     child: Padding(
                      //       padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      //       child: Text(
                      //         "Forgot Password?",
                      //         style: TextStyle(fontSize: 20),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 12),
                        child: MaterialButton(
                          height: 60,
                          color: Color(0xff4FA5D2),
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () {
                            isValidation = true;
                            setState(() {});
                            if (emailController.text != "" &&
                                passwordController.text != "") {
                              Auth()
                                  .signIn(emailController.text,
                                      passwordController.text)
                                  .then((value) async {
                                await Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return HomeScreen();
                                }));
                                passwordController.clear();
                                isValidation = false;
                                setState(() {});
                              }).onError((error, stackTrace) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(error.toString())));
                                passwordController.clear();
                                isValidation = false;
                                setState(() {});
                              });
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Signup();
                          }));
                        },
                        child: Text(
                          "Create an account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
