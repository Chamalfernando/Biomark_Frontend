import 'package:biomark/resources/theme.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:flutter/material.dart';

class EditNormalProfileDetails extends StatefulWidget {
  const EditNormalProfileDetails({super.key});

  @override
  State<EditNormalProfileDetails> createState() =>
      _EditNormalProfileDetailsState();
}

class _EditNormalProfileDetailsState extends State<EditNormalProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile Details',
        ),
        backgroundColor: primaryGreen,
        centerTitle: true,
      ),
      body: const CommonTopic(
        topic: 'Edit Profile Details',
      ),
    );
  }
}
