import 'package:flutter/material.dart';
import 'package:word_prime/base/base_stateful_state.dart';
import 'package:word_prime/utils/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseStatefulState<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cornflowerBlue,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.white,
            child: Image.asset(
              'assets/images/ic_app_logo.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 10),
            child: Text(
              'WordPrime',
              style: TextStyle(
                fontSize: 24,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            'Unlock your potential with us!',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
