import 'package:edge_sidebar/edge_side_bar_widget.dart';
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
    return const Scaffold(
      body: EdgeSideBar(
        edgeSideBarDirection: EdgeSideBarDirection.right,
        width: 80,
        borderRadius: 40,
        topOffset: 150,
        rightOffset: 0,
        initialExpanded: true,
        children: [
          _SidebarIcon(path: 'assets/EdgeLighting+ - Good Lock.png'),
          _SidebarIcon(path: 'assets/Samsung Walk Mode.png'),
          _SidebarIcon(path: 'assets/Ultra Data Saving.png'),
          _SidebarIcon(path: 'assets/VR Gallery.png'),
          _SidebarIcon(path: 'assets/Wi-Fi Calling.png'),
          _SidebarIcon(path: 'assets/Write on PDF.png'),
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
