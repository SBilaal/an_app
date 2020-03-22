import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _themeData;

  void _changeTheme(ThemeData themeData) {
    setState(() {
      _themeData = themeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnApp(_changeTheme),
      theme: _themeData,
    );
  }
}

class AnApp extends StatefulWidget {
  final Function changeTheme;

  AnApp(this.changeTheme);
  @override
  _AnAppState createState() => _AnAppState();
}

class _AnAppState extends State<AnApp> {
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Switch(
            value: isTrue,
            onChanged: (value) {
              setState(() {
                isTrue = value;
                isTrue
                    ? widget.changeTheme(ThemeData.dark())
                    : widget.changeTheme(ThemeData.light());
              });
            },
          ),
        ),
      ),
    );
  }
}
