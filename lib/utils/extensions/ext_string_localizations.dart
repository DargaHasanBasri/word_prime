import 'package:easy_localization/easy_localization.dart';

extension ExtStringLocalization on String {
  String get locale => this.tr();
}
