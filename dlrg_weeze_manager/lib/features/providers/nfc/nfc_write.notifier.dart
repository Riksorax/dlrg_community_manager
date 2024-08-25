import 'package:nfc_manager/nfc_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../update_member/update_member.notifier.dart';

part 'nfc_write.notifier.g.dart';

@riverpod
class NfcWriteNotifier extends _$NfcWriteNotifier {
  @override
  bool build() {
    return false;
  }

  void writeNfcCardAsync() async {
    if (await NfcManager.instance.isAvailable()) {
      try {
        // Starten der Session
        await NfcManager.instance.startSession(
            onDiscovered: (NfcTag tag) async {
          // NDEF (NFC Data Exchange Format) verwenden
          var ndef = Ndef.from(tag);
          if (ndef == null || !ndef.isWritable) {
            await NfcManager.instance
                .stopSession(errorMessage: 'Tag ist nicht beschreibbar');
            return;
          }

          final placeholders = ref.read(updateMemberNotifierProvider);
          if (placeholders.isEmpty) {
            state = false;
            return;
          }

          // Nur spezifische Schlüssel wie FIRSTNAME und LASTNAME speichern
          List<NdefRecord> records = [];

          if (placeholders.containsKey('{{FIRSTNAME}}')) {
            records.add(NdefRecord.createText(
                'First Name: ${placeholders['{{FIRSTNAME}}']}'));
          }

          if (placeholders.containsKey('{{NUMBER}}')) {
            records.add(NdefRecord.createText(
                'Mitgliedsnummer: ${placeholders['{{NUMBER}}']}'));
          }

          if (records.isEmpty) {
            await NfcManager.instance.stopSession(
                errorMessage: 'Keine gültigen Daten zum Schreiben gefunden');
            state = false;
            return;
          }

          // NDEF-Nachricht mit den erstellten Records
          NdefMessage message = NdefMessage(records);

          try {
            await ndef.write(message);

            //TODO Schreibschutz erst mal aus, abklären oder den angemacht werden soll
            //await ndef.writeLock();

            state = true;
            await NfcManager.instance.stopSession(alertMessage: 'Erfolgreich!');
          } catch (e) {
            await NfcManager.instance.stopSession(errorMessage: e.toString());
          }
        });
      } catch (e) {
        state = false;
      }
    } else {
      state = false;
    }
  }

  void resteState(){
    state = false;
  }
}
