import 'package:edge_sidebar/edge_side_bar_widget.dart';
import 'package:flutter/material.dart';

class EdgeSidePanelScaffold extends StatelessWidget {
  final Widget body;
  final EdgeSideBar sideBar;

  const EdgeSidePanelScaffold({
    super.key,
    required this.body,
    required this.sideBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          body,
          sideBar,
        ],
      ),
    );
  }
}
