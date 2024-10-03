import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_prime/ui/pages/splash/splash_page.dart';
import 'package:word_prime/ui/pages/splash/splash_view_model.dart';

class SplashProvider extends StatelessWidget {
  const SplashProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashViewModel(),
      child: const SplashPage(),
    );
  }
}
