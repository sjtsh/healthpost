import 'package:flutter/material.dart';
import 'package:healthpost/Services/AppointmentService.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Entities/Appointment.dart';
import '../../Entities/Doctor.dart';

class AppointmentScreen extends StatefulWidget {
  final Doctor doctor;

  AppointmentScreen(this.doctor);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime? startDate;
  int? startTime;
  bool isValidation = false;
  TextEditingController noteController = TextEditingController();

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        startDate = args.value;
      }
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: ListView(
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
                      Icon(Icons.arrow_back),
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
                                      widget.doctor.img,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          widget.doctor.available
                              ? SizedBox(
                                  height: 6,
                                )
                              : Container(),
                          widget.doctor.available
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 4.0),
                                    child: Text(
                                      "Available",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
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
                              widget.doctor.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Specialist: ${widget.doctor.specialist}",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "${widget.doctor.appointments.length} experience points",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12, bottom: 12, top: 12),
            child: Text(
              "Book your appointment",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return Center(
                              child: Material(
                                child: Container(
                                  height: 300,
                                  width: 300,
                                  color: Colors.white,
                                  child: SfDateRangePicker(
                                    onSelectionChanged: _onSelectionChanged,
                                    selectionMode:
                                        DateRangePickerSelectionMode.single,
                                    initialSelectedDate: startDate,
                                    enablePastDates: false,
                                    selectableDayPredicate: (DateTime date) {
                                      for (int i = 0;
                                          i < widget.doctor.offdays.length;
                                          i++) {
                                        if (date.toString().substring(0, 10) ==
                                            widget.doctor.offdays[i]
                                                .toString()
                                                .substring(0, 10)) {
                                          return false;
                                        }
                                      }
                                      return true;
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: isValidation && startDate == null
                              ? Border.all(color: Colors.red)
                              : Border.all(
                                  color: Colors.black.withOpacity(0.2)),
                          color: Color(0xfff2f2f2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(startDate == null
                                  ? "Pick start date"
                                  : startDate.toString().substring(0, 10))),
                        ),
                      ),
                    ),
                    startDate == null
                        ? Container()
                        : SizedBox(
                            height: 12,
                          ),
                    startDate == null
                        ? Container()
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: isValidation && startTime == null
                                  ? Border.all(color: Colors.red)
                                  : null,
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Builder(builder: (context) {
                                List<DateTime> appointmentsOfDay = widget
                                    .doctor.appointments
                                    .where((element) =>
                                        element.year == startDate!.year &&
                                        element.month == startDate!.month &&
                                        element.day == startDate!.day)
                                    .toList();
                                List<int> hours = List.generate(
                                    appointmentsOfDay.length,
                                    (index) => appointmentsOfDay[index].hour);
                                print(hours);
                                return Column(
                                  children: List.generate(
                                          8, (index) => 10 + index)
                                      .where((element) => !hours.contains(
                                          element))
                                      .toList()
                                      .asMap()
                                      .entries
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            startTime = e.value;
                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: e.value == startTime
                                                  ? Colors.green
                                                  : null,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 10),
                                              child: Row(
                                                children: [
                                                  e.value == startTime
                                                      ? Container(
                                                          height: 20,
                                                          width: 20,
                                                          child: Icon(
                                                            Icons.done,
                                                            size: 20,
                                                            color: Colors.white,
                                                          ),
                                                        )
                                                      : Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black),
                                                              shape: BoxShape
                                                                  .circle),
                                                        ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    "${e.value > 12 ? "${e.value - 12} PM" : "${e.value} AM"} to ${(e.value + 1) > 12 ? "${e.value + 1 - 12} PM" : "${e.value + 1} AM"}",
                                                    style: TextStyle(
                                                        color:
                                                            e.value == startTime
                                                                ? Colors.white
                                                                : null,
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                );
                              }),
                            ),
                          ),
                    isValidation && startTime == null
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                "select a time",
                                style: TextStyle(color: Colors.red),
                              ),
                            ))
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6.0),
            child: Container(
              color: Colors.white,
              child: TextField(
                controller: noteController,
                decoration: InputDecoration(
                  errorText: isValidation && noteController.text == ""
                      ? "Please add a note"
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  labelText: "Note for the doctor",
                ),
                maxLines: 6,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
            child: GestureDetector(
              onTap: () async {
                isValidation = true;
                setState(() {});
                if (noteController.text != "" && startTime != null) {
                  DateTime mydate = startDate!.add(Duration(hours: startTime!));
                  await AppointmentService()
                      .postAppointment(mydate, widget.doctor);
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
