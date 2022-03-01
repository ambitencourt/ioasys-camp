import 'package:flutter/material.dart';

/// Texto genérico utilizado em todo o app
///
class AppText extends StatelessWidget {
  final String inputText;
  final Color? color;
  final double? size;
  final FontWeight weightBold;
  final TextAlign? textAlign;
  const AppText({
    Key? key,
    required this.inputText,
    this.color,
    this.size,
    this.weightBold = FontWeight.normal,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      style: TextStyle(color: color, fontSize: size, fontWeight: weightBold),
      textAlign: textAlign,
    );
  }
}

// Formulário de Login
// ignore: must_be_immutable
class FormLogin extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Color? fillColor;
  TextEditingController? controller;
  FormLogin({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.fillColor,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF767676),
          ),
          filled: true,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
