import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
    ).then((value) {
      Navigator.pushReplacementNamed(context, "/login");
    });
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
              ),
              Lottie.asset(
                'assets/animations/weight-measure-machine2.json',
                width: 150,
                height: 150,
              ),
              SizedBox(
                child: TextLiquidFill(
                  boxWidth: 350,
                  boxHeight: 70,
                  waveDuration: const Duration(seconds: 3),
                  loadDuration: const Duration(seconds: 4),
                  text: 'CALCULADORA IMC',
                  waveColor: Colors.white,
                  boxBackgroundColor: Theme.of(context).primaryColor,
                  textStyle: GoogleFonts.rowdies(
                    textStyle: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
