class Blood {
  String name;
  int available;
  String phone;

  Blood(
    this.name,
    this.available,
    this.phone,
  );

  factory Blood.fromJson(Map<String, dynamic> json) {
    return Blood(
      json["name"],
      json["available"],
      json["phone"],
    );
  }
}
