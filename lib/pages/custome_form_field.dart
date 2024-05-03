import 'package:flutter/material.dart';
import 'package:practice_flutter/common_utils/styles.dart';

class CustomeFormField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  const CustomeFormField({super.key, required this.label, this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label text
        Row(
          children: [
            Text(
              '$label ',
              style: CommonStyles.txSty_12p_fb,
            ),
            const Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),

        // textfield
        TextFormField(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: CommonStyles.primaryTextColor),
            ),
            hintText: 'Enter $label',
            hintStyle: CommonStyles.txSty_12bs_fb,
          ),
          validator: validator,
        ),
      ],
    );
  }
}


 //const EdgeInsets.symmetric(horizontal: 10, vertical: 5)
        // .copyWith(top: 5),