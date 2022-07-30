import 'package:flutter/material.dart';

import '../../Entities/Appointment.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  AppointmentCard(this.appointment);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8.0),
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
                        appointment.img,
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${appointment.startTime.toString().substring(0, 10)} (${appointment.startTime.hour <= 12 ? "${appointment.startTime.hour}AM" : "${appointment.startTime.hour - 12}PM"} to ${appointment.startTime.hour < 12 ? "${appointment.startTime.hour + 1}AM" : "${appointment.startTime.hour - 11}PM"})",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    appointment.doctor,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    "Specialist: ${appointment.specialist}",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
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
    );
  }
}
