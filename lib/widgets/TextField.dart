import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String controller;
  final String labelText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  get controller => null;

  get labelText => null;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: AppColors.primaryGreen,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(
        height: 2.5,
      ),
    );
  }
}
