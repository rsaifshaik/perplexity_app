import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: "All"),
            Tab(text: "Notifications"),
            Tab(text: "Badges"),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.android))
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          NotificationList(),
          Center(child: Text("No Invitations", style: TextStyle(fontSize: 16, color: Colors.grey))),
          NotificationList(),
        ],
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "Hey John! Join VIDWAN and test your knowledge in fun quizzes!",
      "time": "Last Wednesday at 9:42 AM"
    },
    {
      "title": "Daily Streak Alert! Keep your streak alive! Answer today’s quiz!",
      "time": "Last Wednesday at 9:42 AM"
    },
    {
      "title": "Congrats! You Won! You just defeated Richa and earned 100 points!",
      "time": "Last Wednesday at 9:42 AM"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(notifications[index]["title"]!, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(notifications[index]["time"]!, style: TextStyle(color: Colors.grey)),
        );
      },
    );
  }
}
