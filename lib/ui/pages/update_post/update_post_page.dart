import 'package:word_prime/export.dart';

class UpdatePostPage extends StatefulWidget {
  const UpdatePostPage({super.key});

  @override
  State<UpdatePostPage> createState() => _UpdatePostPageState();
}

class _UpdatePostPageState extends BaseStatefulState<UpdatePostPage> {
  late final UpdatePostViewModel _vm;

  TextEditingController _turkishWordController = TextEditingController();
  TextEditingController _turkishSentencesController = TextEditingController();
  TextEditingController _englishWordController = TextEditingController();
  TextEditingController _englishSentencesController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<UpdatePostViewModel>(context, listen: false);
    _turkishWordController.text = '${_vm.currentPostModel?.wordTurkish ?? ''}';
    _englishWordController.text = '${_vm.currentPostModel?.wordEnglish ?? ''}';
    _turkishSentencesController.text =
        '${_vm.currentPostModel?.sentenceTurkish?[0] ?? ''}';
    _englishSentencesController.text =
        '${_vm.currentPostModel?.sentenceEnglish?[0] ?? ''}';
    super.initState();
  }

  @override
  void dispose() {
    _turkishWordController.dispose();
    _turkishSentencesController.dispose();
    _englishWordController.dispose();
    _englishSentencesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16),
          ValueListenableBuilder(
            valueListenable: _vm.turkishWordInput,
            builder: (_, __, ___) {
              return CustomTextFormField(
                controller: _turkishWordController,
                textFieldTitle: LocaleKeys.addPost_turkishWordTitle.locale,
                isRequired: true,
                hintText: LocaleKeys.addPost_exampleTurkishWord.locale,
                hintTextColor: AppColors.paleSky,
                onChanged: (String text) {
                  _vm.turkishWordInput.value = text;
                },
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: _vm.englishWordInput,
            builder: (_, __, ___) {
              return Padding(
                padding: AppPaddings.appPaddingVertical,
                child: CustomTextFormField(
                  controller: _englishWordController,
                  textFieldTitle: LocaleKeys.addPost_englishWordTitle.locale,
                  isRequired: true,
                  hintText: LocaleKeys.addPost_exampleEnglishWord.locale,
                  hintTextColor: AppColors.paleSky,
                  onChanged: (String text) {
                    _vm.englishWordInput.value = text;
                  },
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: _vm.turkishSentencesInput,
            builder: (_, __, ___) {
              return CustomTextFormField(
                controller: _turkishSentencesController,
                textFieldTitle: LocaleKeys.addPost_turkishSentencesTitle.locale,
                isRequired: true,
                hintText: LocaleKeys.addPost_exampleTurkishSentences.locale,
                hintTextColor: AppColors.paleSky,
                onChanged: (String text) {
                  _vm.turkishSentencesInput.value = text;
                },
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: _vm.englishSentencesInput,
            builder: (_, __, ___) {
              return Padding(
                padding: AppPaddings.appPaddingVertical,
                child: CustomTextFormField(
                  controller: _englishSentencesController,
                  textInputAction: TextInputAction.done,
                  textFieldTitle:
                      LocaleKeys.addPost_englishSentencesTitle.locale,
                  isRequired: true,
                  hintText: LocaleKeys.addPost_exampleEnglishSentences.locale,
                  hintTextColor: AppColors.paleSky,
                  onChanged: (String text) {
                    _vm.englishSentencesInput.value = text;
                  },
                ),
              );
            },
          ),
          Padding(
            padding: AppPaddings.appPaddingVertical,
            child: ValueListenableBuilder(
                valueListenable: _vm.updatePostModelNotifier,
                builder: (_, __, ___) {
                  return CustomButton(
                    title: 'UPDATE POST',
                    backgroundColor: AppColors.cornflowerBlue,
                    onClick: () {
                      _vm.updatePost();
                      _vm.isEmptyInputText()
                          ? showSnackBar(
                              context: context,
                              content: CustomSnackBarContent(
                                text: LocaleKeys
                                    .warningMessages_emptySpace.locale,
                                iconType: CustomSnackBarType.info,
                              ),
                            )
                          : SizedBox();
                    },
                  );
                }),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.rhino,
      leading: IconButton(
        onPressed: () => appRoutes.popIfBackStackNotEmpty(),
        icon: Image.asset(
          AppAssets.icArrowBackLeftPath,
          color: AppColors.white,
          width: AppSizes.appOverallIconWidth,
          height: AppSizes.appOverallIconHeight,
        ),
      ),
      title: Text(
        'UPDATE POST',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
      ),
    );
  }
}
