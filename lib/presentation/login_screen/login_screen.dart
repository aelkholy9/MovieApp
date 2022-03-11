import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/common_widgets/rounded_button.dart';
import 'package:movie_app/presentation/common_widgets/rounded_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/tmdb.png',
                width: Get.width / 2,
              ),
              loginForm()
              //  TextField(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget loginForm() {
  return Column(
    children: [
      RoundedTextField(
        label: 'User name',
        prefixIcon: Icons.account_circle_rounded,
        hintTitle: 'User name',
      ),
      const SizedBox(height: 15),
      RoundedTextField(
        label: 'Password',
        prefixIcon: Icons.password,
        hintTitle: 'Password',
        obscureText: true,
      ),
      const SizedBox(height: 15),
      RoundedButton(
        onPressed: () {},
        title: "Login",
      ),
    ],
  );
}
