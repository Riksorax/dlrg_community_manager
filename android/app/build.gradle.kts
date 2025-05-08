import java.io.File
import java.io.FileInputStream
import java.util.Properties

// Funktion zum Laden der key.properties Datei
fun loadKeystoreProperties(): Properties {
    val properties = Properties()
    val keystorePropertiesFile = project.rootProject.file("key.properties") // Angenommen, key.properties ist im root Projektordner

    if (keystorePropertiesFile.exists()) {
        properties.load(FileInputStream(keystorePropertiesFile))
    } else {
        println("Warning: key.properties file not found at ${keystorePropertiesFile.absolutePath}. Release signing will likely fail.")
    }
    return properties
}

val keystoreProperties = loadKeystoreProperties()


plugins {
    id("com.android.application")
    id("kotlin-android")
    id ("com.google.gms.google-services")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "app.dlrg_cm.dlrgcommunitymanager"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.2.12479018" //flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    signingConfigs {
        getByName("debug").apply {
            // Prüfen, ob wir uns in einer CI-Umgebung befinden (z.B. GitHub Actions)
            // Wenn NICHT in CI, verwende die lokale Konfiguration.
            // Wenn in CI, wird die Standard-Debug-Signierung verwendet.
            val isCI = System.getenv().containsKey("CI") || System.getenv().containsKey("GITHUB_ACTIONS")

            if (!isCI) {
                // Diese Konfiguration wird NUR angewendet, wenn NICHT in CI.
                // Beachte: Das direkte Speichern von Passwörtern im Code ist unsicher!
                // Für lokale Entwicklung mag das akzeptabel sein, aber sei dir des Risikos bewusst.
                storeFile = file("C:/Users/Frank/.android/debug.keystore")
                storePassword = "Riksorax.04?07!1993" // <-- Unsicher im Code!
                keyPassword = "Riksorax.04?07!1993" // <-- Unsicher im Code!
                keyAlias = "debug" // Dieser Alias ist wahrscheinlich in Ordnung
            }
            // Wenn isCI true ist, werden storeFile, storePassword und keyPassword nicht gesetzt,
            // und Gradle verwendet die Standard-Debug-Signierung des Android SDK, die auf dem Runner verfügbar ist.
            // Der keyAlias 'debug' wird in der Regel auch standardmäßig verwendet, falls nötig, kann man ihn hier auch bedingt setzen.
        }

        create("release").apply {
            // Lese Konfiguration aus key.properties, nur wenn die Datei existiert und die Eigenschaft vorhanden ist
            if (keystoreProperties.containsKey("releaseStoreFile")) {
                storeFile = file(keystoreProperties["releaseStoreFile"] as String)
                storePassword = keystoreProperties["releaseStorePassword"] as String
                keyAlias = keystoreProperties["releaseKeyAlias"] as String
                keyPassword = keystoreProperties["releaseKeyPassword"] as String
            } else {
                println("Warning: Release signing properties not found in key.properties! Release build may not be signed correctly.")
                // Optional: Setze hier Dummy-Werte oder wirf einen Fehler, wenn Release-Signing zwingend ist
                // throw GradleException("Release signing properties not found in key.properties")
            }
        }
    }

    defaultConfig {
        applicationId = "app.dlrg_cm.dlrgcommunitymanager"
        minSdk = 23 //flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        getByName("release").apply {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}