import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class RoundedTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hintTitle;
  final String label;
  IconData? prefixIcon;
  Function? validator;
  TextInputType? keyboardType;
  bool obscureText;
  RoundedTextField({
    Key? key,
    this.controller,
    this.hintTitle,
    required this.label,
    this.prefixIcon,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.width * 0.85,
          height: 70,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: TextFormField(
            controller: controller,
            cursorColor: AppColors.primaryColor,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: (value) {
              if (validator != null) {
                return validator!(value);
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      color: AppColors.primaryColor,
                    )
                  : Container(),
              hintText: hintTitle,
              border: buildBorderStyle(),
              focusedBorder: buildBorderStyle().copyWith(
                borderSide: const BorderSide(width: 2),
              ),
              label: Text(
                label,
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
            //keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder buildBorderStyle() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
    borderSide: BorderSide(color: AppColors.primaryColor),
  );
}
