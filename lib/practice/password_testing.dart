import 'package:flutter/material.dart';

class PasswordStrengthChecker extends StatefulWidget {
  const PasswordStrengthChecker({super.key});

  @override
  _PasswordStrengthCheckerState createState() =>
      _PasswordStrengthCheckerState();
}

class _PasswordStrengthCheckerState extends State<PasswordStrengthChecker> {
  final TextEditingController _passwordController = TextEditingController();
  String _passwordStrengthMessage = '';
  Color _passwordStrengthColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            onChanged: (value) {
              setState(() {
                _updatePasswordStrengthMessage(value);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Text(
            _passwordStrengthMessage,
            style: TextStyle(color: _passwordStrengthColor),
          ),
        ],
      ),
    );
  }

  void _updatePasswordStrengthMessage(String password) {
    setState(() {
      if (password.isEmpty) {
        _passwordStrengthMessage = '';
        _passwordStrengthColor = Colors.transparent;
      } else if (_containsSpecialCharacters(password) &&
          _containsNumbers(password)) {
        _passwordStrengthMessage = 'Strong password';
        _passwordStrengthColor = Colors.green;
      } else if (_containsNumbers(password)) {
        _passwordStrengthMessage = 'Good password';
        _passwordStrengthColor = Colors.orange;
      } else {
        _passwordStrengthMessage = 'Weak password';
        _passwordStrengthColor = Colors.yellow;
      }
    });
  }

  bool _containsNumbers(String value) {
    return RegExp(r'\d').hasMatch(value);
  }

  bool _containsSpecialCharacters(String value) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
  }
}
