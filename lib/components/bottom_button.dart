import 'package:flutter/material.dart';

// Constants
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    required this.buttonText,
    required this.onTap,
  });

  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => ResultsPage()));
      // },
      onTap: () {
        onTap();
      },
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 5.0),
        width: double.infinity,
        height: 60.0,
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}