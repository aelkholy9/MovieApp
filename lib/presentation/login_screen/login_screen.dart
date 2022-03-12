import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/business_logic/controllers/login_controller.dart';
import 'package:movie_app/presentation/common_widgets/rounded_button.dart';
import 'package:movie_app/presentation/common_widgets/rounded_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
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
  Get.find();
  return GetBuilder<LoginController>(
    builder: ((controller) {
      return Form(
        key: controller.formKey,
        child: Column(
          children: [
            RoundedTextField(
              label: 'User name',
              prefixIcon: Icons.account_circle_rounded,
              hintTitle: 'User name',
              validator: (userName) => controller.validateUserName(userName),
            ),
            const SizedBox(height: 5),
            RoundedTextField(
              label: 'Password',
              prefixIcon: Icons.password,
              hintTitle: 'Password',
              obscureText: true,
              validator: (pass) => controller.validatePassword(pass),
            ),
            const SizedBox(height: 10),
            RoundedButton(
              onPressed: () => controller.login(),
              title: "Login",
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Continue Anonymously?'),
            )
          ],
        ),
      );
    }),
  );
}
