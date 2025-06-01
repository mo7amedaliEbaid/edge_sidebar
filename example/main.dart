import 'package:edge_sidebar/edge_side_bar.dart';
import 'package:flutter/material.dart';

import 'dashed_divider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Edge Panel Demo',
      debugShowCheckedModeBanner: false,
      home: ScreenA(),
    );
  }
}

// Enum to identify current screen
enum ScreenType { screenA, screenB, screenC }

// =================== SCREENS ===================

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWithSidePanel(
        context,
        ScreenType.screenA,
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    _buildFeatureCard(
                      'Notifications',
                      'Customize notification effects',
                      Icons.notifications_active,
                    ),
                    _buildFeatureCard(
                      'Edge Lighting',
                      'Adjust edge lighting style',
                      Icons.lightbulb_outline,
                    ),
                    _buildFeatureCard(
                      'Colors',
                      'Choose your favorite colors',
                      Icons.color_lens,
                    ),
                    _buildFeatureCard(
                      'Effects',
                      'Select animation effects',
                      Icons.animation,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildFeatureCard(String title, String subtitle, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWithSidePanel(
        context,
        ScreenType.screenB,
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              _buildStatsCard(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildActivityItem(
                      'Morning Walk',
                      '30 minutes',
                      '2.5 km',
                      Icons.directions_walk,
                    ),
                    _buildActivityItem(
                      'Evening Run',
                      '45 minutes',
                      '4.2 km',
                      Icons.directions_run,
                    ),
                    _buildActivityItem(
                      'Weekend Hike',
                      '2 hours',
                      '6.8 km',
                      Icons.hiking,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildStatsCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem('Steps', '8,432', Icons.directions_walk),
            _buildStatItem('Distance', '5.2 km', Icons.route),
            _buildStatItem('Calories', '320', Icons.local_fire_department),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(
      String title, String duration, String distance, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(title),
        subtitle: Text(duration),
        trailing: Text(
          distance,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWithSidePanel(
        context,
        ScreenType.screenC,
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   'Data Saving',
              //   style: TextStyle(
              //     fontSize: 32,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //   ),
              // ),
              const SizedBox(height: 70),
              _buildDataUsageCard(),
              const SizedBox(height: 20),
              const Text(
                'Data Usage by App',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //    const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    _buildAppDataItem('Chrome', '1.2 GB', 0.8),
                    _buildAppDataItem('YouTube', '850 MB', 0.6),
                    _buildAppDataItem('Instagram', '620 MB', 0.4),
                    _buildAppDataItem('WhatsApp', '450 MB', 0.3),
                    _buildAppDataItem('Facebook', '380 MB', 0.25),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildDataUsageCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Monthly Data Usage',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: 0.65,
                    strokeWidth: 15,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      '3.5 GB',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'of 5 GB',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppDataItem(String appName, String usage, double percentage) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  usage,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

// =================== SIDEBAR WRAPPER ===================

Widget buildWithSidePanel(
    BuildContext context, ScreenType selectedScreen, Widget bodyContent) {
  return EdgeSidePanelScaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFFFC2D7), Color(0xFFB4D5FF)],
        ),
      ),
      child: bodyContent,
    ),
    sideBar: EdgeSideBar(
      edgeSideBarDirection: EdgeSideBarDirection.right,
      topOffset: 150,
      rightOffset: 10,
      width: 80,
      //    height: 100,
      borderRadius: 36,
      backgroundColor: Colors.white.withOpacity(0.7),
      defaultToggleColor: const Color(0xFFACC9D8),
      initialExpanded: false,
      children: [
        _SidebarIcon(
          path: 'assets/EdgeLighting+ - Good Lock.png',
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ScreenA()),
          ),
          selected: selectedScreen == ScreenType.screenA,
        ),
        _SidebarIcon(
          path: 'assets/Samsung Walk Mode.png',
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ScreenB()),
          ),
          selected: selectedScreen == ScreenType.screenB,
        ),
        _SidebarIcon(
          path: 'assets/Ultra Data Saving.png',
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ScreenC()),
          ),
          selected: selectedScreen == ScreenType.screenC,
        ),
        const DashedDivider(),
        _SidebarIcon(
          path: 'assets/VR Gallery.png',
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const ScreenA())),
        ),
        _SidebarIcon(
          path: 'assets/Wi-Fi Calling.png',
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const ScreenB())),
        ),
        _SidebarIcon(
          path: 'assets/Write on PDF.png',
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const ScreenC())),
        ),
      ],
    ),
  );
}

// =================== ICON WIDGET ===================

class _SidebarIcon extends StatelessWidget {
  final String path;
  final VoidCallback onTap;
  final bool selected;

  const _SidebarIcon({
    required this.path,
    required this.onTap,
    this.selected = false,
  });

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
            border: selected
                ? Border.all(color: Colors.blueAccent, width: 2)
                : null,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(path, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
