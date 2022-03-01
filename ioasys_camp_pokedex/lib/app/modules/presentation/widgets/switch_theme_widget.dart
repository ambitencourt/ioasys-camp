import 'package:flutter/material.dart';
import '../../domain/usecases/themes/notifier_theme.dart';

class SwitchThemeWidget extends StatefulWidget {
  const SwitchThemeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SwitchThemeWidget> createState() => _SwitchThemeWidgetState();
}

class _SwitchThemeWidgetState extends State<SwitchThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
      height: 27,
      width: 49,
      child: Switch.adaptive(
        activeColor: Theme.of(context).colorScheme.primary,
        activeTrackColor: Theme.of(context).colorScheme.primary,
        value: ThemeNotifier.themeNotifier.value
            .toString()
            .contains(ThemeMode.dark.toString()),
        onChanged: (value) {
          setState(() {});
          ThemeNotifier.themeNotifier.value =
              ThemeNotifier.themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
        },
      ),
    );
  }
}
