import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/repos/auth_repo.dart';

import '../../data/models/User.dart';
import '../../utils/storage.dart';

class LoginController extends GetxController {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthenticationRepo authenticationRepo = AuthenticationRepo();
  User? _currentUser;

  @override
  void onInit() async {
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

  Future<Map<String, dynamic>?> login() async {
    if (formKey.currentState!.validate()) {
      final loginStatus = await authenticationRepo.login(
          userNameController.text, passwordController.text);
      await getUserBySession();
      return loginStatus;
    }
    return null;
  }

  Future<User?> getUserBySession() async {
    final userDataMap = await authenticationRepo.getUserBySessionId();
    if (userDataMap != null) {
      _currentUser = User.fromJson(userDataMap);
      update();
    }
    return null;
  }

  bool userExists() {
    return _currentUser != null;
  }

  User? get getUser => _currentUser;

  void signOut() {
    LocalStorage.clear();
  }
}
