import 'dart:convert';

import 'package:healthpost/Entities/Bed.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../global.dart';

class BedService {
  Future<List<Bed>> getBeds() async {
    Response res = await http.get(
      Uri.parse("$localhost/bed/"),
    );
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => Bed.fromJson(e)).toList();
  }
}
