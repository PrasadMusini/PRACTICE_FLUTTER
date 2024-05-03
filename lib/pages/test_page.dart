import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loading_progress/loading_progress.dart';
import 'package:progress_loading_button/progress_loading_button.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _emailError = false;
  bool _passwordError = false;
  String? _emailErrorMsg;
  String? _passwordErrorMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _emailError ? _emailErrorMsg : null,
                ),
                onChanged: (_) {
                  setState(() {
                    _emailError = false;
                  });
                },
                validator: validateEmail,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _passwordError ? _passwordErrorMsg : null,
                ),
                onChanged: (_) {
                  setState(() {
                    _passwordError = false;
                  });
                },
                validator: validatePassword,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Email: ${_emailController.text}');
                    print('Password: ${_passwordController.text}');
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      setState(() {
        _emailError = true;
        _emailErrorMsg = 'Email is required';
      });
      return null;
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      setState(() {
        _emailError = true;
        _emailErrorMsg = 'Please enter a valid email address';
      });
      return null;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      setState(() {
        _passwordError = true;
        _passwordErrorMsg = 'Password is required';
      });
      return null;
    }
    if (value.length > 8) {
      setState(() {
        _passwordError = true;
        _passwordErrorMsg = 'Password must be 8 characters or less';
      });
      return null;
    }
    return null;
  }
}
