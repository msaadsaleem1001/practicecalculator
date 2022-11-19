import 'package:calculator/commonbtn.dart';
import 'package:calculator/pop_menu.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var result = '';
  String mode = "Dark";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:mode=="Dark"?Colors.black:Colors.white,
        appBar: AppBar(
      leading: const Icon(Icons.calculate_rounded),
      backgroundColor:mode=="Dark"?Colors.black:Colors.blue,
      actions: [
        PopupMenuButton(
          offset:  const Offset(-15, 60),
          shape: const TooltipShape(),
          onSelected: (value){
            if(value == 0){
              mode = "Dark";
              setState(() {

              });
            }
            else{
              mode = "Light";
              setState(() {

              });
            }
          },
          color:mode=="Dark"?Colors.grey.shade900:Colors.white,
          child:const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.more_vert),
          ),
            itemBuilder: (context){
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Dark mode", style: TextStyle(color:mode=="Dark"?Colors.white:Colors.black,),),
                ),

                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Light mode", style: TextStyle(color:mode=="Dark"?Colors.white:Colors.black),),
                ),
              ];
            }

        ),

      ],
      title: const Center(child: Text("Calculator", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),),),
        ),
        body: SafeArea(
          child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            userInput.toString(),
                            style:
                                TextStyle(fontSize: 30, color:mode=="Dark"?Colors.white:Colors.black),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            result.toString(),
                            style:
                                TextStyle(fontSize: 30, color:mode=="Dark"?Colors.white:Colors.black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput = '';
                          result = '';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: '+/-',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          // print("tap");
                        },
                      ),
                      CalculatorButtons(
                        title: '%',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += '%';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: "/",
                        txtColor: Colors.white,
                        commonColor:mode=="Dark"?Colors.orange:Colors.blue,
                        onPress: () {
                          userInput += '/';
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButtons(
                        title: '7',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += "7";
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: '8',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += '8';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: '9',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += '9';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: "x",
                        txtColor: Colors.white,
                        commonColor:mode=="Dark"?Colors.orange:Colors.blue,
                        onPress: () {
                          userInput += 'x';
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButtons(
                        title: '4',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += '4';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: '5',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += '5';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: '6',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += '6';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: "-",
                        txtColor: Colors.white,
                        commonColor:mode=="Dark"?Colors.orange:Colors.blue,
                        onPress: () {
                          userInput += '-';
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButtons(
                        title: '1',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += '1';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: '2',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += '2';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: '3',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += '3';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: "+",
                        txtColor: Colors.white,
                        commonColor:mode=="Dark"?Colors.orange:Colors.blue,
                        onPress: () {
                          userInput += '+';
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButtons(
                        title: '0',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += '0';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: '.',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput += '.';
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: 'Del',
                        txtColor: mode=="Dark"?Colors.white:Colors.black,
                        onPress: () {
                          userInput = userInput.substring(0, userInput.length - 1);
                          setState(() {

                          });
                        },
                      ),
                      CalculatorButtons(
                        title: "=",
                        txtColor: Colors.white,
                        commonColor:mode=="Dark"?Colors.green:Colors.green,
                        onPress: () {
                          equalpress();
                          setState(() {

                          });

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

  void equalpress(){
    final finaluserinput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel context = ContextModel();
    double value = exp.evaluate(EvaluationType.REAL, context);
    result = value.toString();
  }
}

