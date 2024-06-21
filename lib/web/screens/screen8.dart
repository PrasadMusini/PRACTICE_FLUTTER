import 'package:flutter/material.dart';

class Screen8 extends StatelessWidget {
  const Screen8({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFFe2eaf5),
      width: size.width,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.152, vertical: size.height * 0.14),
      child: Column(
        children: [
          Container(
            child: const Text(
              'We specialize in the design and development of your Webflow,Shopify or WordPress powered website. Webhosting support through\nWebflow, WP Engine or equivalent. SEO best practices with a focus on\npage speed optimization. Familiarity with MySQL, PHP, JavaScript,\nCloudflare, and WooCommerce.',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 50),
          serviceBox('Web Development'),
          serviceBox('Web Development'),
          serviceBox('Web Development'),
          serviceBox('Web Development'),
          serviceBox('Test Development'),
          const Divider(),
        ],
      ),
    );
  }

  Column serviceBox(String service) {
    return Column(
      children: [
        const Divider(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                service,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.remove_red_eye,
                  size: 28,
                  color: Colors.white,
                ),
              ),

              // Container(
              //     padding: const EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //       color: Colors.black,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: const Icon(
              //       Icons.remove_red_eye,
              //       size: 28,
              //       color: Colors.white,
              //     ),
              //   ),
            ],
          ),
        ),
      ],
    );
  }
}
