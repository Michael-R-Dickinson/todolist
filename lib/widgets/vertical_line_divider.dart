import 'package:flutter/material.dart';

class VerticalLineDivider extends StatelessWidget {
  const VerticalLineDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.black45, width: 10),
      ),
      width: 1.3,
      height: 12,
    );
  }
}
