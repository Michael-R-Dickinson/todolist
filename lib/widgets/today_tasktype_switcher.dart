import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';

class TodayTasktypeSwitcher extends StatelessWidget {
  const TodayTasktypeSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: primaryColors['blue'],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Locational',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: primaryColors['blue'],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Locational',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
