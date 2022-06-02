import 'package:healthpost/Entities/Appointment.dart';

import '../Entities/Doctor.dart';
import '../global.dart';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AppointmentService {
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
  ) async {
    Response res = await http.post(
      Uri.parse("$localhost/create/$id/"),
      headers: {"content-type": "application/json"},
      body:
          jsonEncode({"startTime": startTime.toString(), "doctor": doctor.id}),
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
