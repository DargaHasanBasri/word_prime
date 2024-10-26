import 'package:easy_localization/easy_localization.dart';
import 'package:word_prime/export.dart';
import 'package:word_prime/utils/theme/custom_app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await setupLocator();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppLocaleConstants.TR_LOCALE,
        AppLocaleConstants.EN_LOCALE,
      ],
      path: AppLocaleConstants.LANG_PATH,
      saveLocale: true,
      fallbackLocale: AppLocaleConstants.EN_LOCALE,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppLocaleConstants.APP_NAME,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: ThemeMode.dark,
      theme: CustomAppTheme.lightTheme,
      darkTheme: CustomAppTheme.darkTheme,
      navigatorKey: locator<AppRoutes>().baseNavigatorKey,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.MainTab,
      builder: (context, widget) {
        return widget!;
      },
    );
  }
}
