import 'package:flutter/material.dart';

class DayButtons extends StatelessWidget {
  const DayButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DayButton(
          label: "Today",
          iconColor: Colors.green,
          icon: Icons.calendar_today_outlined,
        ),
        DayButton(
          label: "Later This Week",
          iconColor: Colors.purple,
          icon: Icons.next_week_outlined,
        ),
        DayButton(
          label: "Tomorrow",
          iconColor: Colors.amber,
          icon: Icons.wb_sunny_outlined,
        ),
        DayButton(
          label: "This Weekend",
          iconColor: Colors.blue,
          icon: Icons.weekend_outlined,
        ),
      ],
    );
  }
}

class DayButton extends StatelessWidget {
  final String label;
  final Color iconColor;
  final IconData icon;

  const DayButton({
    super.key,
    required this.label,
    required this.iconColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    const dayButtonStyle =
        TextStyle(fontWeight: FontWeight.w500, color: Colors.black);

    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: () {},
        label: Text(label, style: dayButtonStyle),
        icon: Icon(color: iconColor, icon),
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          overlayColor: Colors.black.withOpacity(0.1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
