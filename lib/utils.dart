import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatReadableDate(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final int todayWeekday = today.weekday; // 1 (Mon) - 7 (Sun)

  final tomorrow = today.add(const Duration(days: 1));

  // Start of this week (Monday)
  final thisWeekStart = today.subtract(Duration(days: todayWeekday - 1));
  // End of this week (Sunday)
  final thisWeekEnd = thisWeekStart.add(const Duration(days: 6));

  // Start and end of next week
  final nextWeekStart = thisWeekStart.add(const Duration(days: 7));
  final nextWeekEnd = nextWeekStart.add(const Duration(days: 6));

  final dueDateDateOnly = DateTime(date.year, date.month, date.day);

  String dateString;

  if (dueDateDateOnly.isBefore(tomorrow)) {
    dateString = 'Today';
  } else if (!dueDateDateOnly.isBefore(thisWeekStart) &&
      !dueDateDateOnly.isAfter(thisWeekEnd)) {
    // Within this week
    dateString = DateFormat('EEE').format(date); // 'Tue', 'Wed', etc.
  } else if (!dueDateDateOnly.isBefore(nextWeekStart) &&
      !dueDateDateOnly.isAfter(nextWeekEnd)) {
    // Within next week
    dateString = 'Next ${DateFormat('EEE').format(date)}';
  } else if (date.year == now.year) {
    // Within this year but not within the next couple of weeks
    dateString = DateFormat('MMM d').format(date); // 'Sep 21', etc.
  } else {
    // Beyond this year
    dateString = DateFormat('yyyy-MM-dd').format(date);
  }

  return dateString;
}

class DetailedUnderlinedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double underlineOffset;
  final double underlineThickness;
  final Color? underlineColor;

  const DetailedUnderlinedText({
    required this.text,
    super.key,
    this.style,
    this.underlineColor,
    this.underlineOffset = 1,
    this.underlineThickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, underlineOffset),
      child: Text(
        text,
        style: style?.copyWith(
          shadows: [
            Shadow(
              color: style?.color ?? Colors.black,
              offset: Offset(0, -underlineOffset),
            ),
          ],
          color: Colors.transparent,
          decoration: TextDecoration.underline,
          decorationThickness: underlineThickness,
          decorationColor: Colors.green,
        ),
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToLastDescent: false,
        ),
      ),
    );
  }
}
