import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Entities/Medicine.dart';
import 'SingularMedicineCard.dart';

class DetailScreen extends StatelessWidget {
  final Medicine medicine;
  final List<Medicine> medicines;

  DetailScreen(this.medicine, this.medicines);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          expandedHeight: 300,
          collapsedHeight: 60,
          toolbarHeight: 60,
          backgroundColor: Colors.black,
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration:
                    BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(medicine.name, textScaleFactor: 1),
                    Text(
                      'Rs. ${medicine.cost} (1 * ${medicine.cf})',
                      textScaleFactor: 0.7,
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
                Expanded(child: Container()),
              ],
            ),
            background: Stack(
              children: [
                Image.network(
                  medicine.img,
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.7),
                          Colors.black
                        ],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) {
              if (index == 0) {
                return Container(
                    padding: const EdgeInsets.only(
                        left: 6.0, right: 6, bottom: 6, top: 30),
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ),
                    ),
                    child: Text(
                      "Side effects",
                      style: TextStyle(fontSize: 30),
                    ));
              } else {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          medicine.sideEffects[index],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            childCount: medicine.sideEffects.length,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) {
              if (index == 0) {
                return Container(
                    padding: const EdgeInsets.all(6.0),
                    margin: const EdgeInsets.only(
                        left: 6.0, right: 6, bottom: 6, top: 30),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ),
                    ),
                    child: Text(
                      "Alternatives",
                      style: TextStyle(fontSize: 30),
                    ));
              } else {
                return SingularMedicineCard(
                    medicines
                        .where((element) =>
                            element.composition == medicine.composition)
                        .elementAt(index),
                    medicines);
              }
            },
            childCount: medicines
                .where((element) => element.composition == medicine.composition)
                .length,
          ),
        ),
      ],
    )));
  }
}
