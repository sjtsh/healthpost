import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:healthpost/Entities/Ambulance.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulanceCard extends StatelessWidget {
  final Ambulance ambulance;
  final double lat;
  final double lng;

  AmbulanceCard(this.ambulance, this.lat, this.lng);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
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
              Icon(Icons.car_rental),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ambulance.hospital),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ambulance.available
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4.0),
                        child: Text(
                          ambulance.available ? "Available" : "Unavailable",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "${Geolocator.distanceBetween(ambulance.lat, ambulance.lng, lat, lng).toStringAsFixed(2)}m far",
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              IconButton(
                  onPressed: () {
                    launchUrl(Uri.parse("tel://${ambulance.phone}"));
                  },
                  icon: Icon(Icons.phone)),
            ],
          ),
        ),
      ),
    );
  }
}
