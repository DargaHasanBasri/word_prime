import 'package:shared_preferences/shared_preferences.dart';

/// This class provides a local storage service using the
/// `SharedPreferences` package.
/// It allows saving, retrieving, and removing key-value pairs
/// locally on the device.
final class ServiceLocalStorage {
  static SharedPreferences? _preferences;

  /// Initializes the SharedPreferences instance if it hasn't been
  /// initialized already.
  /// This method should be called before any other method to ensure
  /// `_preferences` is not null.
  Future<void> getInstance() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  /// Retrieves a string value from local storage for the given [key].
  /// Returns null if the key does not exist or if `_preferences`
  /// is not initialized.
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  /// Stores a string [value] in local storage under the given [key].
  /// Returns a `Future` that completes when the operation is finished.
  Future<void> setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  /// Removes a value from local storage for the given [key], effectively logging out the user.
  /// Returns a `Future` that completes when the operation is finished.
  Future<void> logout(String key) async {
    await _preferences?.remove(key);
  }

  /// Checks if a value exists in local storage for the given [key].
  /// Returns `true` if the value exists, indicating the user is logged in,
  /// and `false` otherwise.
  bool isLoggedIn(String key) {
    return _preferences?.getString(key) != null;
  }
}
