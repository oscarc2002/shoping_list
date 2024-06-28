import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final String buttonText;
  bool isSending;
  final VoidCallback onPressed;

  SaveButton({
    super.key,
    required this.buttonText,
    required this.isSending,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isSending
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(),
            )
          : const Text('Add item'),
    );
  }
}
