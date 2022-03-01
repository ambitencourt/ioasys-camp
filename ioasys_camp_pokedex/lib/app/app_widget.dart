import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'modules/domain/usecases/themes/themes.dart';
import 'modules/domain/usecases/themes/notifier_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['assets/languages'];

    return ValueListenableBuilder<ThemeMode>(
        valueListenable: ThemeNotifier.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'Pokédex',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              LocalJsonLocalization.delegate
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('es', 'ES'),
              Locale('pt', 'BR'),
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              if (supportedLocales.contains(locale)) {
                return locale;
              }

              if (locale?.languageCode == 'pt') {
                return const Locale('pt', 'BR');
              } else if (locale?.languageCode == 'es') {
                return const Locale('es', 'ES');
              }

              return const Locale('en', 'US');
            },
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            themeMode: currentMode,
            initialRoute: '/',
            // ignore: deprecated_member_use
          ).modular();
        });
  }
}
