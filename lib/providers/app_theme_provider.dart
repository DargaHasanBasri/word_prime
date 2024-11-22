import 'package:flutter/material.dart';
import 'package:word_prime/services/service_local_storage.dart';
import 'package:word_prime/services/service_locator.dart';

final class AppThemeProvider extends ChangeNotifier {
  final ServiceLocalStorage _serviceLocalStorage =
      locator<ServiceLocalStorage>();
  final _brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      return _brightness == Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  Future<void> toggleTheme(bool isOn) async {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    await _serviceLocalStorage.setString('themeMode', isOn ? 'dark' : 'light');
    notifyListeners();
  }

  Future<void> loadThemeFromPreferences() async {
    await _serviceLocalStorage.getInstance();
    String? savedTheme = _serviceLocalStorage.getString('themeMode');
    if (savedTheme != null) {
      _themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    } else {
      _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }
}
