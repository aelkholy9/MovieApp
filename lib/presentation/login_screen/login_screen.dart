import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/business_logic/controllers/login_controller.dart';
import 'package:movie_app/constants/api.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/presentation/common_widgets/loading_dialog.dart';
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
  final LoginController _loginController = Get.find();
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
              controller: controller.userNameController,
              validator: (userName) => controller.validateUserName(userName),
            ),
            const SizedBox(height: 5),
            RoundedTextField(
              label: 'Password',
              prefixIcon: Icons.password,
              hintTitle: 'Password',
              obscureText: true,
              controller: controller.passwordController,
              validator: (pass) => controller.validatePassword(pass),
            ),
            const SizedBox(height: 10),
            RoundedButton(
              onPressed: () async {
                Get.dialog(const LoadingDialog(dialogText: "Logging you in"));
                final loginStatus = await controller.login();
                Get.back();
                handleLoginStatus(loginStatus);
              },
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

void handleLoginStatus(Map<String, dynamic>? loginStatus) {
  if (loginStatus?[ApiParameters.success]) {
    print('success');
  } else {
    showLoginErrorDialog(loginStatus);
  }
}

void showLoginErrorDialog(Map<String, dynamic>? loginStatus) {
  Get.defaultDialog(
    content: Column(
      children: [
        const Icon(
          Icons.cancel,
          size: 100,
          color: Colors.red,
        ),
        const SizedBox(height: 20),
        Text(
          loginStatus?[ApiParameters.statusMsg],
          textAlign: TextAlign.center,
        ),
      ],
    ),
    title: "Error",
    titlePadding: const EdgeInsets.symmetric(vertical: 20),
    actions: [
      TextButton(
          onPressed: () => Get.back(),
          child: const Text(
            'Dismiss',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ))
    ],
  );
}
