import 'package:flutter/material.dart';
import 'package:saib_app/Screens/Aboutsus.dart';
import 'package:saib_app/Screens/AtmLocator.dart';
import 'package:saib_app/Screens/ContactUs.dart';
import 'package:saib_app/Screens/Login_Screen.dart';
import 'package:saib_app/Screens/Registration_Screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    //contains bg images
    return const bgimages();
  }
}

class bgimages extends StatelessWidget {
  const bgimages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return bgmainimages();
  }
}

class bgmainimages extends StatelessWidget {
  const bgmainimages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/map_dots.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //method contains plane,line and logo
          const bgassets(),
    //method contains login and registeration button config
          const lgnregbtn(),
        ],
      ),
    );
  }
}

class lgnregbtn extends StatelessWidget {
  const lgnregbtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: MediaQuery.of(context).size.height * 0.55,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const info(),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                      // Implement login functionality
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellow,
                      shadowColor: Colors.transparent,
                      minimumSize: const Size(280, 60),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                      // Implement registration functionality
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellow,
                      shadowColor: Colors.transparent,
                      minimumSize: const Size(280, 60),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}

class info extends StatelessWidget {
  const info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the About Us screen
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AboutUsScreen()),
            );
          },
          child: Column(
            children: [
              Image.asset(
                'assets/ic_aboutus.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 5),
              const Text('About Us',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        const SizedBox(width: 50),
        GestureDetector(
          onTap: () {
            // Navigate to the ATM Locator screen
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AtmLocatorScreen()),
            );
          },
          child: Column(
            children: [
              Image.asset(
                'assets/ic_locator.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 5),
              const Text('ATM Locator',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        const SizedBox(width: 50),
        GestureDetector(
          onTap: () {
            // Navigate to the Contact Us screen
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ContactUsScreen()),
            );
          },
          child: Column(
            children: [
              Image.asset(
                'assets/ic_phone.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 5),
              const Text('Contact Us',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}

class bgassets extends StatelessWidget {
  const bgassets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 90.70,
            right: 5,
            left: 5,
            child: Image.asset(
              'assets/line.png',
              width: 300,
            )),
        Positioned(
          top: 90.70,
          right: 120,
          left: 10,
          child: Image.asset(
            'assets/ic_plane.png',
            width: 70,
            height: 70,
          ),
        ),
        Positioned(
          top: 150,
          bottom: 400,
          right: 50,
          left: 50,
          child: Image.asset(
            'assets/logo_saib.png',
            width: 70,
            height: 70,
          ),
        ),
        const Positioned(
            top: 400,
            left: 155,
            right: 70,
            child: Text(
              'Welcome!',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
      ],
    );
  }
}
