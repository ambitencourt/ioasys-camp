import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ioasys_camp_imc/widgets/app_text.dart';
import 'package:ioasys_camp_imc/widgets/custom_sizedbox.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController passConfirmController = TextEditingController();
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: Image.asset('assets/images/logo_home1.png'),
          title: const AppText(
            inputText: 'Cadastre-se!',
            color: Colors.white,
            size: 31,
            weightBold: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: SizedBox(
          height: constraints.maxHeight,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * .01,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .01,
                  ),
                  InkWell(
                    child: SizedBox(
                      child: Column(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.userAlt,
                            size: 60,
                            color: Color.fromARGB(255, 238, 228, 228),
                          ),
                          customSizedBox10(),
                          const AppText(
                            inputText: 'Alterar imagem',
                            color: Color.fromARGB(255, 238, 228, 228),
                            size: 15,
                            weightBold: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  customSizedBox10(),
                  //Usuário
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        inputText: 'Usuário',
                        color: Colors.white,
                        size: 16,
                        textAlign: TextAlign.left,
                        weightBold: FontWeight.bold,
                      ),
                      FormLogin(
                        controller: userController,
                        hintText: '',
                        fillColor: Colors.white,
                      ),
                    ],
                  ),
                  customSizedBox10(),
                  //Senha
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        inputText: 'Senha',
                        color: Colors.white,
                        size: 16,
                        textAlign: TextAlign.left,
                        weightBold: FontWeight.bold,
                      ),
                      FormLogin(
                        controller: passController,
                        hintText: '',
                        fillColor: Colors.white,
                      ),
                    ],
                  ),
                  customSizedBox10(),
                  //Confirmar senha
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        inputText: 'Confirmar senha',
                        color: Colors.white,
                        size: 16,
                        textAlign: TextAlign.left,
                        weightBold: FontWeight.bold,
                      ),
                      FormLogin(
                        controller: passConfirmController,
                        hintText: '',
                        fillColor: Colors.white,
                      ),
                    ],
                  ),
                  customSizedBox20(),
                  ElevatedButton(
                    onPressed: () {
                      if (userController.text == '' ||
                          passController.text == '' ||
                          passConfirmController.text == '') {
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
                        Navigator.of(context).pushNamed('/login');
                      }
                    },
                    child: const AppText(
                      inputText: 'CADASTRAR',
                      size: 20,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(45, 45),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  customSizedBox10(),
                  //Já tem conta
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Já tem uma conta, faça login ',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 18,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'aqui',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
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
