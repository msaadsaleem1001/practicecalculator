import 'package:calculator/commonbtn.dart';
import 'package:calculator/pop_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '0';
  var result = '';
  String tempuserinput = '';
  String plusminusfunction = '';
  int secondlastoperatorindex = 0;
  int lastOperatorIndex = 0;
  bool operator = false;
  bool operand = false;
  String lastOperand = '';
  String previousInput = '';
  String currentvalue = '';
  String mode = "Dark";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: mode == "Dark" ? Colors.black : Colors.white,
        appBar: AppBar(
          leading: Padding( padding: EdgeInsets.only(left: 20),
              child: const Image(image: AssetImage("images/icon_calculator.png",))),
          backgroundColor: mode == "Dark" ? Colors.black : Colors.teal,
          actions: [
            PopupMenuButton(
                offset: const Offset(-15, 60),
                shape: const TooltipShape(),
                onSelected: (value) {
                  if (value == 0) {
                    mode = "Dark";
                    setState(() {});
                  } else {
                    mode = "Light";
                    setState(() {});
                  }
                },
                color: mode == "Dark" ? Colors.grey.shade900 : Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.more_vert),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                        "Dark mode",
                        style: TextStyle(
                          color: mode == "Dark" ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text(
                        "Light mode",
                        style: TextStyle(
                            color:
                                mode == "Dark" ? Colors.white : Colors.black),
                      ),
                    ),
                  ];
                }),
          ],
          title: const Center(
            child: Text(
              "Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Text(
                                  userInput.toString(),
                                  style: TextStyle(
                                      color: mode == 'Dark'
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 40.0),
                                ),
                              ),
                            ]),
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 25),
                              child: Opacity(
                                opacity: 0.5,
                                child: Text(
                                  result.toString(),
                                  style: TextStyle(
                                      color: mode == 'Dark'
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CalculatorButtons(
                            title: 'AC',
                            txtColor: Colors.white,
                            commonColor: Colors.deepPurpleAccent,
                            onPress: () {
                              userInput = '0';
                              tempuserinput = '';
                              plusminusfunction = '';
                              result = '';
                              currentvalue = '';
                              previousInput = '';
                              secondlastoperatorindex = 0;
                              lastOperatorIndex = 0;
                              lastOperand = '';
                              operand = false;
                              operator = false;
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: '+/-',
                            txtColor: Colors.white,
                            commonColor:
                                mode == 'Dark' ? Colors.orange : Colors.teal,
                            onPress: () {
                              String tempuserinput;
                              String plusminusfunction;
                              if (userInput.length == 1 && userInput == "0") {
                                showtoast(
                                    "You have not entered any number yet!");
                              } else {
                                if (operand) {
                                  if (secondlastoperatorindex != 0) {
                                    tempuserinput = userInput.substring(
                                        0, secondlastoperatorindex + 1);
                                    plusminusfunction = userInput.substring(
                                        secondlastoperatorindex + 1,
                                        lastOperatorIndex + 1);
                                    lastOperand = '(-$lastOperand)';
                                    plusminusfunction += lastOperand;
                                    lastOperand = plusminus(plusminusfunction);
                                    userInput = tempuserinput + lastOperand;
                                  } else {
                                    tempuserinput = '';
                                    plusminusfunction = '';
                                    lastOperand = '-$lastOperand';
                                    if (lastOperatorIndex == 0) {
                                      userInput += lastOperand;
                                      userInput = plusminus(userInput);
                                    } else {
                                      userInput = userInput.substring(
                                          0, lastOperatorIndex + 1);
                                      userInput += lastOperand;
                                      userInput = plusminus(userInput);
                                    }
                                  }
                                  previousInput = userInput.substring(
                                      0, userInput.length - 1);
                                  for (int i = 0; i < userInput.length; i++) {
                                    if (userInput[i] == '%' ||
                                        userInput[i] == '/' ||
                                        userInput[i] == 'x' ||
                                        userInput[i] == '+' ||
                                        userInput[i] == '-') {
                                      secondlastoperatorindex =
                                          lastOperatorIndex;
                                      lastOperatorIndex = i;
                                      lastOperand = '';
                                      currentvalue = userInput[i];
                                      operator = true;
                                      operand = false;
                                    } else {
                                      operand = true;
                                      operator = false;
                                      currentvalue = userInput[i];
                                      lastOperand += userInput[i];
                                    }
                                  }
                                  equalpress();
                                  setState(() {});
                                } else {
                                  showtoast(
                                      "Function cannot be perform on operator!");
                                }
                              }
                              // print('Current Value = $currentvalue');
                              // print('Previous Input = $previousInput');
                              // print('Last Operator Index = $lastOperatorIndex');
                              // print('Second Last Operator Index = $secondlastoperatorindex');
                              // print('Last Operand = $lastOperand');
                              // print('Operand = $operand');
                              // print('Operator $operator');
                            },
                          ),
                          CalculatorButtons(
                            title: '%',
                            txtColor: Colors.white,
                            commonColor:
                                mode == 'Dark' ? Colors.orange : Colors.teal,
                            onPress: () {
                              oneachoperator('%');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: "/",
                            txtColor: Colors.white,
                            commonColor:
                                mode == "Dark" ? Colors.orange : Colors.teal,
                            onPress: () {
                              oneachoperator('/');
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalculatorButtons(
                            title: '7',
                            txtColor:
                                mode == "Dark" ? Colors.white : Colors.black,
                            onPress: () {
                              oneachpress('7');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: '8',
                            txtColor:
                                mode == "Dark" ? Colors.white : Colors.black,
                            onPress: () {
                              oneachpress('8');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: '9',
                            txtColor:
                                mode == "Dark" ? Colors.white : Colors.black,
                            onPress: () {
                              oneachpress('9');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: "x",
                            txtColor: Colors.white,
                            commonColor:
                                mode == "Dark" ? Colors.orange : Colors.teal,
                            onPress: () {
                              oneachoperator('x');
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalculatorButtons(
                            title: '4',
                            txtColor:
                                mode == "Dark" ? Colors.white : Colors.black,
                            onPress: () {
                              oneachpress('4');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: '5',
                            txtColor:
                                mode == "Dark" ? Colors.white : Colors.black,
                            onPress: () {
                              oneachpress('5');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: '6',
                            txtColor:
                                mode == "Dark" ? Colors.white : Colors.black,
                            onPress: () {
                              oneachpress('6');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: "-",
                            txtColor: Colors.white,
                            commonColor:
                                mode == "Dark" ? Colors.orange : Colors.teal,
                            onPress: () {
                              oneachoperator('-');
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalculatorButtons(
                            title: '1',
                            txtColor:
                                mode == "Dark" ? Colors.white : Colors.black,
                            onPress: () {
                              oneachpress('1');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: '2',
                            txtColor:
                                mode == "Dark" ? Colors.white : Colors.black,
                            onPress: () {
                              oneachpress('2');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: '3',
                            txtColor:
                                mode == "Dark" ? Colors.white : Colors.black,
                            onPress: () {
                              oneachpress('3');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: "+",
                            txtColor: Colors.white,
                            commonColor:
                                mode == "Dark" ? Colors.orange : Colors.teal,
                            onPress: () {
                              oneachoperator('+');
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalculatorButtons(
                            title: '0',
                            txtColor:
                                mode == "Dark" ? Colors.white : Colors.black,
                            onPress: () {
                              oneachpress('0');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                            title: '.',
                            txtColor:
                                mode == "Dark" ? Colors.white : Colors.black,
                            onPress: () {
                              oneachpress('.');
                              setState(() {});
                            },
                          ),
                          CalculatorButtons(
                              title: 'DEL',
                              commonColor: Colors.redAccent,
                              txtColor: Colors.white,
                              onPress: () {
                                if (userInput.length == 1) {
                                  userInput = '0';
                                  result = '';
                                  currentvalue = '';
                                  previousInput = '';
                                  secondlastoperatorindex = 0;
                                  lastOperatorIndex = 0;
                                  lastOperand = '';
                                  operand = false;
                                  operator = false;
                                  setState(() {});
                                } else {
                                  userInput = userInput.substring(
                                      0, userInput.length - 1);
                                  lastOperand = '';
                                  if (userInput.length == 1) {
                                    currentvalue = userInput.substring(
                                        userInput.length - 1,
                                        userInput.length - 1);
                                    previousInput = userInput.substring(
                                        0, userInput.length);
                                  } else {
                                    currentvalue =
                                        userInput[userInput.length - 1];
                                    previousInput = userInput.substring(
                                        0, userInput.length - 1);
                                    if (userInput[
                                                userInput.length - 1] ==
                                            '%' ||
                                        userInput[
                                                userInput.length - 1] ==
                                            '/' ||
                                        userInput[
                                                userInput.length - 1] ==
                                            'x' ||
                                        userInput[userInput.length - 1] ==
                                            '-' ||
                                        userInput[userInput.length - 1] ==
                                            '+') {
                                      operand = false;
                                      operator = true;
                                    } else {
                                      operand = true;
                                      operator = false;
                                    }
                                  }
                                  previousInput = userInput.substring(
                                      0, userInput.length - 1);
                                  for (int i = 0; i < userInput.length; i++) {
                                    currentvalue = userInput[i];
                                    if (userInput[i] == '%' ||
                                        userInput[i] == '/' ||
                                        userInput[i] == 'x' ||
                                        userInput[i] == '+' ||
                                        userInput[i] == '-') {
                                      operator = true;
                                      operand = false;
                                      secondlastoperatorindex =
                                          lastOperatorIndex;
                                      lastOperatorIndex = i;
                                      lastOperand = '';
                                    } else {
                                      operator = false;
                                      operand = true;
                                      lastOperand += userInput[i];
                                    }
                                  }
                                  // print('Current Value = $currentvalue');
                                  // print('Previous Input = $previousInput');
                                  // print('Last Operator Index = $lastOperatorIndex');
                                  // print('Last Operand = $lastOperand');
                                  // print('Operand = $operand');
                                  // print('Operator $operator');
                                  equalpress();
                                  setState(() {});
                                }
                              }),
                          CalculatorButtons(
                            title: "=",
                            txtColor: Colors.white,
                            commonColor: mode == "Dark"
                                ? Colors.green
                                : Colors.greenAccent,
                            onPress: () {
                              equalpress();
                              bool longValue = false;
                              for (int i = 0; i < result.length; i++) {
                                if (result[i] == 'e') {
                                  longValue = true;
                                  break;
                                }
                              }
                              if (longValue) {
                                userInput = result;
                              } else {
                                List<String> calculated = result.split(".");
                                String lastFourDigit = calculated[1];
                                userInput = '${calculated[0]}.';
                                for (int i = 0; i < lastFourDigit.length; i++) {
                                  userInput += lastFourDigit[i];
                                  if (i == 3) {
                                    break;
                                  }
                                }
                              }
                              result = '';
                              previousInput = userInput.substring(0, userInput.length - 1);
                              secondlastoperatorindex = 0;
                              lastOperatorIndex = 0;
                              for (int i = 0; i < userInput.length; i++) {
                                currentvalue = userInput[i];
                                if (userInput[i] == '%' ||
                                    userInput[i] == '/' ||
                                    userInput[i] == 'x' ||
                                    userInput[i] == '+' ||
                                    userInput[i] == '-') {
                                  operator = true;
                                  operand = false;
                                  secondlastoperatorindex = lastOperatorIndex;
                                  lastOperatorIndex = i;
                                  lastOperand = '';
                                } else {
                                  operator = false;
                                  operand = true;
                                  lastOperand += userInput[i];
                                }
                              }
                              setState(() {});
                              // print('Current Value = $currentvalue');
                              // print('Previous Input = $previousInput');
                              // print('Second last Operator Index = $secondlastoperatorindex');
                              // print('Last Operator Index = $lastOperatorIndex');
                              // print('Last Operand = $lastOperand');
                              // print('Operand = $operand');
                              // print('Operator $operator');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void oneachpress(String ch) {
    if (userInput.length == 1 && userInput == "0") {
      currentvalue = ch;
      lastOperand += ch;
      previousInput = userInput;
      userInput = currentvalue;
      operand = true;
      operator = false;
    } else {
      currentvalue = ch;
      lastOperand += ch;
      previousInput = userInput;
      userInput += currentvalue;
      operand = true;
      operator = false;
    }
    equalpress();
  }

  void oneachoperator(String ch) {
    if (operand) {
      currentvalue = ch;
      lastOperand = '';
      previousInput = userInput;
      userInput += currentvalue;
      operator = true;
      operand = false;
      secondlastoperatorindex = lastOperatorIndex;
      lastOperatorIndex = userInput.length - 1;
    } else {
      currentvalue = ch;
      lastOperand = '';
      userInput = previousInput;
      userInput += currentvalue;
      operator = true;
      operand = false;
      lastOperatorIndex = userInput.length - 1;
    }
  }

  equalpress() {
    if (userInput[0] == '%' || userInput[0] == '/' || userInput[0] == 'x') {
      result = 'Error';
    } else {
      if (userInput.isNotEmpty && operand) {
        final finaluserinput = userInput.replaceAll('x', '*');
        final encapsulated = '($finaluserinput)';
        Parser p = Parser();
        Expression exp = p.parse(encapsulated);
        ContextModel context = ContextModel();
        double value = exp.evaluate(EvaluationType.REAL, context);
        result = value.toString();
      } else {
        String finaluserinput = previousInput.replaceAll('x', '*');
        finaluserinput = '($finaluserinput)';
        Parser p = Parser();
        Expression exp = p.parse(finaluserinput);
        ContextModel context = ContextModel();
        double value = exp.evaluate(EvaluationType.REAL, context);
        result = value.toString();
      }
    }
  }

  void showtoast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: mode == "Dark" ? Colors.white : Colors.grey.shade800,
        textColor: mode == "Dark" ? Colors.black : Colors.white,
        fontSize: 16.0);
  }

  String plusminus(String ch) {
    String nondecimal = '';
    List<String> decimalpoint;
    String finaluserinput = ch.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel context = ContextModel();
    double value = exp.evaluate(EvaluationType.REAL, context);
    nondecimal = value.toString();
    decimalpoint = nondecimal.split('.');
    return decimalpoint[0];
  }
}
