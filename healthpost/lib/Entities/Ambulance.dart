class Ambulance {
  String hospital;
  double lat;
  double lng;
  String phone;
  bool available;

  Ambulance(
    this.hospital,
    this.lat,
    this.lng,
    this.phone,
    this.available,
  );

  factory Ambulance.fromJson(Map<String, dynamic> json) {
    return Ambulance(
      json["hospital"],
      json["lat"] + 0.0,
      json["lng"] + 0.0,
      json["phone"],
      json["available"],
    );
  }
}
