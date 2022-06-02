import 'dart:convert';

import 'package:healthpost/Entities/Doctor.dart';
import 'package:healthpost/Entities/Doctor.dart';
import 'package:healthpost/Entities/Doctor.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../global.dart';

class DoctorService{

  Future<List<Doctor>> getDoctors() async {
    Response res = await http.get(
      Uri.parse("$localhost/doctor/"),
    );
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => Doctor.fromJson(e)).toList();
  }
}