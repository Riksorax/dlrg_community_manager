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
            storeFile = file("C:/Users/Frank/.android/debug.keystore")
            storePassword = "Riksorax.04?07!1993"
            keyPassword = "Riksorax.04?07!1993"
            keyAlias = "debug"
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