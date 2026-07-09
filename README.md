# Sprout 🌱

A basic Flutter starter app — a simple counter screen with light/dark theme support, meant as a clean foundation to build on.

## Getting Started

1. Make sure you have the [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
2. Clone this repo.
3. Run:
   ```
   flutter pub get
   flutter run
   ```

## Running on Windows

Windows desktop support has been scaffolded (`windows/` folder — CMake build files and a Win32 runner). To run it:

```
flutter config --enable-windows-desktop
flutter pub get
flutter run -d windows
```

**Note:** Flutter regenerates a few files under `windows/flutter/` (an `ephemeral/` folder and `generated_plugins.cmake`) automatically on `flutter pub get` — these are version-matched to your installed Flutter SDK, so don't hand-edit them. If the build ever complains about missing CMake config in that folder, running:
```
flutter create --platforms=windows .
```
from the project root will safely regenerate/repair just the Windows platform files without touching `lib/` or your other code.

## Project Structure

- `lib/main.dart` — app entry point and the single counter screen
- `android/` — Android platform project (package: `com.jmaxwell01.sprout_app`)
- `test/widget_test.dart` — basic widget test

## Next Steps

This is intentionally minimal — a blank slate ready for features to be added on top.
