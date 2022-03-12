import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/repos/auth_repo.dart';

import '../../data/models/User.dart';
import '../../utils/storage.dart';

class LoginController extends GetxController {
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthenticationRepo authenticationRepo = AuthenticationRepo();
  User? _currentUser;

  @override
  void onInit() async {
    log('init login control ****');
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    await getUserBySession();
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    formKey.currentState?.deactivate();
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
      clearControllers();
      update();
      return loginStatus;
    }
    return null;
  }

  Future<User?> getUserBySession() async {
    try {
      final userDataMap = await authenticationRepo.getUserBySessionId();
      if (userDataMap != null) {
        _currentUser = User.fromJson(userDataMap);
        update();
      }
    } catch (e) {
      log("$e");
    }
    return null;
  }

  bool userExists() {
    log('userExist: ${_currentUser?.id}');
    return _currentUser?.id != null;
  }

  User? get getUser => _currentUser;

  void signOut() async {
    try {
      LocalStorage.clear();
      _currentUser?.id = null;
      _currentUser = null;
      update();
    } catch (e) {
      log('logging out: $e');
    }
  }

  void clearControllers() {
    userNameController.clear();
    passwordController.clear();
    update();
  }
}
