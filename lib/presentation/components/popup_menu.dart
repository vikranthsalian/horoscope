import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';

class PopUpMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 50,
      // color: Theme.of(context).colorScheme.button,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        width: 162,
        height: 49,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            //  color: Theme.of(context).colorScheme.button,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  MetaTextView(
                    text: "Take a Picture",
                    textStyle: MetaStyle(
                        fontSize: 12,
                        fontColor: MetaColors().primaryColor,
                        fontWeight: FontWeight.w100),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: MetaTextView(
                      text: "Take a Picture",
                      textStyle: MetaStyle(
                          fontSize: 12,
                          fontColor: MetaColors().primaryColor,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                ],
              ),
            )),
        PopupMenuItem(
            value: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: MetaTextView(
                      text: "Take a Picture",
                      textStyle: MetaStyle(
                          fontSize: 12,
                          fontColor: MetaColors().primaryColor,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                ],
              ),
            )),
        PopupMenuItem(
            value: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: MetaTextView(
                        text: "Take a Picture",
                        textStyle: MetaStyle(
                            fontSize: 12,
                            fontColor: MetaColors().primaryColor,
                            fontWeight: FontWeight.w100),
                      )),
                ],
              ),
            )),
        PopupMenuItem(
            value: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: MetaTextView(
                        text: "Record a Video",
                        textStyle: MetaStyle(
                            fontSize: 12,
                            fontColor: MetaColors().primaryColor,
                            fontWeight: FontWeight.w100),
                      )),
                ],
              ),
            ))
      ],
    );
  }
}
