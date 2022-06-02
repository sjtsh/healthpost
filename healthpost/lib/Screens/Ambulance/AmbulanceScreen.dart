import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:healthpost/Entities/Ambulance.dart';
import 'package:healthpost/Services/AmbulanceService.dart';

import 'SingularAmbulanceCard.dart';

class AmbulanceScreen extends StatelessWidget {
  const AmbulanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AmbulanceService().getAmbulances().then((value) async {
          try {
            Position a = await Geolocator.getCurrentPosition();
            return [value, a.latitude, a.longitude];
          } catch (e) {
            return [value, 27.33, 85.21];
          }
        }),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Ambulance> ambulances = snapshot.data[0];
            double lat = snapshot.data[1];
            double lng = snapshot.data[2];
            ambulances.sort((a, b) => Geolocator.distanceBetween(
                    a.lat, a.lng, lat, lng)
                .compareTo(Geolocator.distanceBetween(b.lat, b.lng, lat, lng)));
            return ListView(
              children: ambulances
                  .map(
                    (e) => AmbulanceCard(
                      e,
                      lat,
                      lng,
                    ),
                  )
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
