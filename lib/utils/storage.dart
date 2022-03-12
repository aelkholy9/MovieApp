import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static void put(String key, String value) async {
    log("*** Saving sessionID");
    GetStorage storage = GetStorage();
    await storage.write(key, value);
  }

  static Future<String> get(String key) async {
    GetStorage storage = GetStorage();
    return await storage.read(key);
  }
}
