import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_flutter/common_utils/custom_button.dart';
import 'package:practice_flutter/common_utils/custtom_form_field.dart';

class Validations extends StatefulWidget {
  const Validations({super.key});

  @override
  State<Validations> createState() => _ValidationsState();
}

class _ValidationsState extends State<Validations> {
  //MARK: Controllers
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController alernateMobileNumberController =
      TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

//MARK: Focus Nodes
  FocusNode userNameFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

//MARK: Variables
  String? invalidCredentials;
  bool isGenderSelected = false;
  bool isPasswordValidate = false;
  String _passwordStrengthMessage = '';
  Color _passwordStrengthColor = Colors.transparent;

  bool showConfirmPassword = true;
  bool showPassword = true;
  bool _passwordError = false;
  String? _passwordErrorMsg;
  bool _confirmPasswordError = false;
  String? _confirmPasswordErrorMsg;

  bool _fullNameError = false;
  String? _fullNameErrorMsg;

  String? _userNameErrorMsg;
  bool _userNameError = false;
  bool _dobError = false;
  String? _dobErrorMsg;
  bool _emailError = false;
  String? _emailErrorMsg;
  bool _mobileNumberError = false;
  String? _mobileNumberErrorMsg;
  // final bool _altNumberError = false;
  // String? _altNumberErrorMsg;

  bool isFullNameValidate = false;
  bool isDobValidate = false;
  bool isGenderValidate = false;
  bool isMobileNumberValidate = false;
  bool isAltMobileNumberValidate = false;
  bool isEmailValidate = false;
  bool isUserNameValidate = false;
  bool isPswdValidate = false;
  bool isConfirmPswdValidate = false;

  late TextEditingController _dateController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    // Initialize controller with current date
    _selectedDate = DateTime.now();
    _dateController = TextEditingController(
      text: _selectedDate.toString().split(' ')[0],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1999, 8, 10),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _selectedDate.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                fullName(),
                const SizedBox(
                  height: 10,
                ),
                userName(),
                const SizedBox(
                  height: 10,
                ),
                mobileNumber(),
                const SizedBox(
                  height: 10,
                ),
                dob(),
                const SizedBox(
                  height: 10,
                ),
                email(),
                const SizedBox(
                  height: 10,
                ),
                password(),
                const SizedBox(
                  height: 10,
                ),
                confirmPassword(),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    buttonText: 'buttonText',
                    color: Colors.grey,
                    onPressed: signIn)
              ],
            ),
          ),
        ),
      ),
    );
  }

