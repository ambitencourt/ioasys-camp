import "package:mobx/mobx.dart";

//O arquivo de part deve ter o mesmo nome do arquivo gerador
part "store.g.dart";

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  String height = '';

  @observable
  String weight = '';

  @observable
  String result = '';

  @action
  void setHeight(String value) {
    height = value;
  }

  @action
  void setWeight(String value) {
    weight = value;
  }

  @action
  void calcImc() {
    var imc = int.parse(weight) /
        (double.parse(height) * double.parse(height) / 10000);

    if (imc < 18.6) {
      result = "Abaixo do Peso (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 18.6 && imc <= 24.9) {
      result = "Peso Ideal (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 24.9 && imc <= 29.9) {
      result = "Levemente acima do peso (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 24.9 && imc <= 34.9) {
      result = "Obesidade Grau I (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 34.9 && imc <= 39.9) {
      result = "Obesidade Grau II (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 40) {
      result = "Obesidade Grau III (${imc.toStringAsPrecision(2)})";
    }
  }
}
