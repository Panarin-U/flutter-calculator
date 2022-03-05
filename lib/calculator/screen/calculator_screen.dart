import 'package:calculator/calculator/bloc/bloc.dart';
import 'package:calculator/calculator/bloc/event.dart';
import 'package:calculator/calculator/bloc/state.dart';
import 'package:calculator/calculator/widget/Keyboard.dart';
import 'package:calculator/calculator/widget/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';



class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  _onPressed(String command) {
    setState(() {
      context.read<CalculatorBloc>().add(CalculatorEvent(command: command));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: <Widget>[
          BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (__, state) {
                return Display(state.value);
              }
          ),
          Keyboard(_onPressed),
        ],
      ),
    );
  }
}
