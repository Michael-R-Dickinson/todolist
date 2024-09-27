import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

final config = {
  "radius": 30.0,
  "lineWidth": 6.0,
};

class ProgressCircle extends StatelessWidget {
  final double percent;
  const ProgressCircle({super.key, percentage, required this.percent});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: config['radius'] ?? 30,
      lineWidth: config['lineWidth'] ?? 5.0,
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

class CompletionCheckbox extends StatelessWidget {
  const CompletionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    // Uses circle percent indicator to keep the styling from ProgressCircle
    // But never has text and is always a full circle
    return CircularPercentIndicator(
      radius: config['radius'] ?? 30,
      lineWidth: config['lineWidth'] ?? 5.0,
      percent: 1,
      progressColor: Colors.orange,
      backgroundColor: Colors.grey.shade300,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
