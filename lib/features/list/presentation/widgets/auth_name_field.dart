import 'package:flutter/material.dart';

class AuthNameField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const AuthNameField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: 50,
      decoration: InputDecoration(
        label: Text(hintText),
      ),
      validator: (value) {
        if (value == null || value.isEmpty || value.trim().length <= 1) {
          return 'Must be between 1 and 50 characters.';
        }
        return null;
      },
    );
  }
}
