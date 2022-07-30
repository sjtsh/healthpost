import 'package:flutter/material.dart';
import 'package:healthpost/Screens/AdminScreens/SelectingDoctorCard.dart';
import 'package:healthpost/Screens/AdminScreens/SeperateListByCategory.dart';
import 'package:healthpost/Screens/Doctor/PastBookings.dart';
import 'package:healthpost/Services/AppointmentService.dart';

import '../../Entities/Appointment.dart';
import '../../Entities/DetailAppointment.dart';
import 'AppointmentCard.dart';

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int index = 0;

  final PageController controller = PageController();
  Set<String> doctorStringsSelected = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppointmentService().getAllAppointments(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<DetailAppointment> appointments = snapshot.data;
          return Builder(builder: (context) {
            List<DetailAppointment> futureAppointments = [];
            List<DetailAppointment> pastAppointments = [];
            for (var element in appointments.where((element) {
              if (doctorStringsSelected.isEmpty) {
                return true;
              }
              return doctorStringsSelected.contains(element.doctorImg);
            })) {
              if (element.startTime.isAfter(DateTime.now())) {
                futureAppointments.add(element);
              } else {
                pastAppointments.add(element);
              }
            }
            return Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    Set<String> doctorStringsSelectedNew = await Navigator.push(
                        context, MaterialPageRoute(builder: (_) {
                      return SelectingDoctorCard(
                          appointments, doctorStringsSelected);
                    }));
                    doctorStringsSelected = doctorStringsSelectedNew;
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Text( doctorStringsSelected.isEmpty ? "Click to Filter" : "Filters"),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                                        child: Row(
                                      children: doctorStringsSelected
                                          .map(
                                            (e) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(e),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        doctorStringsSelected.isEmpty
                            ? Icon(Icons.filter_alt_sharp)
                            : IconButton(
                                onPressed: () => setState(
                                    () => doctorStringsSelected.clear()),
                                icon: Icon(Icons.clear)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: ["Upcoming Appointments", "Past Appointments"]
                        .asMap()
                        .entries
                        .map(
                          (e) => Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.animateToPage(e.key,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                height: 40,
                                color: index == e.key
                                    ? Color(0xff4FA5D2)
                                    : Colors.white.withOpacity(0.5),
                                child: Center(
                                    child: Text(
                                  e.value,
                                  style: TextStyle(
                                    color: index == e.key
                                        ? Colors.white
                                        : Colors.black.withOpacity(0.5),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller,
                    onPageChanged: (int a) {
                      index = a;
                      setState(() {});
                    },
                    children: [
                      futureAppointments.isEmpty
                          ? Center(child: Text("No Future Appointments"))
                          : SeperateListByCategory(
                              children: futureAppointments.map((e) => MapEntry(
                                  e.startTime.toString().substring(0, 10),
                                  AppointmentCard(e))),
                              reverse: false),
                      pastAppointments.isEmpty
                          ? Center(child: Text("No Past Appointments"))
                          : SeperateListByCategory(
                              children: pastAppointments.map((e) => MapEntry(
                                  e.startTime.toString().substring(0, 10),
                                  AppointmentCard(e)))),
                    ],
                  ),
                ),
              ],
            );
          });
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
