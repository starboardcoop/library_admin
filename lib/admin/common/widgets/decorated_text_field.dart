import 'package:flutter/material.dart';

class DecoratedTextField extends StatelessWidget {
  const DecoratedTextField({
    super.key,
    required this.labelText,
    this.controller,
  });

  final String labelText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      textCapitalization: TextCapitalization.words,
      controller: controller,
    );
  }
}
