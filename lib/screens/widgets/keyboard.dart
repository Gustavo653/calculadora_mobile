import 'package:calculator/constants.dart';
import 'package:calculator/screens/widgets/keyboard_button.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final Function passToButton;

  const Keyboard(this.passToButton, {Key? key}) : super(key: key);

  Widget rowButton(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons
            .map((id) =>
                KeyboardButton(id: id, onPressed: () => passToButton(id)))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF292D36),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Column(
        children: <Widget>[
          rowButton([
            ButtonId.ac,
            ButtonId.openParenthesis,
            ButtonId.closeParenthesis,
            ButtonId.division,
          ]),
          rowButton([
            ButtonId.seven,
            ButtonId.eight,
            ButtonId.nine,
            ButtonId.multiplication,
          ]),
          rowButton([
            ButtonId.four,
            ButtonId.five,
            ButtonId.six,
            ButtonId.minus,
          ]),
          rowButton([
            ButtonId.one,
            ButtonId.two,
            ButtonId.three,
            ButtonId.plus,
          ]),
          rowButton([
            ButtonId.decimalSeparator,
            ButtonId.zero,
            ButtonId.backspace,
            ButtonId.equal,
          ]),
        ],
      ),
    );
  }
}
