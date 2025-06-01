# dock_bounce_icon

A Flutter package inspired by the **bouncing behavior of macOS Dock icons**. This package provides customizable bounce animation widgets with optional sound effects, perfect for creating engaging and interactive icon-based UIs.



## 📺 Demo

Tap to see it in action:

👉 [**Watch Demo Video**](https://www.youtube.com/watch?v=2a8VWyNKbmc)



## ✨ Features

- Smooth bounce animation on icon tap
- Optional sound effects with each bounce
- Supports bounce sequence customization: height, count, interval, curve
- Prebuilt `BottomNavigationBar` alternative with bounce effects
- Easily integrates into any Flutter app

---

## 📦 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  dock_bounce_icon: ^0.0.1-beta.4
````

Then run:

```bash
flutter pub get
```

---

## 🛠️ Usage

### 1. Basic Bounce Icon

```dart
import 'package:dock_bounce_icon/dock_bounce.dart';
import 'package:flutter/material.dart';

  Center(
        child: DockBounceIcon(
          bounceHeight: 40,
          duration: const Duration(milliseconds: 600),
          soundAsset: 'sounds/heartbeat.mp3',
          bounceCount: 12,
          onBounceStart: () => debugPrint("Bounce started"),
          onBounceEnd: () => debugPrint("Bounce ended"),
          onTap: () => debugPrint("Icon tapped"),
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
        ),
      ),
```

### 2. Dock-Style Bottom Navigation Bar

```dart
DockBounceNavigationBar(
  bounceCount: 3,
  bounceHeight: 40,
  bottomNavigationBarElevation: 0,
  iconPadding: const EdgeInsets.only(bottom: 25),
  items: [
    DockBounceNavigationItem(
      icon: Icon(Icons.home, size: 50, color: Colors.blue),
      soundAsset: 'sounds/home.wav',
      page: Center(child: Text('Home Page')),
    ),
    DockBounceNavigationItem(
      icon: Icon(Icons.settings, size: 50, color: Colors.green),
      soundAsset: 'sounds/settings.wav',
      page: Center(child: Text('Settings Page')),
    ),
    DockBounceNavigationItem(
      icon: Icon(Icons.person, size: 50, color: Colors.purple),
      soundAsset: 'assets/sounds/heartbeat.mp3',
      page: Center(
        child: DockBounceIcon(
          bounceHeight: 40,
          bounceCount: 12,
          soundAsset: sounds/heartbeat.mp3',
          child: Icon(Icons.favorite, size: 40, color: Colors.red),
        ),
      ),
    ),
  ],
)
```

---

## 🎛️ API Reference

### `DockBounceIcon`

| Property         | Type            | Description                                     |
| ---------------- | --------------- | ----------------------------------------------- |
| `child`          | `Widget`        | The icon or widget to animate.                  |
| `bounceHeight`   | `double`        | Maximum bounce height.                          |
| `duration`       | `Duration`      | Time it takes to complete one bounce.           |
| `bounceCount`    | `int`           | How many times the bounce repeats.              |
| `bounceInterval` | `Duration`      | Delay between bounces in a sequence.            |
| `bounceOutCurve` | `Curve`         | Curve used when bouncing down.                  |
| `soundAsset`     | `String?`       | Optional sound asset to play during bounce.     |
| `audioPlayer`    | `AudioPlayer?`  | Optional custom audio player instance.          |
| `onTap`          | `VoidCallback?` | Callback for tap event.                         |
| `onBounceStart`  | `VoidCallback?` | Called when bounce starts.                      |
| `onBounceEnd`    | `VoidCallback?` | Called when bounce ends.                        |
| `enableQueue`    | `bool`          | If false, disables bounce while one is running. |

### `DockBounceNavigationBar`

A bottom navigation bar built with bouncing icon behavior.

| Property                       | Type                             | Description                          |
| ------------------------------ | -------------------------------- | ------------------------------------ |
| `items`                        | `List<DockBounceNavigationItem>` | Navigation items with bounce + page. |
| `bounceCount`                  | `int`                            | Number of bounces on item tap.       |
| `bounceHeight`                 | `double`                         | Bounce height.                       |
| `bounceDuration`               | `Duration`                       | Duration of each bounce.             |
| `bounceInterval`               | `Duration`                       | Interval between bounce repetitions. |
| `bounceOutCurve`               | `Curve`                          | Curve for bounce return.             |
| `bottomNavigationBarElevation` | `double`                         | Elevation of nav bar.                |
| `bottomNavigationBarColor`     | `Color`                          | Background color of nav bar.         |
| `iconPadding`                  | `EdgeInsets`                     | Padding for icons.                   |

---

## 📁 Assets

Ensure your sound files are added in your `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/sounds/heartbeat.mp3
    - assets/sounds/home.wav
    - assets/sounds/settings.wav
```

---

## 💡 Inspiration

This package is **inspired by the interactive bouncing behavior of icons in the macOS Dock**, which gives users a playful, responsive visual cue. The goal is to bring similar joy and feedback into mobile applications built with Flutter.


## 🚧 Roadmap

* [ ] Add bounce direction options (e.g., left/right)
* [ ] Support Lottie animations alongside bounce
* [ ] Dark mode styles for default nav bar

---

## 📄 License

[MIT License](https://github.com/mo7amedaliEbaid/bounce_icon/blob/main/LICENSE)

---

## 🔗 Links

* [GitHub Repository](https://github.com/mo7amedaliEbaid/bounce_icon.git)
* [Issues & Feedback](https://github.com/mo7amedaliEbaid/bounce_icon/issues)


