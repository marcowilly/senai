import 'package:flutter/material.dart';

/// Widget class TextField
///
/// @author Marco Willy (marco.gomes@araujo.com.br)
/// @since 0.0.1

class TextFieldEx extends StatelessWidget {
  final void Function(String) onSubmitted;
  final String labelText;
  final String hintText;
  final bool isEnable;
  late String text;

  TextFieldEx({
    Key? key,
    required this.onSubmitted,
    required this.labelText,
    required this.hintText,
    this.isEnable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                labelText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            alignment: Alignment.centerLeft),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextFormField(
            onFieldSubmitted: (value) => onSubmitted(value),
            onChanged: (value) {
              text = value;
              onSubmitted(text);
            },
            enabled: isEnable,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 25, 25, 0),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
