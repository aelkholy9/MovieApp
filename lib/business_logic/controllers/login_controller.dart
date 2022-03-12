import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/services/auth_service.dart';

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
      AuthenticationService ss = AuthenticationService();
      await ss.createSession('5e6bc3596009aed4e94350e85947f9a835d102a6');
    }
  }
}
