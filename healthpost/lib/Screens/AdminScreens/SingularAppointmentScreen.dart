import 'dart:math';

import 'package:flutter/material.dart';
import 'package:healthpost/Screens/AdminScreens/AppointmentCard.dart';

import '../../Entities/Appointment.dart';
import '../../Entities/DetailAppointment.dart';

class SingularAppointmentScreen extends StatelessWidget {
  final DetailAppointment appointment;
  SingularAppointmentScreen(this.appointment);

  @override
  Widget build(BuildContext context) {
    List<List<String>> userData = [
      ["Name: ", "Email: ", "Username: ", "Address: ", "Phone: "],
      [
        appointment.userName,
        appointment.userEmail,
        appointment.userUserName,
        appointment.userAddress,
        appointment.userPhone
      ]
    ];
    List<List<String>> doctorData = [
      ["Name: ", "Specialist: ", "Available: ", "Phone: "],
      [
        appointment.doctorName,
        appointment.doctorSpecialist,
        appointment.doctorAvailable ? "Available" : "Not Available",
        appointment.doctorPhone
      ]
    ];
    List<List<String>> appointmentData = [
      [
        "Date: ",
        "Start at: ",
        "End at: ",
      ],
      [
        appointment.startTime.toString().substring(0, 10),
        appointment.startTime.toString().substring(10, 19),
        appointment.startTime
            .add(Duration(hours: 1))
            .toString()
            .substring(10, 19),
      ]
    ];
    String note = appointment.note;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppointmentCard(appointment),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Appointment Information",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...appointmentData[0].map(
                                          (f) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            child: Text(
                                              f,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Text(
                                            "Doctor Note: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        ...appointmentData[1].map(
                                          (f) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            child: Text(f),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(note),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "User Information",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: userData[0]
                                          .map(
                                            (f) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: Text(
                                                f,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                    Expanded(child: Container()),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: userData[1]
                                          .map(
                                            (f) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: Text(f),
                                            ),
                                          )
                                          .toList(),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Doctor Information",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Image.network(
                                appointment.doctorImg,
                                height: 100,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: doctorData[0]
                                              .map(
                                                (f) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 4.0),
                                                  child: Text(
                                                    f,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                        Expanded(child: Container()),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: doctorData[1]
                                              .map(
                                                (f) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 4.0),
                                                  child: Text(f),
                                                ),
                                              )
                                              .toList(),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
