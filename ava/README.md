# Ava Flutter client

A small cross-platform launcher named **Ava** for Alex's forked Rakazo app. It opens the configured Rakazo deployment in the device's default browser; it never hardcodes the official hosted account.

## Configure and run

From this directory:

```bash
flutter pub get
flutter run --dart-define=RAKAZO_URL=https://your-rakazo-fork.example
```

If the platform folders are not present in a checkout, generate them once:

```bash
flutter create --platforms=android,ios,windows,web .
dart run flutter_launcher_icons
```

Build examples:

```bash
flutter build apk --dart-define=RAKAZO_URL=https://your-rakazo-fork.example
flutter build windows --dart-define=RAKAZO_URL=https://your-rakazo-fork.example
flutter build web --dart-define=RAKAZO_URL=https://your-rakazo-fork.example
```

`RAKAZO_URL` defaults to a safe placeholder and must be supplied for a real deployment. The icon is the white rounded-square mark with a black abstract X/eyes design.
