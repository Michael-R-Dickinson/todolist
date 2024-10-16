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
    return DateSelectorPopup(
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
    );
  }
}

class DateSelectorPopup extends HookWidget {
  final Widget child;
  const DateSelectorPopup({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final GlobalKey widgetKey = useMemoized(() => GlobalKey());

    void showPopup() {
      final RenderBox renderBox =
          widgetKey.currentContext?.findRenderObject() as RenderBox;
      final Size widgetSize = renderBox.size;
      final Offset widgetPosition = renderBox.localToGlobal(Offset.zero);

      const estOverlayWidth = 250;

      OverlayEntry? entry;
      entry = OverlayEntry(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => entry?.remove(),
          child: Stack(
            children: [
              Positioned(
                top: widgetPosition.dy + widgetSize.height,
                left: widgetPosition.dx -
                    estOverlayWidth / 2 +
                    widgetSize.width / 2,
                child: GestureDetector(
                  child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: Theme.of(context).dividerColor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const DayButtons()),
                ),
              ),
            ],
          ),
        ),
      );

      Overlay.of(context).insert(entry);
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Center(
        child: GestureDetector(
          key: widgetKey,
          onTap: () => showPopup(),
          child: child,
        ),
      ),
    );
  }
}

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
