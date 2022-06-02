class Medicine {
  String name;
  bool available;
  bool prescription;
  String composition;
  int cost;
  int cf;
  String img;
  List<String> sideEffects;

  Medicine(
    this.name,
    this.available,
    this.prescription,
    this.composition,
    this.cost,
    this.cf,
    this.img,
    this.sideEffects,
  );

  factory Medicine.fromJson(Map<String, dynamic> json) {
  List<dynamic> sideeffects = json["sideeffects"];
    return Medicine(
      json["name"],
      json["available"],
      json["prescription"],
      json["composition"],
      json["cost"],
      json["cf"],
      json["img"],
      sideeffects.map((e) => e.toString()).toList(),
    );
  }
}
