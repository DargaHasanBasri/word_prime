import 'package:flutter/material.dart';
import 'package:word_prime/generated/locale_keys.g.dart';
import 'package:word_prime/utils/app_colors.dart';
import 'package:word_prime/utils/app_paddings.dart';
import 'package:word_prime/utils/string_localizations_ext.dart';

class OrTextContainer extends StatelessWidget {
  const OrTextContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.softPeach,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        Padding(
          padding: AppPaddings.paddingMediumHorizontal,
          child: Text(
            LocaleKeys.or.locale,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.santaGrey,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.softPeach,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
