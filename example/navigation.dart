import 'package:edge_sidebar/edge_side_bar.dart';
import 'package:flutter/material.dart';

import 'dashed_divider.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Screen A')),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Screen B')),
    );
  }
}

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Screen C')),
    );
  }
}

class _SidebarIcon extends StatelessWidget {
  final String path;
  final VoidCallback onTap;

  const _SidebarIcon({required this.path, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onTap,
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
      ),
    );
  }
}

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
            children: [
              _SidebarIcon(
                path: 'assets/EdgeLighting+ - Good Lock.png',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ScreenA())),
              ),
              _SidebarIcon(
                path: 'assets/Samsung Walk Mode.png',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ScreenB())),
              ),
              _SidebarIcon(
                path: 'assets/Ultra Data Saving.png',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ScreenC())),
              ),
              const DashedDivider(),
              _SidebarIcon(
                path: 'assets/VR Gallery.png',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ScreenA())),
              ),
              _SidebarIcon(
                path: 'assets/Wi-Fi Calling.png',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ScreenB())),
              ),
              _SidebarIcon(
                path: 'assets/Write on PDF.png',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ScreenC())),
              ),
            ],
          )
        ],
      ),
    );
  }
}
