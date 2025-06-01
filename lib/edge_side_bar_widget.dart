import 'package:flutter/material.dart';

/// Enum to define the direction of the sidebar
enum EdgeSideBarDirection {
  left,
  right,
  top,
  bottom,
}

class EdgeSideBar extends StatefulWidget {
  /// List of widgets to show inside the sidebar
  final List<Widget> children;

  /// Width of the sidebar
  final double width;

  /// Height of the sidebar (used for top/bottom directions)
  final double height;

  /// Background color of the sidebar
  final Color backgroundColor;

  /// Default color for the toggle button when not provided
  final Color defaultToggleColor;

  /// Border radius for the sidebar container
  final double borderRadius;

  /// Duration for the slide animation
  final Duration animationDuration;

  /// Whether the sidebar should be initially expanded or not
  final bool initialExpanded;

  /// Toggle button widget to show when sidebar is collapsed
  final Widget? toggleButton;

  /// Direction from which the sidebar should appear (left, right, top, or bottom)
  final EdgeSideBarDirection edgeSideBarDirection;

  /// Top position of the sidebar from the screen
  final double topOffset;

  /// Left position of the sidebar from the screen
  final double sidebarLeftOffset;

  /// Top position of the toggle button from the screen
  final double toggleTopOffset;

  /// Left position of the toggle button from the screen
  final double toggleLeftOffset;

  /// Width and height of the toggle button when custom one is not provided
  final double toggleButtonWidth;
  final double toggleButtonHeight;

  /// Border color for the default toggle button
  final Color toggleButtonBorderColor;

  /// Optional right offset for the sidebar when expanded
  final double? rightOffset;

  const EdgeSideBar({
    super.key,
    required this.children,
    this.width = 70,
    this.height = 200,
    this.backgroundColor = Colors.white,
    this.borderRadius = 30,
    this.animationDuration = const Duration(milliseconds: 300),
    this.initialExpanded = true,
    this.toggleButton,
    this.edgeSideBarDirection = EdgeSideBarDirection.right,
    this.topOffset = 170,
    this.sidebarLeftOffset = 0,
    this.toggleTopOffset = 80,
    this.toggleLeftOffset = 0,
    this.toggleButtonWidth = 10,
    this.toggleButtonHeight = 150,
    this.toggleButtonBorderColor = const Color(0xFF9E9E9E),
    this.defaultToggleColor = Colors.white12,
    this.rightOffset,
  });

  @override
  State<EdgeSideBar> createState() => _EdgeSideBarState();
}

class _EdgeSideBarState extends State<EdgeSideBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initialExpanded;

    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    // Slide direction based on sidebar position
    Offset begin;
    switch (widget.edgeSideBarDirection) {
      case EdgeSideBarDirection.left:
        begin = const Offset(-1, 0);
        break;
      case EdgeSideBarDirection.right:
        begin = const Offset(1, 0);
        break;
      case EdgeSideBarDirection.top:
        begin = const Offset(0, -1);
        break;
      case EdgeSideBarDirection.bottom:
        begin = const Offset(0, 1);
        break;
    }

    _slideAnimation = Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _isExpanded ? _controller.forward() : _controller.reverse();
  }

  void _toggleSidebar() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLeft = widget.edgeSideBarDirection == EdgeSideBarDirection.left;
    final isTop = widget.edgeSideBarDirection == EdgeSideBarDirection.top;
    final isBottom = widget.edgeSideBarDirection == EdgeSideBarDirection.bottom;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Overlay to detect taps outside the sidebar when expanded
          Positioned.fill(
            child: IgnorePointer(
              ignoring: !_isExpanded,
              child: GestureDetector(
                onTap: _toggleSidebar,
                behavior: HitTestBehavior.translucent,
              ),
            ),
          ),

          // Sidebar panel
          AnimatedPositioned(
            duration: widget.animationDuration,
            top: isTop
                ? (_isExpanded ? widget.topOffset : -(widget.height + 40))
                : isBottom
                    ? null
                    : widget.topOffset,
            bottom: isBottom ? (_isExpanded ? 0 : -(widget.height + 40)) : null,
            left: isLeft
                ? (_isExpanded
                    ? widget.sidebarLeftOffset
                    : -(widget.width + 40))
                : isTop || isBottom
                    ? widget.sidebarLeftOffset
                    : null,
            right: isLeft
                ? null
                : (_isExpanded
                    ? (widget.rightOffset ?? 0)
                    : -(widget.width + 40)),
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: isTop || isBottom ? 0 : 40,
                  horizontal: isTop || isBottom ? 40 : 0,
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: isTop || isBottom ? widget.width : widget.width,
                height: isTop || isBottom ? widget.height : null,
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection:
                      isTop || isBottom ? Axis.horizontal : Axis.vertical,
                  child: isTop || isBottom
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.children,
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.children,
                        ),
                ),
              ),
            ),
          ),

          // Toggle button shown only when sidebar is collapsed
          if (!_isExpanded)
            Positioned(
              top: isTop
                  ? 0
                  : isBottom
                      ? null
                      : widget.toggleTopOffset,
              bottom: isBottom ? 0 : null,
              left: isLeft
                  ? 0
                  : isTop || isBottom
                      ? widget.toggleLeftOffset
                      : null,
              right: isLeft ? null : 0,
              child: GestureDetector(
                onTap: _toggleSidebar,
                child: widget.toggleButton ??
                    Container(
                      height: isTop || isBottom
                          ? widget.toggleButtonHeight
                          : widget.toggleButtonHeight,
                      width: isTop || isBottom
                          ? widget.toggleButtonWidth
                          : widget.toggleButtonWidth,
                      decoration: BoxDecoration(
                        color: widget.defaultToggleColor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: widget.toggleButtonBorderColor,
                        ),
                      ),
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
