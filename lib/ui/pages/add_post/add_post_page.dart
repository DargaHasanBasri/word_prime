import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/add_post/components/add_photo_container.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends BaseStatefulState<AddPostPage> {
  late final AddPostViewModel _vm;

  TextEditingController _turkishWordController = TextEditingController();
  TextEditingController _turkishSentencesController = TextEditingController();
  TextEditingController _englishWordController = TextEditingController();
  TextEditingController _englishSentencesController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<AddPostViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                textFieldTitleColor: AppColors.paleSky,
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
                  textFieldTitleColor: AppColors.paleSky,
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
                textFieldTitleColor: AppColors.paleSky,
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
                  textFieldTitleColor: AppColors.paleSky,
                  hintText: LocaleKeys.addPost_exampleEnglishSentences.locale,
                  hintTextColor: AppColors.paleSky,
                  onChanged: (String text) {
                    _vm.englishSentencesInput.value = text;
                  },
                ),
              );
            },
          ),
          AddPhotoContainer(
            onTap: () {},
          ),
          ValueListenableBuilder(
            valueListenable: _vm.englishWordInput,
            builder: (_, __, ___) {
              return ValueListenableBuilder(
                valueListenable: _vm.turkishWordInput,
                builder: (_, __, ___) {
                  return Padding(
                    padding: AppPaddings.appPaddingVertical,
                    child: CustomButton(
                      title: LocaleKeys.addPost_buttonTitle.locale,
                      backgroundColor: _vm.isEmptyInputText()
                          ? AppColors.cornflowerBlue.withOpacity(0.4)
                          : AppColors.cornflowerBlue,
                      onClick: () {},
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () => appRoutes.popIfBackStackNotEmpty(),
        color: AppColors.mirage,
        icon: Icon(
          Icons.arrow_back_ios,
        ),
      ),
      title: Text(
        LocaleKeys.addPost_title.locale,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
    );
  }
}
