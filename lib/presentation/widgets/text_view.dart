import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MetaTextView extends StatelessWidget {
  final String text;
  final int? maxLines;
  final MetaStyle? textStyle;
  final TextAlign? textAlign;
  final Map<String, String>? trString;
  const MetaTextView({
    required this.text,
    this.textStyle,
    this.trString,
    this.maxLines,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    var textWidget = Text(text,
        textAlign: textAlign,
        maxLines: maxLines,
        style: textStyle != null
            ? textStyle!.getStyle()
            : MetaStyle(fontSize: 12.0, fontColor: Colors.black).getStyle());

    if (trString != null) {
      return textWidget.tr(namedArgs: trString);
    }

    return textWidget.tr();
  }
}
