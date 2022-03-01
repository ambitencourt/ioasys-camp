import 'package:flutter/material.dart';
import 'modules/home/homepage.dart';
import 'modules/login/login.dart';
import 'modules/login/register.dart';
import 'modules/splash/splash_page.dart';

void main() async {
  runApp(
    // DevicePreview(
    //   //Esse package é utilizado para testar o app em vários dispositivos.
    //   builder: (_) =>
    const MyApp(),
    //  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: DevicePreview
      //     .appBuilder, //necessário para o funcionamento do DevicePreview
      // locale: DevicePreview.locale(
      //     context), //necessário para o funcionamento do DevicePreview

      debugShowCheckedModeBanner: false,
      title: 'TO-DO',
      theme: ThemeData(
        primaryColor: const Color(0xFFC1007E),
        fontFamily: 'Poppins',
        backgroundColor: Colors.white,
      ),
      //Rotas
      initialRoute: '/splash',
      routes: {
        "/splash": (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const Register(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
