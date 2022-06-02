import 'package:flutter/material.dart';
import 'package:healthpost/Entities/Blood.dart';
import 'package:healthpost/Services/BloodService.dart';

import 'BloodMedicineCard.dart';

class BloodScreen extends StatelessWidget {
  const BloodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: BloodService().getBloods(),
    builder: (context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        List<Blood> bloods = snapshot.data;
        return GridView.count(
          crossAxisCount: 2,
          children: bloods
              .map(
                (e) => BloodMedicineCard(e),
              )
              .toList(),
        );
      }
      return Center(child: CircularProgressIndicator());
    });
  }
}
