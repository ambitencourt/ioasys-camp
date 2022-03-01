import 'package:localization/localization.dart';
import 'package:flutter/material.dart';
import '../../domain/usecases/themes/notifier_theme.dart';
import 'switch_theme_widget.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/logo.png',
                    width: 27,
                    height: 27,
                    color: ThemeNotifier.themeNotifier.value == ThemeMode.light
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary),
                Image.asset(
                  'assets/images/Pokeball.png',
                  color: ThemeNotifier.themeNotifier.value == ThemeMode.light
                      ? Colors.black.withOpacity(0.9)
                      : Theme.of(context).colorScheme.secondary,
                  width: 60,
                  height: 60,
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'title'.i18n(),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ThemeNotifier.themeNotifier.value == ThemeMode.light
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
        const SwitchThemeWidget(),
      ],
    );
  }
}
