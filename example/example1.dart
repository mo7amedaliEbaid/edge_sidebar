import 'package:edge_sidebar/edge_side_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Edge Side Panel Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          // Background gradient to simulate Samsung home screen
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFFFC2D7), // light pink
                  Color(0xFFB4D5FF), // soft blue
                ],
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '32°',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                Text('Partly Cloudy', style: TextStyle(fontSize: 18)),
                Text('Cairo', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),

          // Samsung-style sidebar
          EdgeSideBar(
            edgeSideBarDirection: EdgeSideBarDirection.right,
            width: 80,
            borderRadius: 36,
            topOffset: 150,
            rightOffset: 0,
            initialExpanded: true,
            backgroundColor: Colors.white.withOpacity(0.7),
            children: const [
              _SidebarIcon(path: 'assets/EdgeLighting+ - Good Lock.png'),
              _SidebarIcon(path: 'assets/Samsung Walk Mode.png'),
              _SidebarIcon(path: 'assets/Ultra Data Saving.png'),
              _DashedDivider(),
              _SidebarIcon(path: 'assets/VR Gallery.png'),
              _SidebarIcon(path: 'assets/Wi-Fi Calling.png'),
              _SidebarIcon(path: 'assets/Write on PDF.png'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SidebarIcon extends StatelessWidget {
  final String path;

  const _SidebarIcon({required this.path});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(path, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 1,
      width: 40,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final boxWidth = constraints.constrainWidth();
          const dashWidth = 4.0;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount, (_) {
              return const SizedBox(
                width: dashWidth,
                height: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
