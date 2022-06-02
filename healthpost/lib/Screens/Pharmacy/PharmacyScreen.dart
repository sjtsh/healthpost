import 'package:flutter/material.dart';
import 'package:healthpost/Entities/Medicine.dart';
import 'package:healthpost/Services/MedicineService.dart';

import 'SearchableMedicines.dart';
import 'SingularMedicineCard.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
    future: MedicineService().getMedicines(),
    builder: (context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        List<Medicine> medicines = snapshot.data;
        return SearchableMedicines(medicines);
      }
      return Center(child: CircularProgressIndicator());
    });
  }
}
