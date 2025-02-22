import 'package:flutter/material.dart';

class VidvanApp extends StatefulWidget {
  const VidvanApp({super.key});

  @override
  State<VidvanApp> createState() => _VidvanAppState();
}

class _VidvanAppState extends State<VidvanApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Vidvan"),
      ),
    );
  }
}
