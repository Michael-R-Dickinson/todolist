import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todolist/theme/colors.dart';
import 'package:todolist/widgets/default_input_wrapper.dart';

class CreateTaskDates extends StatelessWidget {
  const CreateTaskDates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: DateInputBox(
            text: "Due Date",
          ),
        ),
        const SizedBox(width: 16),
        Expanded(child: Container(color: cardElevatedColor))
      ],
    );
  }
}

class DateInputBox extends StatelessWidget {
  final String text;
  const DateInputBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {},
        child: DefaultInputWrapper(
          child: SizedBox(
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                    style: const TextStyle(color: textLight, fontSize: 16)),
                const Icon(Icons.calendar_today_outlined)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
