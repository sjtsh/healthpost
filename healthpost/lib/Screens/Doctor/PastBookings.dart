import 'package:flutter/material.dart';
import 'package:healthpost/Services/AppointmentService.dart';

import '../../Entities/Appointment.dart';

class PastBookings extends StatelessWidget {
  const PastBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff2f2f2),
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
                      SizedBox(
                        width: 12,
                      ),
                      Icon(Icons.arrow_back),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Past Appointments",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.arrow_back,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: AppointmentService().getAppointments(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Appointment> appointments = snapshot.data;
                      return ListView(
                        children: appointments
                            .map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 8.0),
                                  child: Container(
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
                                    height: 100,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    e.img,
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${e.startTime.toString().substring(0, 10)} (${e.startTime.hour <= 12 ? "${e.startTime.hour}AM" : "${e.startTime.hour - 12}PM"} to ${e.startTime.hour < 12 ? "${e.startTime.hour + 1}AM" : "${e.startTime.hour - 11}PM"})",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Text(
                                                e.doctor,
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              Text(
                                                "Specialist: ${e.specialist}",
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
