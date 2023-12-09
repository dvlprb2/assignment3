import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  CalcScreenState createState() => CalcScreenState();
}

class CalcScreenState extends State<CalcScreen> {
  String _input = '';
  String _output = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        try {
          _output = _evaluateExpression();
        } catch (e) {
          _output = 'Error';
        }
        _input = '';
      } else if (buttonText == 'C') {
        _input = '';
        _output = '';
      } else {
        _input += buttonText;
      }
    });
  }

  String _evaluateExpression() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_input);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      return result.toString();
    } catch (e) {
      return 'Error';
    }
  }

  Widget _buildButton(String buttonText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(60, 60),
          textStyle: const TextStyle(fontSize: 24),
        ),
        child: Text(buttonText),
      ),
    );
  }

  Widget _buildBorderText(String text) {
    return Container(
      width: 100.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display input and output with borders
            _buildBorderText(_input),
            const SizedBox(height: 16),
            _buildBorderText(_output),
            const SizedBox(height: 16),
            // Calculator buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('/'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('*'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton('0'),
                _buildButton('C'),
                _buildButton('='),
                _buildButton('+'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
