class MemberCheckIn {
  DateTime  checkInDate = DateTime.now();
  bool checkIn = false;
  bool payed = false;

  MemberCheckIn(
    this.checkInDate,
    this.checkIn,
    this.payed,
  );

  factory MemberCheckIn.fromMap(Map<String, dynamic> map) {
    return MemberCheckIn(
      DateTime.parse(map['checkInDate']),
      map['checkIn'],
      map['payed'],
    );
  }

  // Methode, um ein MemberCheckIn-Objekt in eine Map zu konvertieren
  Map<String, dynamic> toMap() {
    return {
      'checkInDate': checkInDate.toIso8601String(),  // Konvertiere DateTime in String
      'checkIn': checkIn,
      'payed': payed,
    };
  }
}
