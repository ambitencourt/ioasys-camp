import 'package:flutter_modular/flutter_modular.dart';
import 'modules/routes_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/home', module: RoutesModule()),
      ];
}
