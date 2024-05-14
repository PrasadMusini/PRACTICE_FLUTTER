// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_flutter/custom_widgets/custom_button.dart';
import 'package:practice_flutter/custom_widgets/custom_text_field.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController _userNameController = TextEditingController();
  // TextEditingController _mobileController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // TextEditingController _confirmPasswordController = TextEditingController();
  // TextEditingController _addressController = TextEditingController();
  // TextEditingController _altNumberController = TextEditingController();

  // String? _userNameErrorMsg;
  // bool _userNameError = false;
  // bool _mobileError = false;
  // String? _mobileErrorMsg;
  // Color? _passwordStatusColor = Colors.redAccent;
  // bool _passwordError = false;
  // bool _isPasswordValid = false;
  // String? _confirmPasswordErrorMsg;
  // bool _confirmPasswordError = false;
  // String? _addressErrorMsg;
  // bool _addressError = false;
  // String? _altNumberErrorMsg;
  // bool _altNumberError = false;

  String? _emailErrorMsg;
  bool _emailError = false;
  bool _passwordError = false;
  String? _passwordErrorMsg;
  String? _passwordStatusMessage;
  bool _isPasswordValid = false;
  bool _isPswdObscure = true;
  Color? _passwordStatusColor = Colors.redAccent;
  // bool _isConfirmPswdObscure = true;

  @override
  void dispose() {
    // _userNameController.dispose();
    // _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    // _confirmPasswordController.dispose();
    // _addressController.dispose();
    // _altNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  email(),
                  password(),
                  // userName(),
                  // mobile(),
                  // alternateNumber(),
                  // email(),
                  // password(),
                  // confirmPassword(),
                  // address(),
                  signin(),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print('Login Success.');
    } else {
      print('Form state is not available or validation failed.');
    }
  }

  //MARK: Fields
  // Widget userName() {
  //   return Column(
  //     children: [
  //       CustomTextField(
  //         labelText: 'User Name',
  //         controller: _userNameController,
  //         counterText: '',
  //         errorText: _userNameError ? _userNameErrorMsg : null,
  //         onChanged: (value) {
  //           setState(() {
  //             if (value.startsWith(' ')) {
  //               _userNameController.value = TextEditingValue(
  //                 text: value.trimLeft(),
  //                 selection:
  //                     TextSelection.collapsed(offset: value.trimLeft().length),
  //               );
  //             }
  //             _userNameError = false;
  //           });
  //         },
  //         validator: validateUserName,
  //         maxLength: 12,
  //         inputFormatters: [
  //           FilteringTextInputFormatter.allow(
  //             RegExp('[a-zA-Z]'),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(
  //         height: 20,
  //       ),
  //     ],
  //   );
  // }

  Widget email() {
    return Column(
      children: [
        CustomTextField(
          labelText: 'Email',
          controller: _emailController,
          errorText: _emailError ? _emailErrorMsg : null,
          onChanged: (value) {
            setState(() {
              _emailError = false;
            });
          },
          validator: validateEmail,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget password() {
    return Column(
      children: [
        CustomTextField(
          labelText: 'Password',
          controller: _passwordController,
          obscureText: _isPswdObscure,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _isPswdObscure = !_isPswdObscure;
              });
            },
            child:
                Icon(_isPswdObscure ? Icons.visibility : Icons.visibility_off),
          ),
          errorMaxLines: 2,
          errorText: _passwordError ? _passwordErrorMsg : null,
          onChanged: (value) {
            setState(() {
              _passwordError = false;
              _isPasswordValid = true;
              if (_isPasswordValid) {
                _validatePasswordStatus(value);
              }
            });
          },
          validator: validatePassword,
        ),
        if (_isPasswordValid)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 12),
                child: Text(
                  '$_passwordStatusMessage',
                  style: TextStyle(color: _passwordStatusColor, fontSize: 12),
                ),
              ),
            ],
          ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  void _validatePasswordStatus(String password) {
    setState(() {
      if (password.isEmpty || password.length < 8) {
        _isPasswordValid = false;
      } else {
        if (_containsSpecialCharacters(password) &&
            _containsCharacters(password) &&
            _containsNumbers(password)) {
          _passwordStatusMessage = 'Strong password';
          _passwordStatusColor = const Color.fromARGB(255, 2, 131, 68);
        } else if (_containsNumbers(password) &&
            _containsCharacters(password)) {
          _passwordStatusMessage = 'Good password';
          _passwordStatusColor = const Color.fromARGB(255, 161, 97, 0);
        } else {
          _passwordStatusMessage = 'Weak password';
          _passwordStatusColor = const Color.fromARGB(255, 181, 211, 15);
        }
      }
    });
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
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
        _emailErrorMsg = 'Invalid email address';
      });
      return null;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _passwordError = true;
        _passwordErrorMsg = 'Password is required';
        _isPasswordValid = false;
      });
      return null;
    }
    print('log: ${value.length}');
    if (value.length < 8 || value.length > 20) {
      setState(() {
        _passwordError = true;
        _passwordErrorMsg =
            'Password must be more than 8 and less than 20 characters';
        _isPasswordValid = false;
      });
      return null;
    }
    return null;
  }

  Widget signin() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: login,
            backgroundColor: Colors.redAccent,
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  bool _containsNumbers(String value) {
    return RegExp(r'\d').hasMatch(value);
  }

  bool _containsCharacters(String value) {
    return RegExp(r'[a-zA-Z]').hasMatch(value);
  }

  bool _containsSpecialCharacters(String value) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
  }

  // Widget mobile() {
  //   return Column(
  //     children: [
  //       CustomTextField(
  //         labelText: 'Mobile',
  //         controller: _mobileController,
  //         maxLength: 10,
  //         counterText: '',
  //         keyboardType: TextInputType.phone,
  //         inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
  //         errorText: _mobileError ? _mobileErrorMsg : null,
  //         onChanged: (value) {
  //           setState(() {
  //             _mobileError = false;
  //           });
  //         },
  //         validator: validateMobile,
  //       ),
  //       const SizedBox(
  //         height: 20,
  //       ),
  //     ],
  //   );
  // }

  // Widget confirmPassword() {
  //   return Column(
  //     children: [
  //       CustomTextField(
  //         labelText: 'Confirm Password',
  //         controller: _confirmPasswordController,
  //         errorText: _confirmPasswordError ? _confirmPasswordErrorMsg : null,
  //         obscureText: _isConfirmPswdObscure,
  //         suffixIcon: GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               _isConfirmPswdObscure = !_isConfirmPswdObscure;
  //             });
  //           },
  //           child: Icon(_isConfirmPswdObscure
  //               ? Icons.visibility
  //               : Icons.visibility_off),
  //         ),
  //         onChanged: (value) {
  //           setState(() {
  //             _confirmPasswordError = false;
  //           });
  //         },
  //         validator: validateConfirmPassword,
  //       ),
  //       const SizedBox(
  //         height: 20,
  //       ),
  //     ],
  //   );
  // }

  //MARK: Validations
  // String? validateUserName(String? value) {
  //   if (value == null || value.isEmpty) {
  //     setState(() {
  //       _userNameError = true;
  //       _userNameErrorMsg = 'User Name is required';
  //     });
  //     return null;
  //   }
  //   return null;
  // }

  // String? validateConfirmPassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     setState(() {
  //       _confirmPasswordError = true;
  //       _confirmPasswordErrorMsg = 'Confirm Password is required';
  //     });
  //     return null;
  //   }
  //   if (_passwordController.text != _confirmPasswordController.text) {
  //     setState(() {
  //       _confirmPasswordError = true;
  //       _confirmPasswordErrorMsg = 'Password and confirm password do not match';
  //     });
  //     return null;
  //   }
  //   return null;
  // }

  // String? validateMobile(String? value) {
  //   if (value == null || value.isEmpty) {
  //     setState(() {
  //       _mobileError = true;
  //       _mobileErrorMsg = 'Mobile is required';
  //     });
  //     return null;
  //   }
  //   if (_mobileController.text.length != 10) {
  //     setState(() {
  //       _mobileError = true;
  //       _mobileErrorMsg = 'Mobile number must contains 10 digits';
  //     });
  //     return null;
  //   }
  //   return null;
  // }

  // Widget address() {
  //   return Column(
  //     children: [
  //       CustomTextField(
  //         labelText: 'Address',
  //         controller: _addressController,
  //         maxLines: null,
  //         errorText: _addressError ? _addressErrorMsg : null,
  //         onChanged: (value) {},
  //         validator: validateaddress,
  //       ),
  //       const SizedBox(
  //         height: 20,
  //       ),
  //     ],
  //   );
  // }

  // Widget alternateNumber() {
  //   return Column(
  //     children: [
  //       CustomTextField(
  //         labelText: 'Alternate Number',
  //         controller: _altNumberController,
  //         maxLength: 10,
  //         keyboardType: TextInputType.phone,
  //         inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
  //         counterText: '',
  //         errorText: _altNumberError ? _altNumberErrorMsg : null,
  //         onChanged: (value) {},
  //         validator: validateAltNumber,
  //       ),
  //       const SizedBox(
  //         height: 20,
  //       ),
  //     ],
  //   );
  // }

  // String? validateaddress(String? value) {
  //   if (value == null || value.isEmpty) {
  //     setState(() {
  //       _addressError = true;
  //       _addressErrorMsg = 'Address is required';
  //     });
  //     return null;
  //   }
  //   return null;
  // }

  // String? validateAltNumber(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return null;
  //   }
  //   if (_altNumberController.text.length != 10) {
  //     setState(() {
  //       _altNumberError = true;
  //       _altNumberErrorMsg = 'Alternate number must contain 10 digits';
  //     });
  //     return null;
  //   }
  //   return null;
  // }
}
