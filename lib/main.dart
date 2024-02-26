import 'package:flutter/material.dart';
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
        visualDensity: VisualDensity.adaptivePlatformDensity, 
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.amber[600], secondary: Colors.black, background: Colors.white, brightness: Brightness.light ),
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        sliderTheme: SliderThemeData(
            activeTrackColor: Colors.purple,
            inactiveTrackColor: Colors.purple[100],
            thumbColor: Colors.purpleAccent,
            overlayColor: Colors.purpleAccent[50],
            inactiveTickMarkColor: Colors.purpleAccent[700]),
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.purple[300], secondary: Colors.white, background: Colors.black, brightness: Brightness.dark),
      ),
      home: HomePage(),
    );
  }
}
