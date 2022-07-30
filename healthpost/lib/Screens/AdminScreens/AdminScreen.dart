import 'package:flutter/material.dart';
import 'package:healthpost/Screens/AdminScreens/SeperateListByCategory.dart';
import 'package:healthpost/Screens/Doctor/PastBookings.dart';
import 'package:healthpost/Services/AppointmentService.dart';

import '../../Entities/Appointment.dart';
import 'AppointmentCard.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({Key? key}) : super(key: key);
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppointmentService().getAllAppointments(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Appointment> appointments = snapshot.data;
          return PageView(
            controller: controller,
            children: [
              SeperateListByCategory(
                  children: appointments.map((e) => MapEntry(
                      e.startTime.toString().substring(0, 10),
                      AppointmentCard(e)))),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
