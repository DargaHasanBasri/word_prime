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
          'Enter your name',
          style: TextStyle(
            color: AppColors.mirage,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Please enter a name to request a password reset.',
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
