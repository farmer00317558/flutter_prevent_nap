# flutter_prevent_nap

A Flutter plugin to prevent app into app nap state.

## Usage

```dart
final preventNap = FlutterPreventNap();
final key = await preventNap.beginActivity("");

// do something important

preventNap.endActivity(key);
```