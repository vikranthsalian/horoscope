import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MetaSwitch extends StatefulWidget {
  Function(bool)? onCheckPressed;
  bool? value;

  MetaSwitch({
    this.onCheckPressed,
    this.value = false,
  });

  @override
  State<StatefulWidget> createState() => _MetaSwitchState();
}

class _MetaSwitchState extends State<MetaSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Switch.adaptive(
            value: widget.value!,
            activeColor: MetaColors().primaryColor,
            onChanged: (bool? newValue) {
              setState(() {
                widget.value = newValue;
              });
              widget.onCheckPressed!(newValue!);
            }));
  }
}
