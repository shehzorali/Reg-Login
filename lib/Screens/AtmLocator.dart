import 'package:flutter/material.dart';

class AtmLocatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locate Our ATM'),
      ),
      body: const Center(
        child: Text(
          'Locate Our ATM',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
