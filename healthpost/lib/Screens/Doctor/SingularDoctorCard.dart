import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Entities/Doctor.dart';
import 'AppointmentScreen.dart';

class SingularDoctorCard extends StatefulWidget {
  final Doctor doctor;
  final Function refresh;
  SingularDoctorCard(this.doctor, this.refresh);

  @override
  State<SingularDoctorCard> createState() => _SingularDoctorCardState();
}

class _SingularDoctorCardState extends State<SingularDoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: GestureDetector(
        onTap: () async {
          if (widget.doctor.available) {
            await Navigator.push(context, MaterialPageRoute(builder: (_) {
              return AppointmentScreen(widget.doctor);
            }));
            widget.refresh();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        "Doctor Unavailable",
                        style: TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
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
                IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse("tel://${widget.doctor.phone}"));
                    },
                    icon: Icon(Icons.phone)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
