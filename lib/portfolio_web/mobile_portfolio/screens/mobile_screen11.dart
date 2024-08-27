import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileScreen11 extends StatelessWidget {
  MobileScreen11({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: Colors.black,
      padding:
          EdgeInsets.symmetric(horizontal: 16, vertical: size.height * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Contact Form',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            'Do you have a question, an idea, or a project you need help with? Contact me!',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  contactForm(
                    label: 'Your Name',
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  contactForm(
                    label: 'Your Email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (value.isNotEmpty &&
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  contactForm(
                      label: 'Your Message',
                      maxLines: 4,
                      controller: contentController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Write Something';
                        }
                        return null;
                      },
                      hintText: 'Type your message here..'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ContactMeButton(
            size: size,
            content: 'Submit',
            hoverColor: Constants.orangeColor,
            onTap: () => submitContactForm(context,
                name: nameController.text,
                email: emailController.text,
                body: contentController.text),
          )
        ],
      ),
    );
  }

  Widget contactForm(
      {required TextEditingController controller,
      String? Function(String?)? validator,
      required String label,
      int? maxLines = 1,
      String? hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5).copyWith(left: 10),
          child: Text(
            label,
            style: const TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          style: const TextStyle(
              fontFamily: 'Sora',
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
                fontFamily: 'Sora',
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w600),
            filled: true,
            fillColor: const Color(0xff2b2d2e),
            contentPadding: const EdgeInsets.all(12),
            border: border(radius: 10),
            enabledBorder: border(radius: 10),
            focusedBorder: border(radius: 10, width: 1.5),
            errorBorder: border(radius: 10),
          ),
        ),
      ],
    );
  }

  InputBorder? border({required double radius, double width = 1}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: width,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    );
  }

  Future<void> submitContactForm(BuildContext context,
      {required String name,
      required String email,
      required String body}) async {
    if (formKey.currentState!.validate()) {
      // await EasyLauncher.email(
      //     email: email, subject: 'Request to contact from $name', body: body);

      formKey.currentState!.reset();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Thank you for reaching out!\nI have received your message and will get back to you shortly.',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ),
      );
    }
  }
}

class ContactMeButton extends StatefulWidget {
  const ContactMeButton({
    super.key,
    required this.size,
    required this.content,
    required this.hoverColor,
    this.onTap,
  });

  final Size size;
  final String content;
  final Color hoverColor;
  final void Function()? onTap;

  @override
  State<ContactMeButton> createState() => _ContactMeButtonState();
}

class _ContactMeButtonState extends State<ContactMeButton> {
  Color textColor = Colors.black;

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            textColor = widget.hoverColor;
            isHover = true;
          });
        },
        onExit: (_) {
          setState(() {
            textColor = Colors.black;
            isHover = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Container(
            width: widget.size.width / 2.2,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isHover ? Constants.orangeColor : Colors.black,
                border: Border.all(color: Colors.grey)),
            child: Text(
              widget.content, //'Contact Form',
              style: TextStyle(
                  fontFamily: 'Sora',
                  color: isHover ? Colors.black : Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 60,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Contact Form',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            'Do you have a question, an idea, or a project you need help with? Contact me!',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              children: [
                contactForm(label: 'Your Name'),
                const SizedBox(height: 20),
                contactForm(label: 'Your Email'),
                const SizedBox(height: 20),
                contactForm(
                    label: 'Your Message',
                    maxLines: 4,
                    hintText: 'Type your message here..'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ContactMeButton(
            size: size,
            content: 'Submit',
            hoverColor: Constants.orangeColor,
          )
        ],
      ),
    );
  }

  Widget contactForm(
      {required String label, int? maxLines = 1, String? hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5).copyWith(left: 10),
          child: Text(
            label,
            style: const TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ),
        TextFormField(
          maxLines: maxLines,
          style: const TextStyle(
              fontFamily: 'Sora',
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
                fontFamily: 'Sora',
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w600),
            filled: true,
            fillColor: const Color(0xff2b2d2e),
            contentPadding: const EdgeInsets.all(12),
            border: border(radius: 10),
            enabledBorder: border(radius: 10),
            focusedBorder: border(radius: 10, width: 1.5),
            errorBorder: border(radius: 10),
          ),
        ),
      ],
    );
  }

  InputBorder? border({required double radius, double width = 1}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: width,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    );
  }
}
