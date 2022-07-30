import 'package:flutter/material.dart';
import 'package:healthpost/Screens/AdminScreens/AdminScreen.dart';
import 'package:healthpost/Screens/Doctor/DoctorScreen.dart';
import 'package:healthpost/global.dart';

import '../AboutUsScreen.dart';
import '../Ambulance/AmbulanceScreen.dart';
import '../Bed/BedScreen.dart';
import '../Blood/BloodScreen.dart';
import '../Pharmacy/PharmacyScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  List<Widget> screens = [
    DoctorScreen(),
    PharmacyScreen(),
    BloodScreen(),
    AmbulanceScreen(),
    BedScreen(),
  ];

  List<List> bottomNavItems = admin
      ? [
          [Icons.people_alt_outlined, "Admin", "Welcome Admin"],
        ]
      : [
          [Icons.people_alt_outlined, "Doctor", "Take Appointments"],
          [Icons.medical_services_sharp, "Pharmacy", "Welcome to pharmacy"],
          [Icons.bloodtype, "Blood", "Available blood types"],
          [Icons.car_rental, "Ambulance", "Request an urgent ambulance"],
          [Icons.bed, "Bed", "Available beds"],
        ];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        bottomNavigationBar: admin
            ? null
            : BottomNavigationBar(
                items: bottomNavItems
                    .map(
                      (e) => BottomNavigationBarItem(
                        icon: Icon(
                          e[0] as IconData,
                        ),
                        label: e[1].toString(),
                      ),
                    )
                    .toList(),
                unselectedItemColor: Colors.black.withOpacity(0.5),
                unselectedLabelStyle:
                    TextStyle(color: Colors.black.withOpacity(0.5)),
                selectedLabelStyle: TextStyle(color: Color(0xff4FA5D2)),
                selectedItemColor: Color(0xff4FA5D2),
                currentIndex: i,
                onTap: (int i) {
                  pageController.animateToPage(i,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                },
              ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                    SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          bottomNavItems[i][2],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return AboutUsScreen();
                          }));
                        },
                        child: Icon(Icons.info_outline)),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: admin
                  ? AdminScreen()
                  : PageView(
                      children: screens,
                      pageSnapping: true,
                      controller: pageController,
                      onPageChanged: (int i) {
                        setState(() {
                          this.i = i;
                        });
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
