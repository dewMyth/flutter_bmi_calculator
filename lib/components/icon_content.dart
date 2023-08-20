import 'package:flutter/material.dart';


class IconContent extends StatelessWidget {
  IconContent({
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    required this.label,
    required this.labelFontSize,
    required this.labelColor,
  });

  // Icon Customization
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  // Label Customization
  final String label;
  final double labelFontSize;
  final Color labelColor;

  // Padding
  final double gap = 15.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
          size: 80.0,
        ),
        SizedBox(
          height: gap,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: labelFontSize,
            color: labelColor,
          ),
        ),
      ],
    );
  }
}
