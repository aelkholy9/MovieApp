import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/constants/colors.dart';

class RoundedButton extends StatelessWidget {
  Function onPressed;
  String title;
  RoundedButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.85,
      height: 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: MaterialButton(
        onPressed: () => onPressed,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textColor: Colors.white,
      ),
    );
  }
}
