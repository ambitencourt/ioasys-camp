import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ioasys_camp_imc/widgets/app_text.dart';
import 'package:ioasys_camp_imc/widgets/custom_sizedbox.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const String aqui = 'aqui    ';
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SizedBox(
          height: constraints.maxHeight,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * .04,
                  ),
                  Image.asset('assets/images/logo.png'),
                  //customSizedBox20(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AppText(
                          inputText: 'Seja bem-vindo à ',
                          size: 25,
                          weightBold: FontWeight.bold,
                          color: Colors.white,
                        ),
                        Text(
                          'Calculadora IMC',
                          style: GoogleFonts.rowdies(
                            textStyle: const TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Lottie.asset(
                          'assets/animations/weight-measure-machine2.json',
                          width: 50,
                          height: 50,
                        ),
                        customSizedBox20(),
                        const AppText(
                          inputText:
                              'Faça login e aproveite todas as funcionalidades',
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  customSizedBox10(),
                  FormLogin(
                    controller: userController,
                    hintText: 'Usuário',
                    fillColor: Colors.white,
                  ),
                  customSizedBox10(),
                  FormLogin(
                    controller: passController,
                    hintText: 'Senha',
                    obscureText: true,
                    fillColor: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pushNamed('/register');
                          });
                        },
                        child: const AppText(
                          inputText: 'Esqueci minha senha',
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (userController.text == '' ||
                          passController.text == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Favor preencher todos os campos!',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      } else {
                        Navigator.of(context).pushNamed('/home');
                      }
                    },
                    child: const Hero(
                      tag: 'user_profile',
                      child: AppText(
                        inputText: 'ENTRAR',
                        size: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(45, 45),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  customSizedBox40(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText(
                          inputText: 'Não tem uma conta, cadastre-se',
                          color: Colors.black,
                          size: 16,
                          weightBold: FontWeight.bold,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pushNamed('/register');
                            });
                          },
                          child: const AppText(
                            inputText: aqui,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  customSizedBox20(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pushNamed('/home');
                      });
                    },
                    child: const AppText(
                      inputText: 'PULAR PARA A PÁGINA INICIAL',
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
