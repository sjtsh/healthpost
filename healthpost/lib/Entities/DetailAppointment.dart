class DetailAppointment {
  final DateTime startTime;
  final String userName;
  final String userEmail;
  final String userUserName;
  final String userAddress;
  final String userPhone;
  final String doctorName;
  final String doctorImg;
  final String doctorSpecialist;
  final bool doctorAvailable;
  final String doctorPhone;
  final String note;

  DetailAppointment(
      this.startTime,
      this.userName,
      this.userEmail,
      this.userUserName,
      this.userAddress,
      this.userPhone,
      this.doctorName,
      this.doctorImg,
      this.doctorSpecialist,
      this.doctorAvailable,
      this.doctorPhone,
      this.note);

  factory DetailAppointment.fromJson(Map<String, dynamic> json) {
    return DetailAppointment(
      DateTime.parse(json["startTime"]),
      json["userName"],
      json["userEmail"],
      json["userUserName"],
      json["userAddress"],
      json["userPhone"],
      json["doctorName"],
      json["doctorImg"],
      json["doctorSpecialist"],
      json["doctorAvailable"],
      json["doctorPhone"],
      json["note"],
    );
  }
}
