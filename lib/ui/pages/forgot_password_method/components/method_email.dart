import 'package:word_prime/export.dart';

class MethodEmail extends StatelessWidget {
  final TextEditingController emailController;
  const MethodEmail({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Enter your email',
          style: TextStyle(
            color: AppColors.mirage,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Please enter a email address to request a password reset.',
          style: TextStyle(
            color: AppColors.paleSky,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 40),
        CustomTextFormField(
          controller: emailController,
          hintText: LocaleKeys.emailHintText.locale,
          isPrefixIcon: true,
          prefixIconAddress: AppAssets.icSmsPath,
        ),
      ],
    );
  }
}
