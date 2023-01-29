import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String input = "";
  String result = "0";

  List<String> buttonsList = [
    '←',
    '(',
    ')',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'AC',
    '0',
    '.',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 26, 26),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
        child: Column(
          children: [
            Flexible(
              child: resultWidget(),
              flex: 1,
            ),
            Flexible(
              child: buttonWidget(),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget resultWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              input,
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              result,
              style: const TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonWidget() {
    return GridView.builder(
      itemCount: buttonsList.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return button(buttonsList[index]);
      },
    );
  }

  Widget button(String text) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            handleButtonPress(text);
          });
        },
        color: getButtonBackgroundColor(text),
        textColor: getButtonTextColor(text),
        shape: const CircleBorder(),
        child: Text(
          text,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  void handleButtonPress(String text) {
    if (text == "AC") {
      input = "";
      result = "0";
      return;
    }

    if (text == '←') {
      input = input.substring(0, input.length - 1);
      return;
    }

    if (text == "=") {
      result = calculate();

      if (result.endsWith(".0")) result = result.replaceAll(".0", "");

      return;
    }

    input = input + text;
  }

  String calculate() {
    String convertInput;
    convertInput = input.replaceAll('x', '*');
    convertInput = convertInput.replaceAll('÷', '/');
    try {
      var exp = Parser().parse(convertInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }

  Color getButtonBackgroundColor(String text) {
    if (text == '÷' || text == 'x' || text == '+' || text == '-')
      return Color.fromARGB(255, 255, 212, 0);

    if (text == '←' || text == '(' || text == ')') return Colors.grey;

    if (text == 'AC' || text == '=') return Color.fromARGB(255, 0, 103, 163);

    return Colors.white;
  }

  Color getButtonTextColor(String text) {
    if (text == '÷' || text == 'x' || text == '+' || text == '-')
      return Colors.white;

    if (text == 'AC' || text == '=') return Colors.white;

    return Colors.black;
  }
}
