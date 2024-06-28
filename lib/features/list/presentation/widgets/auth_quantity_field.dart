import 'package:flutter/material.dart';

class AuthQuantityField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const AuthQuantityField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(hintText),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            int.tryParse(value) == null ||
            int.tryParse(value)! <= 0) {
          return 'Must be a valid positive number.';
        }
        return null;
      },
    );
  }
}
