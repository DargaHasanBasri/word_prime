import 'package:flutter/cupertino.dart';
import 'package:word_prime/services/service_local_storage.dart';
import 'package:word_prime/services/service_locator.dart';

class BaseViewModel extends ChangeNotifier {
  final ServiceLocalStorage serviceLocalStorage =
      locator<ServiceLocalStorage>();
}
