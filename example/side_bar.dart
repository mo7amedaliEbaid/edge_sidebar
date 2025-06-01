import 'dart:developer';

import 'package:edge_sidebar/edge_side_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edge Side Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edge Side Bar Example'),
        actions: [
          IconButton(
            icon: Icon(_isExpanded ? Icons.menu_open : Icons.menu),
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
        ],
      ),
      body: EdgeSideBar(
        edgeSideBarDirection: EdgeSideBarDirection.right,
        initialExpanded: false,
        rightOffset: 10,
        children: [
          _buildIconItem(Icons.calculate, () => log("Calculator")),
          _buildIconItem(Icons.photo, () => log("Gallery")),
          _buildIconItem(Icons.message, () => log("Messages")),
        ],
      ),
    );
  }

  Widget _buildIconItem(IconData iconData, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(iconData, size: 28, color: Colors.black),
        ),
      ),
    );
  }
}
