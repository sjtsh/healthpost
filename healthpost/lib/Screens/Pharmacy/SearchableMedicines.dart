import 'package:flutter/material.dart';
import 'package:healthpost/Entities/Medicine.dart';

import 'SingularMedicineCard.dart';

class SearchableMedicines extends StatefulWidget {
  final List<Medicine> medicines;

  SearchableMedicines(this.medicines);

  @override
  State<SearchableMedicines> createState() => _SearchableMedicinesState();
}

class _SearchableMedicinesState extends State<SearchableMedicines> {
  bool searching = false;
  TextEditingController controller = TextEditingController();

  List<Medicine>? searchResults;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextField(
            controller: controller,
            onChanged: (String input) {
              if (input == "") {
                searchResults = null;
              } else {
                searchResults = widget.medicines
                    .where((element) =>
                        element.name
                            .toLowerCase()
                            .contains(input.toLowerCase()) ||
                        element.composition
                            .toLowerCase()
                            .contains(input.toLowerCase()))
                    .toList();
                    setState(() {

                    });
              }
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        (searchResults ?? widget.medicines).isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: Text("No Results")),
              )
            : Container(),
        ...(searchResults ?? widget.medicines)
            .map(
              (e) => SingularMedicineCard(e, widget.medicines),
            )
            .toList(),
      ],
    );
  }
}
