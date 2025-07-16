import 'package:calculator/calcbutton.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resultScreen = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(resultScreen,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Calcbutton(
                            title: "AC",
                            colorButton: const Color(0xFF616161),
                            colorTitle: Colors.white,
                            onclick: onAcButton,
                          ),
                          Expanded(
                              child: Container(
                            margin: const EdgeInsets.all(8),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF616161),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.all(22),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              onPressed: () {
                                resultScreen = resultScreen.substring(
                                    0, resultScreen.length - 1);
                                setState(() {});
                              },
                              child: const Icon(
                                  Icons.remove_circle_outline_rounded,
                                  size: 20),
                            ),
                          )),
                          Calcbutton(
                            title: "%",
                            colorTitle: Colors.white,
                            colorButton: const Color(0xFF005DB2),
                            onclick: operatorClicked,
                          ),
                          Calcbutton(
                            title: "*",
                            colorTitle: Colors.white,
                            colorButton: const Color(0xFF005DB2),
                            onclick: operatorClicked,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Calcbutton(
                            title: "7",
                            colorButton: const Color(0xFF303136),
                            colorTitle: const Color(0xFF005DB2),
                            onclick: onButtonClicked,
                          ),
                          Calcbutton(
                            title: "8",
                            colorButton: const Color(0xFF303136),
                            colorTitle: const Color(0xFF005DB2),
                            onclick: onButtonClicked,
                          ),
                          Calcbutton(
                            title: "9",
                            colorButton: const Color(0xFF303136),
                            colorTitle: const Color(0xFF005DB2),
                            onclick: onButtonClicked,
                          ),
                          Calcbutton(
                            title: "/",
                            colorTitle: Colors.white,
                            colorButton: const Color(0xFF005DB2),
                            onclick: operatorClicked,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Calcbutton(
                            title: "4",
                            colorButton: const Color(0xFF303136),
                            colorTitle: const Color(0xFF005DB2),
                            onclick: onButtonClicked,
                          ),
                          Calcbutton(
                            title: "5",
                            colorButton: const Color(0xFF303136),
                            colorTitle: const Color(0xFF005DB2),
                            onclick: onButtonClicked,
                          ),
                          Calcbutton(
                            title: "6",
                            colorButton: const Color(0xFF303136),
                            colorTitle: const Color(0xFF005DB2),
                            onclick: onButtonClicked,
                          ),
                          Calcbutton(
                            title: "+",
                            colorTitle: Colors.white,
                            colorButton: const Color(0xFF005DB2),
                            onclick: operatorClicked,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Calcbutton(
                              title: "1",
                              colorButton: const Color(0xFF303136),
                              colorTitle: const Color(0xFF005DB2),
                              onclick: onButtonClicked),
                          Calcbutton(
                              title: "2",
                              colorButton: const Color(0xFF303136),
                              colorTitle: const Color(0xFF005DB2),
                              onclick: onButtonClicked),
                          Calcbutton(
                              title: "3",
                              colorButton: const Color(0xFF303136),
                              colorTitle: const Color(0xFF005DB2),
                              onclick: onButtonClicked),
                          Calcbutton(
                              title: "-",
                              colorTitle: Colors.white,
                              colorButton: const Color(0xFF005DB2),
                              onclick: operatorClicked)
                        ],
                      ),
                      Row(
                        children: [
                          Calcbutton(
                              title: "00",
                              colorButton: const Color(0xFF303136),
                              colorTitle: const Color(0xFF005DB2),
                              onclick: onButtonClicked),
                          Calcbutton(
                              title: "0",
                              colorButton: const Color(0xFF303136),
                              colorTitle: const Color(0xFF005DB2),
                              onclick: onButtonClicked),
                          Calcbutton(
                              title: ".",
                              colorButton: const Color(0xFF303136),
                              colorTitle: const Color(0xFF005DB2),
                              onclick: onButtonClicked),
                          Calcbutton(
                              title: "=",
                              colorTitle: Colors.white,
                              colorButton: const Color(0xFF005DB2),
                              onclick: onEqualClicked)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  onButtonClicked(title) {
    // one operation
    /*if (op == "=") {
      resultScreen = "";
      op = "";
    }*/
    resultScreen += title;
    setState(() {});
  }

  onAcButton(title) {
    LHS = "";
    op = "";
    resultScreen = "";
    setState(() {});
  }

  String LHS = "";
  String op = "";
  operatorClicked(operator) {
    if (op.isEmpty) {
      LHS = resultScreen;
    } else {
      //if i need make opertions after i click equal
      if (op == "=") {
        LHS = resultScreen;
      } else {
        LHS = calculate(LHS, op, resultScreen);
      }
    }
    op = operator;
    resultScreen = "";
  }

  String calculate(LHS, op, RHS) {
    double lhs = double.parse(LHS);
    double rhs = double.parse(RHS);
    double result;

    if (op == "+") {
      result = lhs + rhs;
      return result.toString();
    } else if (op == "-") {
      result = lhs - rhs;
      return result.toString();
    } else if (op == "*") {
      result = lhs * rhs;
      return result.toString();
    } else if (op == "/") {
      result = lhs / rhs;
      return result.toString();
    } else if (op == "%") {
      result = lhs % rhs;
      return result.toString();
    } else {
      return "";
    }
  }

  onEqualClicked(operator) {
    resultScreen = calculate(LHS, op, resultScreen);
    op = operator;
    setState(() {});
  }
  //remove the end digit
}
