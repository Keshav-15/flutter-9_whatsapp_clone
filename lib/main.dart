import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:whatsapp/providers/localization_provider.dart';
import 'package:whatsapp/theme/theme_data.dart';
import 'package:whatsapp/ui/home/home_screen.dart';
import 'package:whatsapp/utils/local_storage.dart/local_storage.dart';
import 'package:whatsapp/utils/localization/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedLocale = await LocaleStorage.loadLocale();
  final localeController = LocaleController(savedLocale);
  runApp(MyApp(localeController: localeController));
}

class MyApp extends StatelessWidget {
  final LocaleController localeController;
  const MyApp({super.key, required this.localeController});

  @override
  Widget build(BuildContext context) {
    return LocaleProvider(
      localeController: localeController,
      child: AnimatedBuilder(
          animation: localeController,
          builder: (context, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,
              locale: localeController.locale,
              supportedLocales: Localization.supportedLocales,
              localizationsDelegates: const [
                Localization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: HomeScreen(),
            );
          }),
    );
  }
}
