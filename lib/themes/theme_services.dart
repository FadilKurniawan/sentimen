import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentimen/data/storage/storage_manager.dart';

class ThemeService {
  final _box = StorageManager();
  final _key = 'isDarkMode';

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool isDarkMode() => _box.get(_key) ?? false;
  bool _loadThemeFromBox() => _box.get(_key) ?? false;
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
