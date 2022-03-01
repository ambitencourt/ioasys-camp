import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ioasys_camp_imc/widgets/custom_sizedbox.dart';

import '../service/store.dart';

Future<dynamic> showResult(BuildContext context, Controller imcController) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Text(
        'Meu IMC',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      content: Row(
        children: <Widget>[
          Image.asset(
            'assets/images/imc.png',
            height: 80,
          ),
          customSizedBoxwidth5(),
          Expanded(
            child: Observer(
              builder: (_) => Text(
                imcController.result,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        )
      ],
    ),
  );
}
