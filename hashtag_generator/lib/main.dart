import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        sliderTheme: SliderThemeData(
            activeTrackColor: Colors.orange,
            inactiveTrackColor: Colors.orange[100],
            thumbColor: Colors.amber,
            overlayColor: Colors.amber[50],
            inactiveTickMarkColor: Colors.amber[700]),
        brightness: Brightness.light, // status bar brightness
        backgroundColor: Colors.white,
        primaryColor: Colors.amber[600],
        accentColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        sliderTheme: SliderThemeData(
            activeTrackColor: Colors.purple,
            inactiveTrackColor: Colors.purple[100],
            thumbColor: Colors.purpleAccent,
            overlayColor: Colors.purpleAccent[50],
            inactiveTickMarkColor: Colors.purpleAccent[700]),
        brightness: Brightness.dark, // status bar brightness
        backgroundColor: Colors.black,
        primaryColor: Colors.purple[300],
        accentColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
