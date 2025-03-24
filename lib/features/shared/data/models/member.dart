import 'memberCheckIn.dart';

class Member {
  String lastname = "";
  String firstname = "";
  String birthday = "";
  String memberNumber = "";
  bool memberCardDone = false;
  List<MemberCheckIn> memberCheckIn = [];

  Member(
    this.lastname,
    this.firstname,
    this.birthday,
    this.memberNumber,
    this.memberCardDone,
    this.memberCheckIn,
  );

  // Factory-Methode, um ein Member-Objekt aus einer Map zu erstellen
  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      map['lastname'] ?? '',
      map['firstname'] ?? '',
      map['birthday'] ?? '',
      map['memberNumber'] ?? '',
      map['memberCardDone'] ?? false,
      (map['memberCheckIn'] != null && map['memberCheckIn'] is List)
          ? List<MemberCheckIn>.from(
        (map['memberCheckIn'] as List<dynamic>)
            .map((item) {
          return MemberCheckIn.fromMap(Map<String, dynamic>.from(item));
        }),
      )
          : [], // Wenn memberCheckIn null ist oder kein List ist, benutze eine leere Liste
    );
  }
  // Methode, um ein Member-Objekt in eine Map zu konvertieren
  Map<String, dynamic> toMap() {
    return {
      'lastname': lastname,
      'firstname': firstname,
      'birthday': birthday,
      'memberNumber': memberNumber,
      'memberCardDone': memberCardDone,
      'memberCheckIn': memberCheckIn.map((checkIn) => checkIn.toMap()).toList(), // Hier wird die Liste in Maps konvertiert
    };
  }
}
