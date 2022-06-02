import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:healthpost/Entities/Ambulance.dart';
import 'package:healthpost/Entities/Ambulance.dart';
import 'package:healthpost/Entities/Ambulance.dart';
import '../global.dart';

class AmbulanceService{

  Future<List<Ambulance>> getAmbulances() async {
    Response res = await http.get(
      Uri.parse("$localhost/ambulance/"),
    );
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => Ambulance.fromJson(e)).toList();
  }

}