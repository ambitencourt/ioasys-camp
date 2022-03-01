import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashController {
  load() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    await Hive.initFlutter();

    Modular.to.navigate('/home');
  }
}
