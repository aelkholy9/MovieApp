import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/repos/auth_repo.dart';

class LoginController extends GetxController {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateUserName(String userName) {
    if (userName.trim().isEmpty) {
      return "Please enter a valid user name";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Please enter a valid password";
    }
    return null;
  }

  Future login() async {
    if (formKey.currentState!.validate()) {
      AuthenticationRepo authenticationRepo = AuthenticationRepo();
      final data = await authenticationRepo.login(
          userNameController.text, passwordController.text);
      print(data);
    }
  }
}
