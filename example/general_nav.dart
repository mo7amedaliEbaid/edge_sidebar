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
      home: ScreenA(),
    );
  }
}

class SamsungSidePanelScaffold extends StatelessWidget {
  final Widget body;

  const SamsungSidePanelScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          body, // Main screen content
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
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const ScreenA())),
              ),
              _SidebarIcon(
                path: 'assets/Samsung Walk Mode.png',
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const ScreenA())),
              ),
            ],
          ),
        ],
      ),
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

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return SamsungSidePanelScaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFFFC2D7),
              Color(0xFFB4D5FF),
            ],
          ),
        ),
        child: const Center(
          child: Text('Screen A', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
