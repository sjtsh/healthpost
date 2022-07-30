import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Entities/Bed.dart';
import '../../Entities/Doctor.dart';

class SingularBedCard extends StatelessWidget {
  final Bed bed;
  SingularBedCard(this.bed);

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
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(
                            bed.img,
                          ),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4.0),
                      child: Text(
                        bed.category == 1
                            ? "\$"
                            : bed.category == 2
                                ? "\$\$"
                                : "\$\$\$",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
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
                    bed.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    bed.hospital,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "${bed.available} Available",
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
                  launchUrl(Uri.parse("tel://${bed.phone}"));
                },
                icon: Icon(Icons.phone)),
          ],
        ),
      ),
    );
  }
}
