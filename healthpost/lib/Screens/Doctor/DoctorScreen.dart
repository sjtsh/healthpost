import 'package:flutter/material.dart';
import 'package:healthpost/Screens/Doctor/PastBookings.dart';
import 'package:healthpost/Screens/Doctor/SingularDoctorCard.dart';
import 'package:healthpost/Services/DoctorService.dart';

import '../../Entities/Doctor.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return PastBookings();
              }));
            },
            child: Container(
              height: 40,
              color: Colors.blueGrey,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "View Past Appointments",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: DoctorService().getDoctors(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Doctor> doctors = snapshot.data;
                return ListView(
                  children: doctors
                      .map(
                        (e) => SingularDoctorCard(e, refresh),
                      )
                      .toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        )
      ],
    );
  }
}
