import 'package:nfc_manager/nfc_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../update_member/update_member.notifier.dart';

part 'nfc_write.notifier.g.dart';

@riverpod
class NfcWriteNotifier extends _$NfcWriteNotifier {
  @override
  FutureOr<bool> build() async {
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
            NfcManager.instance
                .stopSession(errorMessage: 'Tag ist nicht beschreibbar');
            return;
          }

          final placeholders = ref.read(updateMemberNotifierProvider);
          if (placeholders.isEmpty) {
            state = const AsyncValue.data(false);
            return;
          }

          // Nur spezifische Schlüssel wie FIRSTNAME und LASTNAME speichern
          List<NdefRecord> records = [];

          if (placeholders.containsKey('{{FIRSTNAME}}')) {
            records.add(NdefRecord.createText('First Name: ${placeholders['{{FIRSTNAME}}']}'));
          }

          if (placeholders.containsKey('{{NUMBER}}')) {
            records.add(NdefRecord.createText('Mitgliedsnummer: ${placeholders['{{NUMBER}}']}'));
          }

          if (records.isEmpty) {
            NfcManager.instance.stopSession(errorMessage: 'Keine gültigen Daten zum Schreiben gefunden');
            state = const AsyncValue.data(false);
            return;
          }

          // NDEF-Nachricht mit den erstellten Records
          NdefMessage message = NdefMessage(records);

          try {
            await ndef.write(message);
            state = const AsyncValue.data(true);
            NfcManager.instance.stopSession();
          } catch (e) {
            NfcManager.instance.stopSession(errorMessage: e.toString());
          }
        });
      } catch (e) {
        state = const AsyncValue.data(false);
      }
    } else {
      state = const AsyncValue.data(false);
    }
  }
}
