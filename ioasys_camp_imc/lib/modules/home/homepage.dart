import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ioasys_camp_imc/widgets/custom_sizedbox.dart';

import '../../service/store.dart';
import '../../widgets/app_text.dart';
import '../../widgets/show_result.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller imcController = Controller();
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Theme.of(context).primaryColor,
        leading: const Center(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: FaIcon(
              FontAwesomeIcons.weight,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: AppText(
              inputText: 'Calculadora IMC',
              color: Colors.white,
              size: 25,
              weightBold: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              child: const Icon(
                Icons.refresh,
                size: 30,
              ),
              onTap: () {
                heightController.clear();
                weightController.clear();
              },
            ),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Observer(builder: (context) {
                    return Column(
                      children: [
                        const Hero(
                          tag: 'user_profile',
                          child: CircleAvatar(
                            radius: 45,
                            child: FaIcon(
                              FontAwesomeIcons.userAlt,
                              size: 40,
                            ),
                          ),
                        ),
                        customSizedBox10(),
                        RichText(
                          text: const TextSpan(
                            text: 'Olá: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Usuário',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ActionChip(
                            backgroundColor: Colors.grey,
                            avatar: const Icon(Icons.logout),
                            label: const AppText(
                              inputText: 'Sair',
                              color: Colors.white,
                              weightBold: FontWeight.bold,
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                  customSizedBox40(),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      inputText: 'Informe o seu peso e altura:',
                      color: Colors.black,
                      size: 16,
                      textAlign: TextAlign.center,
                      weightBold: FontWeight.bold,
                    ),
                  ),
                  customSizedBox20(),
                  TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: weightController,
                      onChanged: (value) => imcController.setWeight(value),
                      decoration: const InputDecoration(
                        hintText: 'Peso(Kg)',
                        fillColor: Colors.white,
                        labelStyle: TextStyle(fontSize: 16),
                      ),
                      textInputAction: TextInputAction.next),
                  TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: heightController,
                      onChanged: (value) => imcController.setHeight(value),
                      decoration: const InputDecoration(
                        hintText: 'Altura(cm)',
                      ),
                      textInputAction: TextInputAction.send),
                  customSizedBox10(),
                  ElevatedButton(
                    onPressed: () {
                      if (heightController.text == '' ||
                          weightController.text == '') {
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
                        imcController.calcImc();
                        showResult(context, imcController);
                      }
                    },
                    child: const AppText(
                      inputText: 'CALCULAR',
                      size: 20,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(40, 40),
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
