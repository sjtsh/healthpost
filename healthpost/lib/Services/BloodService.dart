import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../Entities/Blood.dart';
import '../global.dart';


class BloodService{

  Future<List<Blood>> getBloods() async {
    Response res = await http.get(
      Uri.parse("$localhost/blood/"),
    );
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable.map((e) => Blood.fromJson(e)).toList();
  }

}