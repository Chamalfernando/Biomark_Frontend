import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class CommonTopic extends StatelessWidget {
  final String topic;
  const CommonTopic({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      topic,
      style: const TextStyle(
        fontSize: 25.0,
        color: topicGreen,
      ),
    );
  }
}
