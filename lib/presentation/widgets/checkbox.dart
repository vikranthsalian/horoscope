import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MetaCheckBox extends StatefulWidget {
  Function(bool) onCheckPressed;
  bool? value;

  MetaCheckBox({
    required this.onCheckPressed,
    this.value = false,
  });

  @override
  State<StatefulWidget> createState() => _MetaCheckBoxState();
}

class _MetaCheckBoxState extends State<MetaCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Checkbox(
            value: widget.value!,
            activeColor: MetaColors().primaryColor,
            onChanged: (bool? newValue) {
              setState(() {
                widget.value = newValue;
              });
              widget.onCheckPressed(newValue!);
            }));
  }
}
