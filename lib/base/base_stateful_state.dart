import 'package:flutter/material.dart';
import 'package:word_prime/routes/app_routes.dart';
import 'package:word_prime/services/service_locator.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  final AppRoutes appRoutes = locator<AppRoutes>();

}
