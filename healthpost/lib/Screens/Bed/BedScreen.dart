import 'package:flutter/material.dart';
import 'package:healthpost/Services/BedService.dart';
import 'package:healthpost/global.dart';

import '../../Entities/Bed.dart';
import 'SingularBedCard.dart';

class BedScreen extends StatelessWidget {
  const BedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BedService().getBeds(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Bed> beds = snapshot.data;
            return ListView(
              children: beds
                  .map(
                    (e) => SingularBedCard(e),
                  )
                  .toList(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
