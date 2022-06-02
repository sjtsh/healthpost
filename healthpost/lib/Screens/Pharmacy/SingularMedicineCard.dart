import 'package:flutter/material.dart';
import 'package:healthpost/Entities/Medicine.dart';
import 'package:healthpost/Screens/Pharmacy/DetailScreen.dart';

class SingularMedicineCard extends StatelessWidget {
  final Medicine medicine;
  final List<Medicine> medicines;

  SingularMedicineCard(this.medicine, this.medicines);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen(medicine, medicines);
          }));
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
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            medicine.img,
                          ),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            medicine.name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          medicine.available ? Padding(
                            padding: const EdgeInsets.only(
                              right: 6,
                            ),
                            child: Container(
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
                            ),
                          ): Container(),
                          medicine.prescription ? Padding(
                            padding: const EdgeInsets.only(
                              right: 6,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4.0),
                                child: Text(
                                  "Presciption required",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ) : Container(),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Composition: ${medicine.composition}",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        "Rs.${medicine.cost} (1 * ${medicine.cf})",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
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
    );
  }
}
