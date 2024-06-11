import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginDesignOnImage extends StatelessWidget {
  const LoginDesignOnImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Gradient background
          Positioned.fill(
              child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade200,
                  const Color.fromARGB(255, 121, 216, 102),
                  const Color.fromARGB(255, 201, 70, 61),
                  const Color.fromARGB(255, 94, 13, 161),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )),
          // Login form
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  const Icon(
                    Icons.account_circle,
                    size: 80,
                    color: Colors.white,
                  ), // Placeholder for logo
                  const SizedBox(height: 20),
                  const Text(
                    'Login or Signup',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email or Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),

                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Continue')),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Or continue with social account',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.facebook,
                            size: 40, color: Colors.white),
                        onPressed: () {
                          // Add Facebook login logic here
                        },
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(Icons.g_mobiledata,
                            size: 40, color: Colors.white),
                        onPressed: () {
                          // Add Google login logic here
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.yellow[100],
                    child: RichText(
                      text: TextSpan(
                        text: 'Email based login is no longer available. ',
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Please click here ',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(
                            text: 'to restore your mobile number.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Adjusted spacing
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'By Signing In, I agree to Terms & Conditions and Privacy Policy',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
