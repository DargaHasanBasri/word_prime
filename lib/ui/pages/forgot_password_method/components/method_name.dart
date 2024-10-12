import 'package:word_prime/export.dart';

class MethodName extends StatelessWidget {
  final TextEditingController nameController;
  const MethodName({
    super.key,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LocaleKeys.forgotPassword_enterNameHintText.locale,
          style: TextStyle(
            color: AppColors.mirage,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Text(
          LocaleKeys.forgotPassword_forgotMethodNameMsg.locale,
          style: TextStyle(
            color: AppColors.paleSky,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 40),
        CustomTextFormField(
          controller: nameController,
          hintText: LocaleKeys.nameHintText.locale,
          isPrefixIcon: true,
          prefixIconAddress: AppAssets.icUserPath,
        ),
      ],
    );
  }
}
