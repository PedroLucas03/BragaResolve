import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Row(
        children: [
          Expanded(
            child: Container(height: 1, color: Colors.grey[300]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Expanded(
            child: Container(height: 1, color: Colors.grey[300]),
          ),
        ],
      ),
    );
  }
}