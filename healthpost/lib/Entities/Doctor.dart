class Doctor {
  int id;
  String name;
  String specialist;
  bool available;
  String img;
  String phone;
  List<DateTime> appointments;
  List<DateTime> offdays;

  Doctor(
    this.id,
    this.name,
    this.specialist,
    this.available,
    this.img,
    this.phone,
    this.appointments,
    this.offdays,
  );

  factory Doctor.fromJson(Map<String, dynamic> json) {
    List<dynamic> appointments = json["appointments"];
    List<dynamic> offdays = json["offdays"];
    // print(appointments);
    return Doctor(
      json["id"],
      json["name"],
      json["specialist"],
      json["available"],
      json["img"],
      json["phone"],
      appointments.map((e) => DateTime.parse(e)).toList(),
      offdays.map((e) => DateTime.parse(e)).toList(),
    );
  }
}
