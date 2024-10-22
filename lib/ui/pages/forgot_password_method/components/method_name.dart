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
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
        ),
        SizedBox(height: AppSizes.sizedBoxSmallHeight),
        Text(
          LocaleKeys.forgotPassword_forgotMethodNameMsg.locale,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: AppSizes.sizedBoxLargeHeight),
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
