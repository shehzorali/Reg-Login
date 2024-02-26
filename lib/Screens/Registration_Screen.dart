import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/RegistrationController.dart';

class RegisterScreen extends StatelessWidget {
  final RegistrationController registrationController =
  Get.put(RegistrationController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Registration Screen',
        style: TextStyle(
          color: Colors.white
        ),),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            registrationController.resetControllers();
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg_landing.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            bottom: 500,
            right: 50,
            left: 50,
            child: Image.asset(
              'assets/logo_saib.png',
              width: 70,
              height: 70,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: registrationController.nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      counterStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Name';
                      }
                      return null;
                    },
                    maxLength: 50,
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    controller: registrationController.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      counterStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!GetUtils.isEmail(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    maxLength: 100,
                    onChanged: (value) {
                      registrationController.emailController.text = value;
                      registrationController.emailController.selection =
                          TextSelection.fromPosition(
                              TextPosition(offset: value.length));
                    },
                    style: const TextStyle(color: Colors.white),
                  ),
                  PasswordField(
                    controller: registrationController.passwordlController,
                    isEmailValid: GetUtils.isEmail(
                        registrationController.emailController.text),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          registrationController.registerWithEmail();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                      ),
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final bool isEmailValid;

  const PasswordField(
      {super.key, required this.controller, required this.isEmailValid});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPasswordVisible = false;
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          child: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
        ),
        counterStyle: const TextStyle(color: Colors.white),

      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        else if (!_isPasswordValid(value)){
          return 'Password must contain at least one special character';
        }
        return null;
      },
      obscureText: !isPasswordVisible,
      maxLength: 50,
      onChanged: (value) {
        widget.controller.text = value;
        widget.controller.selection = TextSelection.fromPosition(
          TextPosition(offset: value.length),
        );

        // Update isPasswordValid and check for special characters
        isPasswordValid = _isPasswordValid(value);
      },
      style: const TextStyle(color: Colors.white),
    );
  }

  bool _isPasswordValid(String password) {
    // Regular expression to check for at least one special character
    RegExp specialCharRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    return specialCharRegExp.hasMatch(password);
  }
}
