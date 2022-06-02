class Appointment {
  DateTime startTime;
  String doctor;
  String specialist;
  String img;

  Appointment(this.startTime, this.doctor, this.specialist, this.img);

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      DateTime.parse(json["startTime"]),
      json["doctor"],
      json["specialist"],
      json["img"],
    );
  }
}