//MARK: Fields
  Widget fullName() {
    return CustomeFormField(
      label: 'Full Name',
      validator: validateFullName,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(
            r'[a-zA-Z]')), // this condition will only all user to enter characters
      ],
      controller: fullNameController,
      keyboardType: TextInputType.name,
      errorText: _fullNameError ? _fullNameErrorMsg : null,
      onChanged: (value) {
        setState(() {
          if (value.startsWith(' ')) {
            // here we are preventing the space in first place
            fullNameController.value = TextEditingValue(
              text: value.trimLeft(),
              selection:
                  TextSelection.collapsed(offset: value.trimLeft().length),
            );
          }
          _fullNameError = false;
        });
      },
    );
  }

  Widget userName() {
    return TextFormField(
      controller: userNameController,
      maxLength: 50,
      keyboardType: TextInputType.visiblePassword,
      onTap: () {
        setState(
          () {
            userNameFocusNode.addListener(
              () {
                if (userNameFocusNode.hasFocus) {
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Scrollable.ensureVisible(
                      userNameFocusNode.context!,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                }
              },
            );
          },
        );
      },
      focusNode: userNameFocusNode,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF0f75bc),
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: 'User Name',
        counterText: "",
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        errorText: _userNameError ? _userNameErrorMsg : null,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<>_-]')),
      ],
      onChanged: (value) {
        setState(() {
          if (value.startsWith(' ')) {
            userNameController.value = TextEditingValue(
              text: value.trimLeft(),
              selection:
                  TextSelection.collapsed(offset: value.trimLeft().length),
            );
            return;
          }
          _userNameError = false;
        });
      },
      validator: validateUserName,
    );
  }

  Widget mobileNumber() {
    return CustomeFormField(
      //MARK: Mobile Number
      label: 'Mobile Number',
      validator: validateMobileNumber,
      controller: mobileNumberController,
      maxLength: 10,

      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      keyboardType: TextInputType.phone,
      errorText: _mobileNumberError ? _mobileNumberErrorMsg : null,
      onChanged: (value) {
        setState(() {
          if (value.length == 1 && ['1', '2', '3', '4'].contains(value)) {
            mobileNumberController.clear();
          }
          if (value.startsWith(' ')) {
            mobileNumberController.value = TextEditingValue(
              text: value.trimLeft(),
              selection:
                  TextSelection.collapsed(offset: value.trimLeft().length),
            );
          }
          _mobileNumberError = false;
        });
      },
    );
  }

  Widget dob() {
    return TextFormField(
      //MARK: DOB
      controller: dobController,
      onTap: () {
        _selectDate(context);
      },
      focusNode: dobFocusNode,
      readOnly: true,
      decoration: InputDecoration(
        errorText: _dobError ? _dobErrorMsg : null,
        contentPadding:
            const EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade800,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: 'Date of Birth',
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      validator: validateDOB,
      onChanged: (value) {
        setState(() {
          _dobError = false;
        });
      },
    );
  }

  Widget email() {
    return TextFormField(
      controller: emailController,
      maxLength: 60,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      keyboardType: TextInputType.emailAddress,
      onTap: () {
        setState(() {
          emailFocusNode.addListener(() {
            if (emailFocusNode.hasFocus) {
              Future.delayed(const Duration(milliseconds: 300), () {
                Scrollable.ensureVisible(
                  emailFocusNode.context!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            }
          });
        });
      },
      focusNode: emailFocusNode,
      decoration: InputDecoration(
        errorText: _emailError ? _emailErrorMsg : null,
        contentPadding:
            const EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade900,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: 'Email',
        counterText: "",
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
      ),
      validator: validateEmail,
      onChanged: (value) {
        setState(() {
          _emailError = false;
        });
      },
    );
  }

  Widget password() {
    return Column(
      children: [
        TextFormField(
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: showPassword,
          maxLength: 25,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          onTap: () {
            setState(() {
              passwordFocusNode.addListener(() {
                if (passwordFocusNode.hasFocus) {
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Scrollable.ensureVisible(
                      passwordFocusNode.context!,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                }
              });
            });
          },
          focusNode: passwordFocusNode,
          decoration: InputDecoration(
            errorText: _passwordError ? _passwordErrorMsg : null,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child:
                  Icon(showPassword ? Icons.visibility : Icons.visibility_off),
            ),
            contentPadding:
                const EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade900,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            hintText: 'Password',
            counterText: "",
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400),
          ),
          validator: validatePassword,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<>_-]')),
          ],
          onChanged: (value) {
            setState(() {
              if (value.startsWith(' ')) {
                passwordController.value = TextEditingValue(
                  text: value.trimLeft(),
                  selection:
                      TextSelection.collapsed(offset: value.trimLeft().length),
                );
                return;
              }
              _passwordError = false;
              isPasswordValidate = true;
              if (isPasswordValidate) {
                _updatePasswordStrengthMessage(value);
              }
            });
          },
        ),
        if (isPasswordValidate)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 12),
                child: Text(
                  _passwordStrengthMessage,
                  style: TextStyle(color: _passwordStrengthColor, fontSize: 12),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget confirmPassword() {
    return TextFormField(
      controller: confirmPasswordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: showConfirmPassword,
      maxLength: 25,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      onTap: () {
        setState(() {
          confirmPasswordFocusNode.addListener(() {
            if (confirmPasswordFocusNode.hasFocus) {
              Future.delayed(const Duration(milliseconds: 300), () {
                Scrollable.ensureVisible(
                  confirmPasswordFocusNode.context!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            }
          });
        });
      },
      focusNode: confirmPasswordFocusNode,
      decoration: InputDecoration(
        errorText: _confirmPasswordError ? _confirmPasswordErrorMsg : null,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              showConfirmPassword = !showConfirmPassword;
            });
          },
          child: Icon(
              showConfirmPassword ? Icons.visibility : Icons.visibility_off),
        ),
        contentPadding:
            const EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade900,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: 'Confirm Password',
        counterText: "",
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
      ),
      validator: validateConfirmPassword,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<>_-]')),
      ],
      onChanged: (value) {
        setState(() {
          if (value.startsWith(' ')) {
            confirmPasswordController.value = TextEditingValue(
              text: value.trimLeft(),
              selection:
                  TextSelection.collapsed(offset: value.trimLeft().length),
            );
            return;
          }
          _confirmPasswordError = false;
        });
      },
    );
  }

//MARK: Validations
  String? validateFullName(String? value) {
    if (value!.isEmpty) {
      setState(() {
        _fullNameError = true;
        _fullNameErrorMsg = 'Please Enter Full Name';
      });
      isFullNameValidate = false;
      return null;
    }
    if (value.length < 2) {
      setState(() {
        _fullNameError = true;
        _fullNameErrorMsg = 'Full Name should contains minimum 2 charactes';
      });
      isFullNameValidate = false;
      return null;
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Full Name should only contain alphabetic characters';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      setState(() {
        _fullNameError = true;
        _fullNameErrorMsg = 'Full Name Should Only Contain Alphabets';
      });
      isFullNameValidate = false;
      return null;
    }
    isFullNameValidate = true;
    return null;
  }

  String? validateMobileNumber(String? value) {
    if (value!.isEmpty) {
      setState(() {
        _mobileNumberError = true;
        _mobileNumberErrorMsg = 'Please Enter Mobile Number';
      });
      isMobileNumberValidate = false;
      return null;
    }
    if (value.startsWith(RegExp('[1-4]'))) {
      setState(() {
        _mobileNumberError = true;
        _mobileNumberErrorMsg = 'Mobile Number Should Not Start with 1-4';
      });
      isMobileNumberValidate = false;
      return null;
    }
    if (value.contains(RegExp(r'[a-zA-Z]'))) {
      setState(() {
        _mobileNumberError = true;
        _mobileNumberErrorMsg = 'Mobile Number should contain only digits';
      });
      isMobileNumberValidate = false;
      return null;
    }
    if (value.length != 10) {
      setState(() {
        _mobileNumberError = true;
        _mobileNumberErrorMsg = 'Mobile Number Must Have 10 Digits';
      });
      isMobileNumberValidate = false;
      return null;
    }
    isMobileNumberValidate = true;
    return null;
  }

  String? validateUserName(String? value) {
    if (value!.isEmpty) {
      setState(() {
        _userNameError = true;
        _userNameErrorMsg = 'Please Enter User Name';
      });
      isUserNameValidate = false;
      return null;
    }
    if (value.length < 2) {
      setState(() {
        _userNameError = true;
        _userNameErrorMsg = 'User Name Should Contains Minimum 2 Charactes';
      });
      isUserNameValidate = false;
      return null;
    }
    if (invalidCredentials != null) {
      setState(() {
        _userNameError = true;
        _userNameErrorMsg = null;
      });
      isUserNameValidate = false;
      return null;
    }
    isUserNameValidate = true;
    return null;
  }

  String? validateDOB(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _dobError = true;
        _dobErrorMsg = 'Please Select Date of Birth';
      });
      isDobValidate = false;
      return null;
    }
    isDobValidate = true;
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      setState(() {
        _emailError = true;
        _emailErrorMsg = 'Please Enter Email';
      });
      isEmailValidate = false;
      return null;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      setState(() {
        _emailError = true;
        _emailErrorMsg = 'Please Enter a Valid Email Address';
      });
      isEmailValidate = false;
      return null;
    }
    isEmailValidate = true;
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      setState(() {
        isPasswordValidate = false;
        _passwordError = true;
        _passwordErrorMsg = 'Please Enter Password';
      });
      isPswdValidate = false;
      return null;
    } else if (value.length < 8) {
      setState(() {
        isPasswordValidate = false;
        _passwordError = true;
        _passwordErrorMsg = 'Password must be 8 characters or above';
      });
      isPswdValidate = false;
      return null;
    } else if (value.length > 30) {
      setState(() {
        isPasswordValidate = false;
        _passwordError = true;
        _passwordErrorMsg = 'Password must be below 30 characters';
      });
      isPswdValidate = false;
      return null;
    }

    final hasAlphabets = RegExp(r'[a-zA-Z]').hasMatch(value);
    final hasNumbers = RegExp(r'\d').hasMatch(value);
    final hasSpecialCharacters =
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
    final hasCapitalLetter = RegExp(r'[A-Z]').hasMatch(value);

    if (!hasAlphabets ||
        !hasNumbers ||
        !hasSpecialCharacters ||
        !hasCapitalLetter) {
      setState(() {
        isPasswordValidate = false;
        _passwordError = true;
        _passwordErrorMsg =
            'Password must contain at least one alphabets, numbers, special characters, and capital letter';
      });
      isPswdValidate = false;
      return null;
    }
    setState(() {
      isPasswordValidate = true;
      isPswdValidate = true;
    });
    return null;
  }

  void _updatePasswordStrengthMessage(String password) {
    setState(() {
      if (password.isEmpty || password.length < 8) {
        isPasswordValidate = false;
      } else {
        if (_containsSpecialCharacters(password) &&
            _containsCharacters(password) &&
            _containsNumbers(password)) {
          _passwordStrengthMessage = 'Strong password';
          _passwordStrengthColor = const Color.fromARGB(255, 2, 131, 68);
        } else if (_containsNumbers(password) &&
            _containsCharacters(password)) {
          _passwordStrengthMessage = 'Good password';
          _passwordStrengthColor = const Color.fromARGB(255, 161, 97, 0);
        } else {
          _passwordStrengthMessage = 'Weak password';
          _passwordStrengthColor = const Color.fromARGB(255, 181, 211, 15);
        }
      }
    });
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

  String? validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      setState(() {
        _confirmPasswordError = true;
        _confirmPasswordErrorMsg = 'Please Enter Confirm Password';
      });
      isConfirmPswdValidate = false;
      return null;
    } else if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        _confirmPasswordError = true;
        _confirmPasswordErrorMsg = 'Confirm Password Must be Same as Password';
      });
      isConfirmPswdValidate = false;
      return null;
    }
    isConfirmPswdValidate = true;
    return null;
  }

  void signIn() {
    if (_formKey.currentState!.validate()) {
      print('Login Succuss');
    }
  }
}
