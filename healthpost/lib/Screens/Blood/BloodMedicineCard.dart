import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Entities/Blood.dart';

class BloodMedicineCard extends StatelessWidget {
  final Blood blood;

  BloodMedicineCard(this.blood);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    child: Center(
                        child: Text(
                      blood.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: blood.available == 0 ? Colors.red : Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4.0),
                      child: Text(
                        "${blood.available} Available",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if(blood.available != 0){
                    launchUrl(Uri.parse("tel://${blood.phone}"));
                  }
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: blood.available == 0 ?Colors.red: Colors.green ,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "Request",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
