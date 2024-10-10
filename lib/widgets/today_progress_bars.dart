import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';

class TodayProgressBars extends StatelessWidget {
  final bool singleBar;
  const TodayProgressBars({super.key, required this.singleBar});

  @override
  Widget build(BuildContext context) {
    final height = singleBar ? 8.0 : 4.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          width: 220,
          child: Container(
            decoration: BoxDecoration(
              color: primaryColors['red'],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        if (!singleBar) ...[
          const SizedBox(height: 2),
          SizedBox(
            height: height,
            width: 330,
            child: Container(
              decoration: BoxDecoration(
                color: primaryColors['blue'],
                // borderRadius: const BorderRadius.only(
                //   topRight: Radius.circular(15),
                //   bottomRight: Radius.circular(15),
                // ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
