import 'package:flutter/material.dart';
import 'package:practice_flutter/animations/navigation_effects/right_slide_navigation.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_btn.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_textfield.dart';
import 'package:practice_flutter/project/common_utilities/shared_prefs.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';
import 'package:practice_flutter/project/main_screen/pages/home_page/home_mobile.dart';
import 'package:practice_flutter/project/auth/signup/signup_mobile.dart';

class SigninMobile extends StatefulWidget {
  final double topPadding;
  final double horizontalPadding;
  const SigninMobile(
      {super.key, this.topPadding = 6, this.horizontalPadding = 0.08});

  @override
  State<SigninMobile> createState() => _SigninMobileState();
}

class _SigninMobileState extends State<SigninMobile> {
  Color textFieldFillColor = const Color(0xFFfafafa);
  Color blueColor = const Color(0xFF7ba4d7);
  bool? checkValue = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: signinFromMobile(),
    );
  }

  Widget signinFromMobile() {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
                  horizontal: size.width * widget.horizontalPadding)
              .copyWith(
                  // for web - (horizontal: size.width * 0.06) || for mobile - (horizontal: 20)
                  top: size.height /
                      widget
                          .topPadding), // for web - (  top: size.height / 4.5) || for mobile - (top: size.height / 7)
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: Styles.txStyF12FWbFFsCb.copyWith(
                    fontSize: 30,
                  ),
                ),
                Text('Please enter your informations',
                    style: Styles.txStyF12FWbFFsCb.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(height: size.height * 0.022),
                const CustomField(
                  labelText: 'Email',
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                SizedBox(height: size.height * 0.023),
                const CustomField(
                  labelText: 'Password',
                ),
                // const SizedBox(
                //   height: 10,
                // ),

                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          checkValue = !checkValue!;
                        });
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 7),
                          SizedBox(
                            width: 12,
                            height: 12,
                            child: Checkbox(
                              value: checkValue,
                              checkColor: Colors.white,
                              activeColor: Colors.black,
                              shape: const CircleBorder(),
                              side: const BorderSide(
                                  strokeAlign: BorderSide.strokeAlignCenter),
                              onChanged: (value) {
                                // setState(() {
                                //   checkValue = value;
                                // });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('Remember me',
                              style: Styles.txStyF12FWbFFsCb
                                  .copyWith(fontSize: 11, color: Colors.black)),
                        ],
                      ),
                    ),
                    Text('Forgot Password?',
                        style: Styles.txStyF12FWbFFsCb
                            .copyWith(fontSize: 11, color: Colors.black)),
                  ],
                ),
                // const SizedBox(
                //   height: 20,
                // ),

                SizedBox(height: size.height * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: CustomBtn(
                        backgroundColor: Colors.black,
                        radius: 7,
                        verticalPadding: 13,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupMobile()));
                          // Navigator.pushReplacement(
                          //   context,
                          //   RightSlideRoute(page: const SignupMobile()),
                          // );

                          //MARK: To Home Screen
                          SharedPrefsHelper.setLoginStatus(status: true);
                          Navigator.pushAndRemoveUntil(
                              context,
                              NavigateWithRightSlideAnimation(
                                  page: const HomeMobile()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text('Login',
                            style: Styles.txStyF12FWbFFsCb
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: horizontalDivider(),
                    ),
                    Text('   OR   ',
                        style:
                            // CommonStyles.txStyF10FWbFFsCw
                            Styles.txStyF12FWbFFsCb.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                    Expanded(
                      child: horizontalDivider(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomBtn(
                        backgroundColor: Colors.white,
                        borderColor: Colors.black,
                        radius: 7,
                        verticalPadding: 13,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.images.googleLogo.path,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Google',
                              style: Styles.txStyF12FWbFFsCb,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomBtn(
                        backgroundColor: Colors.white,
                        borderColor: Colors.black,
                        radius: 7,
                        verticalPadding: 13,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.images.facebookLogo.path,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Facebook',
                              style: Styles.txStyF12FWbFFsCb,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? ',
                        style: Styles.txStyF12FWbFFsCb.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: Colors.black)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupMobile(),
                          ),
                        );
                      },
                      child: Text('Sign up for free',
                          style: Styles.txStyF12FWbFFsCb.copyWith(
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationThickness:
                                  2.0, // Optional: thickness of the underline
                              decorationStyle: TextDecorationStyle.solid,
                              color: Colors.black)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget authBox(IconData icon) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: textFieldFillColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        side: BorderSide(color: Colors.grey.shade400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Icon(icon),
    );
  }

  Widget horizontalDivider() {
    return Container(
      height: 0.5,
      color: Colors.grey.shade400,
    );
  }
}
