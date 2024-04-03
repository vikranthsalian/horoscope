import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/components/painter/triangle.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NorthKundliWidget extends StatelessWidget {
  NorthKundliModel kundli;

  NorthKundliWidget({required this.kundli});

  double boxw = 70.w;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.4,
      child: Container(
        child: Transform.rotate(
          angle: 150,
          child: MetaColumnView(
            children: [
              MetaRowView(
                children: [
                  Container(
                    child: Stack(alignment: Alignment.center, children: [
                      flipTriangle(true, false),
                      Transform.translate(
                        offset: Offset(boxw / 5, boxw / 5),
                        child: getTextView(kundli.id2!.join(",")),
                      )
                    ]),
                  ),
                  Container(
                    child: Stack(alignment: Alignment.center, children: [
                      flipTriangle(false, false),
                      Transform.translate(
                        offset: Offset(-boxw / 5, boxw / 5),
                        child: getTextView(kundli.id1!.join(",")),
                      )
                    ]),
                  )
                ],
              ),
              Container(
                //    margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: getGDData(),
              ),
              MetaRowView(
                children: [
                  Container(
                    child: Stack(alignment: Alignment.center, children: [
                      flipTriangle(true, true),
                      Transform.translate(
                        offset: Offset(boxw / 5, -boxw / 5),
                        child: getTextView(kundli.id7!.join(",")),
                      )
                    ]),
                  ),
                  Container(
                    child: Stack(alignment: Alignment.center, children: [
                      flipTriangle(false, true),
                      Transform.translate(
                        offset: Offset(-boxw / 5, -boxw / 5),
                        child: getTextView(kundli.id8!.join(",")),
                      )
                    ]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getTextView(text) {
    return Transform.rotate(
        angle: -150,
        child: MetaTextView(
            text: text,
            textStyle: MetaStyle(
                fontSize: 9,
                fontColor: MetaColors().primaryColor,
                fontWeight: FontWeight.w100)));
  }

  flipTriangle(bool X, bool Y) {
    return Transform.flip(
      flipX: X,
      flipY: Y,
      child: CustomPaint(
        size: Size(boxw, boxw), // You can adjust the size as needed
        painter: TrianglePainter(),
      ),
    );
  }

  getGDData() {
    return MetaRowView(children: [
      MetaColumnView(
        children: [
          Container(
            child: Stack(alignment: Alignment.center, children: [
              flipTriangle(true, false),
              Transform.translate(
                offset: Offset(boxw / 5, boxw / 5),
                child: getTextView(kundli.id4!.join(",")),
              )
            ]),
          ),
          Container(
            child: Stack(alignment: Alignment.center, children: [
              flipTriangle(true, true),
              Transform.translate(
                offset: Offset(boxw / 5, -boxw / 5),
                child: getTextView(kundli.id5!.join(",")),
              )
            ]),
          )
        ],
      ),
      Container(
          child: MetaColumnView(children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: boxw,
              height: boxw,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5)),
            ),
            Transform.rotate(
              angle: 0,
              child: getTextView(kundli.id3!.join(",")),
            )
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: boxw,
              height: boxw,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5)),
            ),
            Transform.rotate(
              angle: 0,
              child: getTextView(kundli.id6!.join(",")),
            )
          ],
        ),
      ])),
      Container(
        child: MetaColumnView(children: [
          Stack(alignment: Alignment.center, children: [
            Container(
              width: boxw,
              height: boxw,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5)),
            ),
            Transform.rotate(
              angle: 0,
              child: getTextView(kundli.id12!.join(",")),
            )
          ]),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: boxw,
                height: boxw,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5)),
              ),
              Transform.rotate(
                angle: 0,
                child: getTextView(kundli.id9!.join(",")),
              )
            ],
          ),
        ]),
      ),
      MetaColumnView(
        children: [
          Container(
            child: Stack(alignment: Alignment.center, children: [
              flipTriangle(false, false),
              Transform.translate(
                offset: Offset(-boxw / 5, boxw / 5),
                child: getTextView(kundli.id11!.join(",")),
              )
            ]),
          ),
          Container(
            child: Stack(alignment: Alignment.center, children: [
              flipTriangle(false, true),
              Transform.translate(
                offset: Offset(-boxw / 5, -boxw / 5),
                child: getTextView(kundli.id10!.join(",")),
              )
            ]),
          )
        ],
      ),
    ]);
  }
}

class NorthKundliModel {
  List<String>? id1;
  List<String>? id2;
  List<String>? id3;
  List<String>? id4;
  List<String>? id5;
  List<String>? id6;
  List<String>? id7;
  List<String>? id8;
  List<String>? id9;
  List<String>? id10;
  List<String>? id11;
  List<String>? id12;

  NorthKundliModel(
      {required this.id1,
      required this.id2,
      required this.id3,
      required this.id4,
      required this.id5,
      required this.id6,
      required this.id7,
      required this.id8,
      required this.id9,
      required this.id10,
      required this.id11,
      required this.id12});
}
