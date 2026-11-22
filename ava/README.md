# Ava
A small Flutter launcher for Alex's self-hosted Rakazo fork. It uses a Grok Bot-inspired icon and opens the fork in the device's browser.
## Build
```sh
flutter pub get
flutter run --dart-define=RAKAZO_URL=https://your-fork.example
flutter build apk --dart-define=RAKAZO_URL=https://your-fork.example
```
If no URL is supplied, Ava shows a placeholder and lets you enter the deployment address.
