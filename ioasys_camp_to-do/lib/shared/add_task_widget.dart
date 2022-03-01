import 'package:flutter/material.dart';

class InputTaskWidget extends StatelessWidget {
  final String labelText;
  final String textButton;
  final TextEditingController textController;
  final Function()? onPressed;

  const InputTaskWidget(
      {Key? key,
      required this.textController,
      this.onPressed,
      required this.labelText,
      required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle:
                  const TextStyle(fontSize: 12, color: Color(0xFFC1007E)),
            ),
          ),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              textButton,
              style: const TextStyle(fontSize: 12),
            ))
      ],
    );
  }
}
