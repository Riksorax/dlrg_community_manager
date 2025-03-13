# DLRG Weeze Manager

## Beschreibung

Die "DLRG Weeze Manager"-App ist eine interne Verwaltungsanwendung für die DLRG Weeze, die speziell für Android entwickelt wurde. Sie dient der effizienten Verwaltung von Schwimmtrainingsangelegenheiten, einschließlich der Erstellung von Mitgliedsausweisen und der Verfolgung der Teilnehmer beim Einlass an Trainingstagen.

## Funktionen und Features

* **Mitgliedsverwaltung**: Erstellung und Verwaltung von Mitgliedsausweisen.
* **Teilnehmerverfolgung**: Erfassung der Anwesenheit von Mitgliedern beim Einlass zu Trainingstagen.
* **NFC-Integration**: Beschreiben, Bedrucken und Auslesen von Daten von NFC-Karten.
* **Firebase Realtime Database**: Datenspeicherung und -abruf über die Firebase Realtime Database.

## Installation und Einrichtung

1.  **Flutter-Version**: Stellen Sie sicher, dass Sie Flutter 3.29.2 und Dart 3.7.2 oder höher installiert haben.
2.  **Abhängigkeiten**: Alle erforderlichen Flutter-Packages sind in der `pubspec.yaml`-Datei aufgeführt.
3.  **Firebase-Konfiguration**: Richten Sie ein Firebase-Projekt ein und konfigurieren Sie die App entsprechend.
4.  **Ausführung**: Führen Sie die App auf einem physischen Android-Gerät oder einem Emulator mit `flutter run` aus.

## Projektstruktur

Die wichtigsten Verzeichnisse sind:

* `lib/`: Enthält den Großteil des Dart-Codes.
    * `lib/features/providers`: Hier befinden sich die Services der App.
    * `lib/features/presentation`: Enthält die Widgets der Benutzeroberfläche.
* `test/`: Enthält Unit- und Integrationstests (derzeit noch nicht vorhanden).
* `assets/`: Enthält statische Assets wie Bilder und Konfigurationsdateien.

## Abhängigkeiten

Die Liste der verwendeten Flutter-Packages mit Versionsnummern finden Sie in der `pubspec.yaml`-Datei.

## Tests

Derzeit sind noch keine Unit-Tests oder Integrationstests vorhanden.

## Beitrag zum Projekt

Beiträge zum Projekt sind willkommen. Bitte beachten Sie die folgenden Richtlinien:

* **Coding-Richtlinien**: [Hier können Sie Ihre Coding-Richtlinien oder Ihren Styleguide verlinken, falls vorhanden]
* **Fehler melden**: Melden Sie Fehler und neue Feature-Anfragen im Issue-Tracker des Repositorys.

## Lizenz

Dieses Projekt ist unter der [MIT-Lizenz](https://opensource.org/licenses/MIT) lizenziert.

## Zusätzliche Informationen

* **GitHub Actions**: Das Projekt verfügt über eine GitHub Actions-Konfiguration für den automatischen Build der App.
* **Screenshots/Videos**: [Hier können Sie später Screenshots oder Videos der App einfügen]
* **Projekt-Website/Dokumentation**: Derzeit nicht vorhanden.

## Kontakt

Bei Fragen oder Anregungen können Sie sich gerne an [riksorax25@gmail.com] wenden.
