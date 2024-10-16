import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class PACCreatingScreen extends StatefulWidget {
  const PACCreatingScreen({super.key});

  @override
  State<PACCreatingScreen> createState() => _PACCreatingScreenState();
}

class _PACCreatingScreenState extends State<PACCreatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAC Creation'),
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
