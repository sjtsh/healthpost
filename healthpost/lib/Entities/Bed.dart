class Bed {
  final int id;
  final String hospital;
  final String img;
  final String name;
  final int available;
  final String phone;
  final int category;

  Bed(this.id, this.hospital, this.img, this.name, this.available, this.phone, this.category);

  factory Bed.fromJson(Map<String, dynamic> json) {
    return Bed(json["id"], json["hospital"], json["img"], json["name"],
        json["available"], json["phone"], json["category"]);
  }
}
