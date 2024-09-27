import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCircle extends StatelessWidget {
  final double percent;
  const ProgressCircle({super.key, percentage, required this.percent});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 30.0,
      lineWidth: 6.0,
      percent: percent,
      center: Text(
        "${(percent * 100).round()}%",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      progressColor: Colors.orange,
      backgroundColor: Colors.grey.shade300,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
