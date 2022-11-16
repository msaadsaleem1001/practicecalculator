import 'package:calculator/commonbtn.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:const[
                                Text("1500+1500", style: TextStyle(fontSize: 30, color: Colors.white),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:const[
                                Text("3000", style: TextStyle(fontSize: 30, color: Colors.white),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Column( children: [
                      Row( children: [
                        CalculatorButtons(title: 'AC', onPress: (){
                          // print("tap");
                        },),
                        CalculatorButtons(title: '+/-', onPress: (){
                          // print("tap");
                        },),
                        CalculatorButtons(title: '%', onPress: (){},),
                        CalculatorButtons(title: "/", commonColor: Colors.orange, onPress: (){},),
                      ],),
                      Row( children: [
                        CalculatorButtons(title: '7', onPress: (){
                          // print("tap");
                        },),
                        CalculatorButtons(title: '8', onPress: (){
                          // print("tap");
                        },),
                        CalculatorButtons(title: '9', onPress: (){},),
                        CalculatorButtons(title: "x", commonColor: Colors.orange, onPress: (){},),
                      ],),
                      Row( children: [
                        CalculatorButtons(title: '4', onPress: (){
                          // print("tap");
                        },),
                        CalculatorButtons(title: '5', onPress: (){
                          // print("tap");
                        },),
                        CalculatorButtons(title: '6', onPress: (){},),
                        CalculatorButtons(title: "-", commonColor: Colors.orange, onPress: (){},),
                      ],),
                      Row( children: [
                        CalculatorButtons(title: '1', onPress: (){
                          // print("tap");
                        },),
                        CalculatorButtons(title: '2', onPress: (){
                          // print("tap");
                        },),
                        CalculatorButtons(title: '3', onPress: (){},),
                        CalculatorButtons(title: "+", commonColor: Colors.orange, onPress: (){},),
                      ],),
                      Row( children: [
                        CalculatorButtons(title: '0', onPress: (){
                          // print("tap");
                        },),
                        CalculatorButtons(title: '.', onPress: (){
                          // print("tap");
                        },),
                        CalculatorButtons(title: 'Del', onPress: (){},),
                        CalculatorButtons(title: "=", commonColor: Colors.orange, onPress: (){},),
                      ],),
                    ],),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}