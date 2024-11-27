import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:word_prime/routes/app_routes.dart';
import 'package:word_prime/services/service_local_storage.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(AppRoutes.new);
  locator.registerLazySingleton(ServiceLocalStorage.new);
  locator.registerLazySingleton(EventBus.new);
}