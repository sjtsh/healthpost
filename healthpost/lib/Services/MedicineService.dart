import 'dart:convert';

import 'package:healthpost/Entities/Medicine.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../global.dart';

class MedicineService{

  Future<List<Medicine>> getMedicines() async {
    Response res = await http.get(
      Uri.parse("$localhost/medicine/"),
    );
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => Medicine.fromJson(e)).toList();
  }

}