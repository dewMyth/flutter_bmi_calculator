import 'package:flutter/material.dart';

import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(
                primary: const Color(0xFF0A0E21),  // Color - #0A0E21
                secondary: const Color(0xFFEB1555) // Color - #EB1555
            ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21), // Color - #0A0E21
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}


