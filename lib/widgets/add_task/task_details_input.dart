import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/theme/colors.dart';
import 'package:todolist/widgets/default_input_wrapper.dart';

class TaskDetailsInput extends HookWidget {
  const TaskDetailsInput(
      {super.key, required this.label, required this.onChange});

  final String label;
  final void Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    final formField = useState("");
    final isFocused = useState(false);

    useEffect(() {
      focusNode.addListener(() {
        isFocused.value = focusNode.hasFocus;
      });
      return null;
    }, [focusNode]);

    return DefaultInputWrapper(
      disableDefaultPadding: true,
      child: TextFormField(
        onChanged: (v) {
          formField.value = v;
          onChange(v);
        },
        focusNode: focusNode,
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(fontSize: 0),
          labelText:
              formField.value == "" && isFocused.value == false ? label : null,
          labelStyle: const TextStyle(color: textLight, fontSize: 16),
          contentPadding: defaultInputPadding,
          border: InputBorder.none, // Disable underline
        ),
      ),
    );
  }
}
