import 'dart:convert';

import 'package:nfc_manager/nfc_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/data/models/member.dart';
import '../../shared/data/models/memberCheckIn.dart';
import '../../shared/providers/firebase_repository.provider.dart';
import '../entrance/entrance.notifier.dart';

part 'nfc_read.notifier.g.dart';

@riverpod
class NfcReadNotifier extends _$NfcReadNotifier {
  @override
  Member build() {
    return Member(
      "",
      "",
      "",
      "",
      false,
      [],
    );
  }

  void scanMember() async{
    try {
      NfcManager nfc = NfcManager.instance;
      if (!await nfc.isAvailable()) {
        print('NFC wird nicht unterstützt.');
        return; // NFC wird nicht unterstützt
      }

      // Starte die NFC-Session
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        // Beispiel für NDEF-Tag
        var ndef = Ndef.from(tag);
        if (ndef == null) {
          print('Kein NDEF-Tag entdeckt.');
          NfcManager.instance.stopSession();
          return;
        }

        // Lese NDEF-Nachricht
        NdefMessage? ndefMessage = ndef.cachedMessage;
        if (ndefMessage != null) {
          for (NdefRecord record in ndefMessage.records) {
            String recordType = utf8.decode(record.type);
            if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown) {
              if (recordType == 'T') {
                // Text auslesen
                var payload = record.payload;
                var languageCodeLength = payload[0];
                var text = utf8.decode(payload.sublist(1 + languageCodeLength));
                await loadUpdateMember(text);
              }
            }
          }
        }

        // Stoppe die NFC-Session
        NfcManager.instance.stopSession();
      });
    } catch (e) {
      print('Fehler beim Lesen der NFC-Karte: $e');
      return null;
    }
  }

  // Überprüfen, ob es heute bereits einen Check-In gibt
  bool hasCheckedInToday(Member member) {
    DateTime today = DateTime.now();

    // Durchlaufe die Liste der Check-Ins und überprüfe, ob ein Eintrag mit dem heutigen Datum vorhanden ist
    for (var checkIn in member.memberCheckIn) {
      if (isSameDay(checkIn.checkInDate, today)) {
        return true;
      }
    }
    return false;
  }

// Aktualisieren des Check-Ins für das heutige Datum, wenn bereits vorhanden
  void updateCheckInForToday(Member member) {
    DateTime today = DateTime.now()/*.add(Duration(days: 1))*/;

    for (var checkIn in member.memberCheckIn) {
      if (isSameDay(checkIn.checkInDate, today)) {
        checkIn.checkIn = true;  // Setze den Check-In auf true
        return;
      }
    }
  }

// Hilfsfunktion, um zu prüfen, ob zwei Datumswerte identisch sind
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

// Logik zur Aktualisierung des Members und des Check-Ins
  Future<void> loadUpdateMember(String memberNumber) async {
    var member = await ref.read(GetMemberRepoProvider(memberNumber).future);
    if (member == null) {
      return;
    }

    // Aktualisiere den Check-In, falls heute bereits ein Check-In existiert
    updateCheckInForToday(member);

    // Falls kein Check-In für heute vorhanden ist, füge einen neuen hinzu
    if (!hasCheckedInToday(member)) {
      var memberCheckIn = MemberCheckIn(DateTime.now(), true, false);
      member.memberCheckIn.add(memberCheckIn);
    }

    state = member;
    ref.read(UpdateMemberRepoProvider(member, null));
    ref.read(entranceNotifierProvider.notifier).addEntranceList(member);
  }
}
