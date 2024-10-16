import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todolist/widgets/day_buttons.dart';

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
