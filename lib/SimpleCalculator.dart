import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}
class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText){
    setState(() {
      if (buttonText == "C"){
        equation = "0";
        result = "0";
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;

      }else if (buttonText == "x"){
        double equationFontSize = 48.0;
        double resultFontSize = 38.0;
        equation = equation.substring(0,equation.length - 1);
        if (equation == ""){
          equation = "0";
        }

      }else if (buttonText == "="){
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('x','*');
        expression = expression.replaceAll('/', '/');

        try{
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL,cm)}';
        }catch(e){
          result = "Error";
        }

      }else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0"){
          equation = buttonText;
        }
        equation = equation + buttonText;
      }
    });

  }
  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.white38,
              width: 1,
              style: BorderStyle.solid,
            )
        ),
        padding: EdgeInsets.all(15.0),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation,style: TextStyle(fontSize: equationFontSize)),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result,style: TextStyle(fontSize: resultFontSize)),
          ),

          Expanded(
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("C", 1, Colors.blueAccent ),
                          buildButton("x", 1, Colors.greenAccent ),
                          buildButton("/", 1, Colors.redAccent ),


                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.black ),
                          buildButton("8", 1, Colors.black ),
                          buildButton("9", 1, Colors.black ),


                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.black ),
                          buildButton("5", 1, Colors.black ),
                          buildButton("6", 1, Colors.black ),


                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.black ),
                          buildButton("2", 1, Colors.black ),
                          buildButton("3", 1, Colors.black ),


                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.black ),
                          buildButton("0", 1, Colors.black ),
                          buildButton("00", 1, Colors.black ),


                        ]
                    )
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("*",1,Colors.blue),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("-",1,Colors.blue),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("+",1,Colors.blue),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("/",1,Colors.blue),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("=",1,Colors.redAccent),
                        ]
                    )
                  ],
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
