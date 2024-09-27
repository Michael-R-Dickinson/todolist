import 'package:flutter/material.dart';

class CompleteCheckbox extends StatelessWidget {
  const CompleteCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.lightBlueAccent,
        border: Border.all(
          color: Colors.blue,
          style: BorderStyle.solid,
          width: 3,
        ),
      ),
    );
  }
}
