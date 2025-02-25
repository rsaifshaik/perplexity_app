import 'package:flutter/material.dart';
import 'package:perplexity_app/Screens/Chatspace_Screen/Chatspace_screen.dart';
import 'package:perplexity_app/Screens/Discover_Screen/discover_screen.dart';
import 'package:perplexity_app/Screens/Notification_Screen/notification_screen.dart';
import 'package:perplexity_app/Screens/Vidvan_app/vidvan_app.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DiscoverScreen(),
    ChatspaceScreen(),
    NotificationScreen(),
    Vidvan_app(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Line at the top of BottomNavigationBar
          Container(
            height: 1, // Line thickness
            color: Colors.grey[300], // Line color
          ),
          NavigationBarTheme(
            data: NavigationBarThemeData(),
            child: NavigationBar(
                backgroundColor: Colors.white,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) =>
                    setState(() => _selectedIndex = index),
                destinations: [
                  NavigationDestination(
                      icon: Icon(Icons.explore,
                          color: _selectedIndex == 0 ? Colors.blue : Colors.black),
                      label: 'Chat'),
                  NavigationDestination(
                      icon: Icon(Icons.chat,
                          color: _selectedIndex == 1 ? Colors.blue : Colors.black),
                      label: 'Home'),
                  NavigationDestination(
                      icon: Icon(Icons.notifications,
                          color: _selectedIndex == 2 ? Colors.blue : Colors.black),
                      label: 'History'),
                  NavigationDestination(
                      icon: Icon(Icons.sports_esports,
                          color: _selectedIndex == 3 ? Colors.blue : Colors.black),
                      label: 'Profile'),
                ],
            ),
          ),
        ],
      ),
    );
  }
}
