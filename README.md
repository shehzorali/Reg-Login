# Reg-Login
App is a Flutter application that provides user registration and login features. The app uses the GetX state management library for efficient state handling and the HTTP package to communicate with a backend API.

Features

Splash Screen:

-Animated splash screen with a rotating logo.
-Navigates to the main landing page after a delay.

Landing Page:

- Background images and assets like a plane, line, and logo.
- Login and registration buttons.
- Information buttons for About Us, ATM Locator, and Contact Us.

User Registration:

- Registration screen allowing users to sign up with a name, email, and password (POST).
- Validates email and password during registration including validation on special character.
- Uses a "RegistrationController" to handle registration logic.

User Login:

- Login screen enabling users to log in with their email. (GET)
- Validates email and password during login.
- Uses a "LoginController" to handle login logic.

Prerequisites:

- Flutter SDK 3.16
- Dart 3.2.6

Dependencies:
- GetX
- HTTP
