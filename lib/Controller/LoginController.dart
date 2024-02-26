// Controller/LoginController.dart
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void resetControllers() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body);

        // Check if the email exists in the list of users
        final userWithEmail = users.firstWhere(
              (user) => user['email'] == email,
          orElse: () => null,
        );

        if (userWithEmail != null) {
          // Login successful, show the success Snackbar
          Get.snackbar('Success', 'Login successful');

          // Reset controllers
          resetControllers();

          // Navigate to the LandingPage after successful login
          Future.delayed(const Duration(seconds: 2), () {
            Get.offNamed('/LandingPage'); // Replace '/landing' with your landing page route
          });
        } else {
          // Handle login failure
          Get.snackbar('Error', 'Invalid email or password');
        }
      } else {
        // Handle API request failure
        Get.snackbar('Error', 'Failed to fetch users');
      }
    } catch (e) {
      // Handle any errors that occurred during the HTTP request
      Get.snackbar('Error', 'An error occurred during login');
    }
  }
}
