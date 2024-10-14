import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/utils.dart';

class DefaultInputWrapper extends StatelessWidget {
  final Widget child;
  final bool disableDefaultPadding;
  const DefaultInputWrapper({
    super.key,
    required this.child,
    this.disableDefaultPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: !disableDefaultPadding ? defaultInputPadding : null,
      decoration: BoxDecoration(
        borderRadius: taskBorderRadius,
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.1,
        ),
        boxShadow: [makeDefaultBoxShadow(Colors.black)],
      ),
      child: child,
    );
  }
}
