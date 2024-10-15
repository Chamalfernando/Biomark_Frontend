import 'package:flutter/material.dart';

class NormalProfileScreen extends StatefulWidget {
  const NormalProfileScreen({super.key});

  @override
  State<NormalProfileScreen> createState() => _NormalProfileScreenState();
}

class _NormalProfileScreenState extends State<NormalProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen')),
      body: Column(
        children: [],
      ),
    );
  }
}
