import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/settings/components/settings_item.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends BaseStatefulState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildAppBar(),
      body: Padding(
        padding: AppPaddings.appPaddingAll,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: AppPaddings.paddingMediumAll,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.softPeach),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingsItem(
            title: LocaleKeys.settings_profileDetails.locale,
            onTab: () {},
            iconAddress: AppAssets.icUserPath,
          ),
          Padding(
            padding: AppPaddings.paddingMediumVertical,
            child: customDivider(),
          ),
          SettingsItem(
            title: LocaleKeys.settings_language.locale,
            onTab: () {},
            iconAddress: AppAssets.icLanguagePath,
          ),
          Padding(
            padding: AppPaddings.paddingMediumVertical,
            child: customDivider(),
          ),
          SettingsItem(
            title: LocaleKeys.settings_notifications.locale,
            onTab: () {},
            iconAddress: AppAssets.icNotificationPath,
          ),
          Padding(
            padding: AppPaddings.paddingMediumVertical,
            child: customDivider(),
          ),
          SettingsItem(
            title: LocaleKeys.settings_chooseTheme.locale,
            onTab: () {},
            iconAddress: AppAssets.icDarkModePath,
          ),
          Padding(
            padding: AppPaddings.paddingMediumVertical,
            child: customDivider(),
          ),
          SettingsItem(
            title: LocaleKeys.settings_faqs.locale,
            onTab: () {},
            iconAddress: AppAssets.icFaqsPath,
          ),
          Padding(
            padding: AppPaddings.paddingMediumVertical,
            child: customDivider(),
          ),
          SettingsItem(
            title: LocaleKeys.settings_helpCenter.locale,
            onTab: () {},
            iconAddress: AppAssets.icHelpPath,
          ),
        ],
      ),
    );
  }

  Widget customDivider() {
    return Container(
      height: 2,
      decoration: BoxDecoration(
        color: AppColors.softPeach,
        borderRadius: BorderRadius.circular(16),
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
        LocaleKeys.settings_title.locale,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
    );
  }
}
