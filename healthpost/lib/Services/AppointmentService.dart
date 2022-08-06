import 'package:healthpost/Entities/Appointment.dart';

import '../Entities/DetailAppointment.dart';
import '../Entities/Doctor.dart';
import '../global.dart';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:healthpost/data.dart';

class AppointmentService {
  Future<List<DetailAppointment>> getAllAppointments() async {
    Response res = await http.get(
      Uri.parse("$localhost/appointment/"),
    );
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable
        .map((e) => DetailAppointment.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  Future<List<Appointment>> getAppointments() async {
    Response res = await http.get(
      Uri.parse("$localhost/appointment/$id/"),
    );
    List<dynamic> parsable = jsonDecode(res.body);
    return parsable
        .map((e) => Appointment.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  Future<bool> postAppointment(
    DateTime startTime,
    Doctor doctor,
    String note,
  ) async {
    Response res = await http.post(
      Uri.parse("$localhost/create/$id/"),
      headers: {"content-type": "application/json"},
      body: jsonEncode({
        "startTime": startTime.toString(),
        "doctor": doctor.id,
        "note": note
      }),
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
