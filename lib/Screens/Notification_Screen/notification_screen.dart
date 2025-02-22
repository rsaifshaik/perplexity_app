import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications",style: TextStyle(fontSize: 28),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: IconButton(onPressed: () {},
                icon: Icon(Icons.chat)),
          ),
        ],
      ),
      body: Center(
        child: Text("Notification"),
      ),
    );
  }
}
