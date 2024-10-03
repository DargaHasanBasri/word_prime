import 'package:get_it/get_it.dart';
import 'package:word_prime/routes/app_routes.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(AppRoutes.new);
}