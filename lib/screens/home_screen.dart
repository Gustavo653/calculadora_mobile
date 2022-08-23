import 'package:calculator/calculator.dart';
import 'package:calculator/components/display.dart';
import 'package:calculator/constants.dart';
import 'package:calculator/components/keyboard.dart';
import 'package:calculator/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String _primaryDisplayText = '';
  String _secondaryDisplayText = '';

  void buttonPressed(String id) {
    setState(
      () {
        if (id == ButtonId.ac) {
          _primaryDisplayText = '';
          _secondaryDisplayText = '';
        } else if (id == ButtonId.equal) {
          double result = calculate(_primaryDisplayText);
          if (result != double.infinity) {
            _secondaryDisplayText = _primaryDisplayText;
            _primaryDisplayText = cleanResult(result);
          } else {
            _secondaryDisplayText = 'Bad expression';
          }
        } else if (id == ButtonId.backspace) {
          _primaryDisplayText =
              _primaryDisplayText.replaceAll(RegExp(r'.$'), '');
          double result = calculate(_primaryDisplayText);
          if (result != double.infinity) {
            _secondaryDisplayText = cleanResult(result);
          }
        } else {
          _primaryDisplayText += id;
          double result = calculate(_primaryDisplayText);
          if (result != double.infinity) {
            _secondaryDisplayText = cleanResult(result);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: Colors.transparent,
        title: Container(
          margin: const EdgeInsets.only(left: 8),
          child: const Text(kTitle),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Display(
                  primaryText: _primaryDisplayText,
                  secondaryText: _secondaryDisplayText),
            ),
            Expanded(
              flex: 2,
              child: Keyboard(buttonPressed),
            ),
          ],
        ),
      ),
    );
  }
}
