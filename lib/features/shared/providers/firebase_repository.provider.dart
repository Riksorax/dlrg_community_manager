import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/auth.dart';
import '../data/models/member.dart';

part 'firebase_repository.provider.g.dart';

@riverpod
Future<bool> saveMemberRepo(SaveMemberRepoRef ref, Member member) async {
  try {
    await _saveMember(
        member); // Wichtiger: await hinzufügen, um asynchrone Operation zu erwarten
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<void> _saveMember(Member member) async {
  var getMember = await _getMember(member.memberNumber);
  // Zugriff auf die Realtime Database
  if (getMember == null) {
    DatabaseReference dbRef =
        FirebaseDatabase.instance.ref("members").child(member.memberNumber);
    await dbRef.set(member.toMap());
  }
}

@riverpod
Future<Member?> getMemberRepo(GetMemberRepoRef ref, String memberNumber) async {
  try {
    var member = await _getMember(memberNumber);
    return member;
  } catch (e) {
    print("Fehler beim Laden des Mitglieds: $e");
    return null;
  }
}

Future<Member?> _getMember(String memberNumber) async {
  // Zugriff auf den spezifischen Knoten in der Datenbank
  DatabaseReference dbRef =
      FirebaseDatabase.instance.ref("members").child(memberNumber);

  // Daten abrufen (asynchron)
  DataSnapshot snapshot = await dbRef.get();

  // Daten in ein Member-Objekt umwandeln
  if (snapshot.exists) {
    Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
    Map<String, dynamic> stringMap =
        data.map((key, value) => MapEntry(key as String, value));

    // Zugriff auf memberCheckIn und Verarbeitung
    if (stringMap.containsKey('memberCheckIn')) {
      dynamic checkInData = stringMap['memberCheckIn'];

      if (checkInData is Map) {
        // Altes Format: Map von Keys zu Check-in-Objekten
        List<dynamic> checkInList = checkInData.values.toList();
        checkInList.sort((a, b) => DateTime.parse(a['checkInDate'])
            .compareTo(DateTime.parse(b['checkInDate'])));

        if (checkInList.length > 2) {
          stringMap['memberCheckIn'] = checkInList
              .sublist(checkInList.length - 2); // Nur die letzten zwei
        } else {
          stringMap['memberCheckIn'] = checkInList; // Alle falls weniger als 2
        }
      } else if (checkInData is List) {
        // Neues Format: Direkte Liste von Check-in-Objekten
        checkInData.sort((a, b) => DateTime.parse(a['checkInDate'])
            .compareTo(DateTime.parse(b['checkInDate'])));
        if (checkInData.length > 2) {
          stringMap['memberCheckIn'] =
              checkInData.sublist(checkInData.length - 2);
        } else {
          stringMap['memberCheckIn'] = checkInData; // Alle falls weniger als 2
        }
      }
    }

    return Member.fromMap(stringMap);
  } else {
    return null; // Mitglied nicht gefunden
  }
}

@riverpod
Future<bool> updateMemberRepo(
    UpdateMemberRepoRef ref, Member member, int? index) async {
  try {
    if (index == null) {
      await _updateMember(member);
    } else {
      _updateMemberPayed(member, index);
    }
    return true;
  } catch (e) {
    print("Fehler beim Updaten des Mitglieds: $e");
    return false;
  }
}

Future<void> _updateMember(Member member) async {
  String memberNumberToUpdate =
      member.memberNumber; // Or however you get the correct member number

  // Zugriff auf den spezifischen Knoten in der Datenbank
  DatabaseReference dbRef =
      FirebaseDatabase.instance.ref("members").child(memberNumberToUpdate);

  // Daten abrufen (asynchron)
  await dbRef.update(member.toMap());
}

Future<void> _updateMemberPayed(Member member, int index) async {
  DatabaseReference dbRef =
      FirebaseDatabase.instance.ref("members").child(member.memberNumber);

  // Pfad zum spezifischen Eintrag im memberCheckIn-Array erstellen
  String checkInPath = "memberCheckIn/$index";

  // Daten für den Eintrag im memberCheckIn-Array erstellen
  Map<String, dynamic> checkInData = member.memberCheckIn[index].toMap();

  // Spezifischen Eintrag im memberCheckIn-Array aktualisieren
  await dbRef.child(checkInPath).update(checkInData);
}

@riverpod
Future<bool> deleteMemberRepo(
    DeleteMemberRepoRef ref, String memberNumber) async {
  try {
    await _deleteMember(memberNumber);
    return true;
  } catch (e) {
    print("Fehler beim Löschen des Mitglieds: $e");
    return false;
  }
}

Future<void> _deleteMember(String memberNumber) async {
  // Zugriff auf den spezifischen Knoten in der Datenbank
  DatabaseReference dbRef =
      FirebaseDatabase.instance.ref("members").child(memberNumber);

  // Mitglied aus der Datenbank löschen (asynchron)
  await dbRef.remove();
}

@riverpod
Future<List<Member>> getAllMembersRepo(Ref ref) async {
  try {
    var members = await _getAllMembers();
    return members;
  } catch (e) {
    print("Fehler beim Laden des Mitglieds: $e");
    return [];
  }
}

Future<List<Member>> _getAllMembers() async {
  try {
    // Access the "members" node in your database
    DatabaseReference dbRef = FirebaseDatabase.instance.ref("members");

    // Get all child nodes (members) as a list of DataSnapshots
    DataSnapshot snapshot = await dbRef.get();

    if (snapshot.exists) {
      List<Member> members = [];
      for (DataSnapshot childSnapshot in snapshot.children) {
        // Convert each child snapshot to a Member object
        var data = childSnapshot.value;

        if (data is Map) {
          Map<String, dynamic> stringMap = Map<String, dynamic>.from(data);
          members.add(Member.fromMap(stringMap));
        } else {
          print("Unexpected data format: $data");
        }
      }
      return members;
    } else {
      return []; // No members found
    }
  } catch (e) {
    print("Fehler beim Laden der Mitglieder: $e");
    return [];
  }
}

@riverpod
Future<Auth?> getAuthRepo(Ref ref, String userUid) async {
  DatabaseReference dbRef =
      FirebaseDatabase.instance.ref("auth").child(userUid);

  // Daten abrufen (asynchron)
  DataSnapshot snapshot = await dbRef.get();
  if (snapshot.exists) {
    try {
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      Map<String, dynamic> stringMap =
          data.map((key, value) => MapEntry(key as String, value));

      print(stringMap);
      return Auth.fromMap(stringMap);
    } catch (e) {
      print("Fehler bei der Konvertierung: $e");
      return null; // Im Fehlerfall null zurückgeben
    }
  } else {
    return null;
  }
}

@riverpod
Future<bool> setAuthRepo(Ref ref, Auth auth) async {
  DatabaseReference dbRef =
      FirebaseDatabase.instance.ref("auth").child(auth.user.userUid);
  await dbRef.set(auth.toMap());
  return true;
}

@riverpod
Future<List<Auth>> getListAuthRepo(Ref ref) async {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref("auth");
  // Get all child nodes (members) as a list of DataSnapshots
  DataSnapshot snapshot = await dbRef.get();
  if (snapshot.exists) {
    List<Auth> authList = [];
    for (DataSnapshot childSnapshot in snapshot.children) {
      // Convert each child snapshot to a Member object
      var data = childSnapshot.value;

      if (data is Map) {
        Map<String, dynamic> stringMap = Map<String, dynamic>.from(data);
        authList.add(Auth.fromMap(stringMap));
      } else {
        print("Unexpected data format: $data");
      }
    }
    return authList;
  } else {
    return [];
  }
}

@riverpod
Future<bool> updateAuth(Ref ref, Auth auth) async {
  try{
    String userUid = auth.user.userUid; // Or however you get the correct member number

    // Zugriff auf den spezifischen Knoten in der Datenbank
    DatabaseReference dbRef =
    FirebaseDatabase.instance.ref("auth").child(userUid);

    // Daten abrufen (asynchron)
    await dbRef.update(auth.toMap());
    return true;
  }
  catch (e) {
    return false;
  }
}

@riverpod
Future<List<Member>> searchMember (Ref ref, String searchText) async {
  try {
    // Rufe alle Mitglieder über den bestehenden Provider ab
    final allMembers = await ref.watch(getAllMembersRepoProvider.future);

    if (searchText.isEmpty) {
      // Wenn der Suchtext leer ist, gib alle Mitglieder zurück
      return allMembers;
    }

    final lowerCaseSearchText = searchText.toLowerCase();

    // Filtere die Liste basierend auf dem Suchtext
    final filteredMembers = allMembers.where((member) {
      // Hier definierst du die Suchkriterien.
      // Du kannst mehrere Felder überprüfen.
      return member.firstname.toLowerCase().contains(lowerCaseSearchText) ||
          member.lastname.toLowerCase().contains(lowerCaseSearchText); // Beispiel für ein weiteres Feld
    }).toList();

    return filteredMembers;
  } catch (e) {
    print("Fehler beim Suchen der Mitglieder: $e");
    return [];
  }
}
