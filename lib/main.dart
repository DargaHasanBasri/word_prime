import 'package:easy_localization/easy_localization.dart';
import 'package:word_prime/export.dart';

Future<void> main() async {
  await AppStart.init();
  runApp(
    AppLocalization(
      child: ChangeNotifierProvider(
        create: (context) => AppThemeProvider(),
        child: const MyApp(),
      ),
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
      themeMode: Provider.of<AppThemeProvider>(context).themeMode,
      theme: CustomAppTheme.lightTheme,
      darkTheme: CustomAppTheme.darkTheme,
      navigatorKey: locator<AppRoutes>().baseNavigatorKey,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.Login,
      builder: (context, widget) {
        return widget!;
      },
    );
  }
}
