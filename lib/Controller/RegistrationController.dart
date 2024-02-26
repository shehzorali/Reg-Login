import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saib_app/Screens/LandingPage.dart';

class RegistrationController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordlController = TextEditingController();

  void resetControllers() {
    nameController.clear();
    emailController.clear();
    passwordlController.clear();
  }


  Future<void> registerWithEmail() async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordlController.text;

    try {
      // Makes an HTTP POST request to the registration endpoint
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
        body: {'name': name, 'email': email, 'password': password},
      );

      if (response.statusCode == 201) {
        // Registration successful message
        Get.snackbar('Success', 'Registration successful');

        resetControllers();

        Future.delayed (const Duration(seconds: 2), () {
          Get.off(const LandingPage()); // Navigate to the LandingPage
        });
      } else {
        // Handle registration failure
        Get.snackbar('Error', 'Registration failed');
      }
    } catch (e) {
      // Handles any errors that occurred during the HTTP request
      Get.snackbar('Error', 'An error occurred during registration');
    }
  }
}