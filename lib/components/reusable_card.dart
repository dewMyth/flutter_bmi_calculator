import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  ReusableCard({ required this.colour, this.cardChild, this.onPress});

  final Color colour;
  /* required added for colour in constructor above,
      because this was not defined as nullable (no ? after for Color like Widget and Function)
      This is for knowledge only
   */
  final Widget? cardChild;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: colour,
        ),
        margin: const EdgeInsets.all(9.0),
        padding: const EdgeInsets.all(10.0),
        child: cardChild,
      ),
    );
  }
}