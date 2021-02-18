import 'package:flutter/material.dart';
import 'ui/CustomLoginForm.dart';

void main(List<String> args) => runApp(LogIn());

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = "Login";
    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
            // centerTitle: false,
          ),
          backgroundColor: Colors.blueGrey,
          body: CustomLoginForm(),
        ));
  }
}
