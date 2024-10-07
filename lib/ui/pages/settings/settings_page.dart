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
    return Column(
      children: [
        Container(
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
                onTab: () => appRoutes.navigateTo(Routes.ProfileDetails),
                iconAddress: AppAssets.icUserPath,
                isFirst: true,
              ),
              customDivider(),
              SettingsItem(
                title: LocaleKeys.settings_language.locale,
                onTab: () {},
                iconAddress: AppAssets.icLanguagePath,
              ),
              customDivider(),
              SettingsItem(
                title: LocaleKeys.settings_notifications.locale,
                onTab: () {},
                iconAddress: AppAssets.icNotificationPath,
              ),
              customDivider(),
              SettingsItem(
                title: LocaleKeys.settings_chooseTheme.locale,
                onTab: () {},
                iconAddress: AppAssets.icDarkModePath,
              ),
              customDivider(),
              SettingsItem(
                title: LocaleKeys.settings_faqs.locale,
                onTab: () {},
                iconAddress: AppAssets.icFaqsPath,
              ),
              customDivider(),
              SettingsItem(
                title: LocaleKeys.settings_helpCenter.locale,
                onTab: () {},
                iconAddress: AppAssets.icHelpPath,
                isLast: true,
              ),
            ],
          ),
        ),
        const Spacer(),
        Image.asset(
          AppAssets.appLogoPath,
          height: 40,
          width: 40,
        ),
        SizedBox(height: 10),
        Text(
          LocaleKeys.appTitle.locale,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.mirage,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
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
