import 'package:adithya_horoscope/presentation/components/non_exp.dart';
import 'package:flutter/material.dart';

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandedEqually() => map((w) {
        if (w is NonExpWidget) {
          return w;
        }
        return Expanded(
          flex: 1,
          child: w,
        );
      });
}
