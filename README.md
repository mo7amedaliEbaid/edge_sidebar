# Edge Side Bar

A Flutter package that provides a customizable side panel widget inspired by Samsung's Edge Panel. This widget can be positioned on any side of the screen (left, right, top, or bottom) and includes smooth animations, customizable styling, and a flexible layout system.

## 📺 Demo

Tap to see it in action:

👉 [**Watch Demo Video**](https://youtube.com/shorts/zehq_kdwdYA?si=f__FXDveljRuWQMT)


## Features

- 🎯 Multiple positioning options (left, right, top, bottom)
- 🎨 Fully customizable appearance
- ⚡ Smooth animations and transitions
- 📱 Responsive design
- 🎮 Customizable toggle button
- 🔄 Support for both vertical and horizontal layouts
- 🎯 Precise positioning control
- 🎨 Gradient background support
- 📱 Safe area awareness

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  edge_sidebar: ^0.0.1
```

## Usage

### Basic Implementation

```dart
import 'package:flutter/material.dart';
import 'package:edge_sidebar/edge_side_bar.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: EdgeSideBar(
          edgeSideBarDirection: EdgeSideBarDirection.right,
          children: [
            // Your sidebar items here
          ],
        ),
      ),
    );
  }
}
```

### Using EdgeSidePanelScaffold

```dart
import 'package:flutter/material.dart';
import 'package:edge_sidebar/edge_side_bar.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EdgeSidePanelScaffold(
        body: YourMainContent(),
        sideBar: EdgeSideBar(
          edgeSideBarDirection: EdgeSideBarDirection.right,
          children: [
            // Your sidebar items here
          ],
        ),
      ),
    );
  }
}
```

### Advanced Implementation

```dart
EdgeSideBar(
  edgeSideBarDirection: EdgeSideBarDirection.right,
  triggerMode: SidebarTriggerMode.both,
  topOffset: 150,
  rightOffset: 10,
  width: 80,
  height: 200,
  borderRadius: 36,
  backgroundColor: Colors.white.withOpacity(0.7),
  defaultToggleColor: const Color(0xFFACC9D8),
  initialExpanded: false,
  children: [
    // Your sidebar items here
  ],
)
```

## 🎛️ API Reference

### `EdgeSideBar` Parameters

| Property | Type | Default | Description                                         |
|----------|------|---------|-----------------------------------------------------|
| `edgeSideBarDirection` | `EdgeSideBarDirection` | EdgeSideBarDirection.right | Direction of the sidebar (left, right, top, bottom) |
| `triggerMode` | `SidebarTriggerMode` | SidebarTriggerMode.both | How the sidebar can be triggered (tap, swipe, both) |
| `children` | `List<Widget>` | Required | List of widgets to display in the sidebar           |
| `width` | `double` | 80 | Width of the sidebar                                |
| `height` | `double` | 200 | Height of the sidebar                               |
| `topOffset` | `double` | 0 | Distance from the top of the screen                 |
| `rightOffset` | `double` | 0 | Distance from the right edge                        |
| `sidebarLeftOffset` | `double` | 0 | Distance from the left edge                         |
| `toggleTopOffset` | `double` | 0 | Distance of the toggle button from the top          |
| `toggleLeftOffset` | `double` | 0 | Distance of the toggle button from the left         |
| `borderRadius` | `double` | 36 | Border radius of the sidebar                        |
| `backgroundColor` | `Color` | Colors.white | Background color of the sidebar                     |
| `defaultToggleColor` | `Color` | Color(0xFFACC9D8) | Color of the toggle button                          |
| `initialExpanded` | `bool` | false | Whether the sidebar is initially expanded           |
| `toggleButton` | `Widget?` | null | Custom toggle button widget                         |
| `onToggle` | `Function(bool)?` | null | Callback when the sidebar is toggled                |
| `onExpanded` | `VoidCallback?` | null | Callback when the sidebar is expanded               |
| `onCollapsed` | `VoidCallback?` | null | Callback when the sidebar is collapsed              |

### `EdgeSidePanelScaffold` Parameters

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `body` | `Widget` | Required | The main content of the screen |
| `sideBar` | `EdgeSideBar` | Required | The sidebar widget to display |

## Example

Check out the [example](https://github.com/mo7amedaliEbaid/edge_sidebar/tree/main/example) directory for a complete implementation.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have questions, please [open an issue](https://github.com/mo7amedaliEbaid/edge_sidebar/issues).

## 🔗 Links

* [GitHub Repository](https://github.com/mo7amedaliEbaid/edge_sidebar.git)
* [Issues & Feedback](https://github.com/mo7amedaliEbaid/edge_sidebar/issues)
