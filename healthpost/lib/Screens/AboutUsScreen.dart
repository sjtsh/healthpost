import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, -2),
                      blurRadius: 3,
                      spreadRadius: 3,
                    )
                  ],
                ),
                height: 40,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "About Us",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.info_outline,
                      color: Colors.transparent,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          Expanded(
              child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Health Post",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Powered By",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/LOGO.png",
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(child: Container()),
          Text(
            "Thanks for your support",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    ));
  }
}
