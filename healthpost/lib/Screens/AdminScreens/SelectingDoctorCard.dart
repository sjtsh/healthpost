import 'package:flutter/material.dart';

import '../../Entities/DetailAppointment.dart';
import '../../Entities/Doctor.dart';

class SelectingDoctorCard extends StatefulWidget {
  final List<DetailAppointment> appointments;
  final Set<String> doctorStringsSelected;

  SelectingDoctorCard(this.appointments, this.doctorStringsSelected);

  @override
  State<SelectingDoctorCard> createState() => _SelectingDoctorCardState();
}

class _SelectingDoctorCardState extends State<SelectingDoctorCard> {
  late Set<String> doctorStringsSelected = widget.doctorStringsSelected;


  @override
  Widget build(BuildContext context) {
    List<DetailAppointment> doctors = [];
    Set<String> doctorStrings = {};
    widget.appointments.forEach(
      (element) {
        if (!doctorStrings.contains(element.doctorImg)) {
          doctorStrings.add(element.doctorImg);
          doctors.add(element);
        }
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            doctorStringsSelected.isEmpty
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6),
                        child: Text("${doctorStringsSelected.length} selected",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
            Expanded(
              child: ListView(
                children: doctors
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6),
                        child: GestureDetector(
                          onTap: () {
                            if (!doctorStringsSelected.contains(e.doctorImg)) {
                              doctorStringsSelected.add(e.doctorImg);
                            } else {
                              doctorStringsSelected.remove(e.doctorImg);
                            }
                            setState(() {});
                          },
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
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  e.doctorImg,
                                                ),
                                                fit: BoxFit.cover)),
                                      ),
                                    ],
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
                                          e.doctorName,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          "Specialist: ${e.doctorSpecialist}",
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  doctorStringsSelected.contains(e.doctorImg)
                                      ? Icon(Icons.done)
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context, doctorStringsSelected),
              child: Container(
                height: 40,
                color: Colors.green,
                child: Center(
                  child: Text(
                    "Done",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
