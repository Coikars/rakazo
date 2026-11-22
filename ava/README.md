# Ava

A small Flutter launcher for Alex's self-hosted Rakazo fork. It uses the Grok Bot-inspired icon in `assets/ava_icon.svg` and opens the fork in the device's browser.

## Build

```sh
flutter pub get
flutter run --dart-define=RAKAZO_URL=https://your-fork.example
flutter build apk --dart-define=RAKAZO_URL=https://your-fork.example
```

If no URL is supplied, Ava shows a placeholder and lets you enter the deployment address.

## Native launcher icons

The checked-in SVG is the single source of truth for the Android, iOS, Windows, and web launcher icons. Generate platform metadata/assets after `flutter pub get` with:

```sh
dart run flutter_launcher_icons
```

The generator writes the native icon files under the generated platform folders and does not modify `assets/ava_icon.svg`. If those folders are absent in a lightweight checkout, create them first:

```sh
flutter create --platforms=android,ios,windows,web .
```
