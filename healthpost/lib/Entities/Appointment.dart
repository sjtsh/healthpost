class Appointment {
  DateTime startTime;
  String doctor;
  String specialist;
  String img;
  String note;

  Appointment(this.startTime, this.doctor, this.specialist, this.img, this.note);

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      DateTime.parse(json["startTime"]),
      json["doctor"],
      json["specialist"],
      json["img"],
      json["note"],
    );
  }
}
