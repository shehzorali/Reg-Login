// icon_card.dart
import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final String icon;
  final String label;

  IconCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            'assets/$icon',
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}