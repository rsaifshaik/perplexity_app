import 'package:flutter/material.dart';

class ChatspaceScreen extends StatefulWidget {
  const ChatspaceScreen({super.key});

  @override
  State<ChatspaceScreen> createState() => _ChatspaceScreenState();
}

class _ChatspaceScreenState extends State<ChatspaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Chat Space"),
      )
    );
  }
}
