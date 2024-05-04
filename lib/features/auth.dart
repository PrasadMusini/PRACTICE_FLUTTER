// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SignInSignUpScreen extends StatefulWidget {
  const SignInSignUpScreen({super.key});

  @override
  State<SignInSignUpScreen> createState() => _SignInSignUpScreenState();
}

class _SignInSignUpScreenState extends State<SignInSignUpScreen>
    with SingleTickerProviderStateMixin {
  bool showSignIn = true;
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleForm() {
    if (showSignIn) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final rotationValue =
              showSignIn ? _animation.value : 1.0 - _animation.value;
          return Transform(
            transform: Matrix4.rotationY(rotationValue * 3.14159),
            alignment: Alignment.center,
            child: showSignIn
                ? SignInForm(onTap: toggleForm)
                : SignUpForm(onTap: toggleForm),
          );
        },
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  final VoidCallback? onTap;

  const SignInForm({
    super.key,
    required this.onTap,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const TextField(decoration: InputDecoration(labelText: 'Email')),
        TextField(
          obscuringCharacter: '#',
          obscureText: isVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(isVisible ? Icons.key : Icons.key_off)),
          ),
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Sign In')),
        TextButton(
            onPressed: widget.onTap, child: const Text('Create an account?')),
      ],
    );
  }
}

class SignUpForm extends StatelessWidget {
  final VoidCallback onTap;

  const SignUpForm({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const TextField(decoration: InputDecoration(labelText: 'Username')),
        const TextField(decoration: InputDecoration(labelText: 'Email')),
        const TextField(decoration: InputDecoration(labelText: 'Password')),
        const TextField(
            decoration: InputDecoration(labelText: 'Confirm Password')),
        ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
        TextButton(
            onPressed: onTap, child: const Text('Have an account? Sign in')),
      ],
    );
  }
}
