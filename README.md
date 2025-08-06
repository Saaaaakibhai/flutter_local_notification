# 🔔 Local Push Notification (Flutter)

Push notifications from the device using Flutter. This setup allows sending local notifications on both Android and iOS platforms.

---

## 📦 Dependencies

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_local_notifications: ^19.4.0
  permission_handler: ^11.0.1
```

---

## 🍏 iOS Configuration

Edit `ios/Runner/AppDelegate.swift`:

```swift
import UIKit
import Flutter
import flutter_local_notifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { registry in
      GeneratedPluginRegistrant.register(with: registry)
    }

    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

---

## 🤖 Android Configuration

### Step 1: Enable Java 11 and Desugaring

In `android/app/build.gradle.kts`, inside `android {}`:

```kotlin
compileOptions {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
    isCoreLibraryDesugaringEnabled = true // ✅ Enable desugaring
}
```

### Step 2: Add Desugaring Dependency

Inside `dependencies {}`:

```kotlin
coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
```

---

## 🔐 Android Permissions

In `android/app/src/main/AndroidManifest.xml`, add:

```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
```

---

## 📄 License

MIT License. You are free to use and modify.
