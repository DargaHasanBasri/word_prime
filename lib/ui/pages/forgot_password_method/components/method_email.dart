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
          LocaleKeys.forgotPassword_enterMailHintText.locale,
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
        ),
        SizedBox(height: AppSizes.sizedBoxSmallHeight),
        Text(
          LocaleKeys.forgotPassword_forgotMethodEmailMsg.locale,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: AppSizes.sizedBoxLargeHeight),
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
