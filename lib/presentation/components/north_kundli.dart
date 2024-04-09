import 'dart:convert';

import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/components/painter/triangle.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/rashi_kundli_screen.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NorthNewKundliWidget extends StatelessWidget {
  Map<String, List<NorthDataClass>> newData;
  NorthKundliModel kundli;
  NorthNewKundliWidget({required this.kundli, required this.newData});
  double boxw = 70.w;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.6,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Container(
          child: Transform.rotate(
            angle: 150,
            child: Container(
              child: MetaColumnView(
                children: [
                  MetaRowView(
                    children: [
                      Container(
                        child: Stack(alignment: Alignment.center, children: [
                          flipTriangle(true, false),
                          Transform.translate(
                            offset: Offset(30.w, -25.w),
                            child: getTextView(
                                kundli.id2!.$1), //splitList(kundli.id2!)
                          ),
                          Container(
                            child: Transform.translate(
                              offset: Offset(11.w, 15.w),
                              child: getTextView(splitList(newData[
                                  (kundli.id2!.$1 - 1)
                                      .toString()])), //splitList(kundli.id2!)
                            ),
                          )
                        ]),
                      ),
                      Container(
                        child: Stack(alignment: Alignment.center, children: [
                          flipTriangle(false, false),
                          Transform.translate(
                            offset: Offset(-30.w, -25.w),
                            child: Container(
                              child:
                                  getTextView(" " + kundli.id1!.$1.toString()),
                            ),
                          ),
                          Container(
                            child: Transform.translate(
                              offset: Offset(-12.w, 12.w),
                              child: getTextView(splitList4(newData[
                                  (kundli.id1!.$1 - 1)
                                      .toString()])), //splitList(kundli.id12!)
                            ),
                          ),
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
                            offset: Offset(30.w, -30.w),
                            child: Container(
                              child: getTextView(kundli.id7!.$1.toString()),
                            ),
                          ),
                          Container(
                            child: Transform.translate(
                              offset: Offset(8.w, -8.w),
                              child: getTextView(splitList5(newData[
                                  (kundli.id7!.$1 - 1)
                                      .toString()])), //splitList(kundli.id5!)
                            ),
                          )
                        ]),
                      ),
                      Container(
                        child: Stack(alignment: Alignment.center, children: [
                          flipTriangle(false, true),
                          Transform.translate(
                            offset: Offset(20.w, -30.w),
                            child: getTextView(" " +
                                kundli.id8!.$1
                                    .toString()), //splitList(kundli.id2!)
                          ),
                          Container(
                            child: Transform.translate(
                              offset: Offset(-15.w, -10.w),
                              child: getTextView(splitList(newData[
                                  (kundli.id8!.$1 - 1)
                                      .toString()])), //splitList(kundli.id2!)
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
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
                offset: Offset(30.w, -25.w),
                child: getTextView(kundli.id4!.$1), //splitList(kundli.id2!)
              ),
              Container(
                child: Transform.translate(
                  offset: Offset(11.w, 15.w),
                  child: getTextView(splitList(newData[(kundli.id4!.$1 - 1)
                      .toString()])), //splitList(kundli.id2!)
                ),
              )
            ]),
          ),
          Container(
            child: Stack(alignment: Alignment.center, children: [
              flipTriangle(true, true),
              Transform.translate(
                offset: Offset(30.w, -30.w),
                child: Container(
                  child: getTextView(kundli.id5!.$1.toString()),
                ),
              ),
              Container(
                child: Transform.translate(
                  offset: Offset(8.w, -8.w),
                  child: getTextView(splitList5(newData[(kundli.id5!.$1 - 1)
                      .toString()])), //splitList(kundli.id5!)
                ),
              )
            ]),
          )
        ],
      ),
      Container(
          color: Colors.white,
          child: MetaColumnView(children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: boxw,
                  height: boxw,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 10,
                        child: getTextView(kundli.id3!.$1.toString() + "  "),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Transform.translate(
                    offset: Offset(-0.w, -0.w),
                    child: getTextView(splitList(newData[(kundli.id3!.$1 - 1)
                        .toString()])), //splitList(kundli.id3!)
                  ),
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
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 10,
                        child: getTextView(kundli.id6!.$1.toString() + "  "),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Transform.translate(
                    offset: Offset(-0.w, -0.w),
                    child: getTextView(splitList(newData[(kundli.id6!.$1 - 1)
                        .toString()])), //splitList(kundli.id6!)
                  ),
                ),
              ],
            ),
          ])),
      Container(
        color: Colors.white,
        child: MetaColumnView(children: [
          Stack(alignment: Alignment.center, children: [
            Container(
              width: boxw,
              height: boxw,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5)),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 10,
                    child: getTextView(kundli.id0!.$1.toString() + "  "),
                  ),
                ],
              ),
            ),
            Container(
              child: Transform.translate(
                offset: Offset(-0.w, -0.w),
                child: getTextView(splitList(newData[
                    (kundli.id0!.$1 - 1).toString()])), //splitList(kundli.id0!)
              ),
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
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 10,
                      child: getTextView(kundli.id9!.$1.toString() + "  "),
                    ),
                  ],
                ),
              ),
              Container(
                child: Transform.translate(
                  offset: Offset(-0.w, -0.w),
                  child: getTextView(splitList(newData[(kundli.id9!.$1 - 1)
                      .toString()])), //splitList(kundli.id9!)
                ),
              ),
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
                offset: Offset(-30.w, -25.w),
                child: Container(
                  child: getTextView(" " + kundli.id11!.$1.toString()),
                ),
              ),
              Container(
                child: Transform.translate(
                  offset: Offset(-12.w, 12.w),
                  child: getTextView(splitList4(newData[(kundli.id11!.$1 - 1)
                      .toString()])), //splitList(kundli.id12!)
                ),
              ),
            ]),
          ),
          Container(
            child: Stack(alignment: Alignment.center, children: [
              flipTriangle(false, true),
              Transform.translate(
                offset: Offset(20.w, -30.w),
                child: getTextView(
                    " " + kundli.id10!.$1.toString()), //splitList(kundli.id2!)
              ),
              Container(
                child: Transform.translate(
                  offset: Offset(-15.w, -10.w),
                  child: getTextView(splitList(newData[(kundli.id10!.$1 - 1)
                      .toString()])), //splitList(kundli.id2!)
                ),
              )
            ]),
          ),
        ],
      ),
    ]);
  }

  splitList4(List<NorthDataClass>? data) {
    // .join(",")
    print("splitList");
    print(jsonEncode(data));
    String text = "";
    if (data == null || data.isEmpty) {
      return text;
    }
    for (var (i, item) in data.indexed) {
      if (i == 0) {
        text = item.key!;
      } else {
        if (i % 4 == 0) {
          text = "$text,\n${item.key}";
        } else {
          text = "$text,${item.key}";
        }
      }
    }
    return text;
  }

  splitList5(List<NorthDataClass>? data) {
    // .join(",")
    print("splitList");
    print(jsonEncode(data));
    String text = "";
    if (data == null || data.isEmpty) {
      return text;
    }
    for (var (i, item) in data.indexed) {
      if (i == 0) {
        text = item.key!;
      } else {
        if (i % 5 == 0) {
          text = "$text,\n${item.key}";
        } else {
          text = "$text,${item.key}";
        }
      }
    }
    return text;
  }

  splitList(List<NorthDataClass>? data) {
    // .join(",")
    print("splitList");
    print(jsonEncode(data));
    String text = "";
    if (data == null || data.isEmpty) {
      return text;
    }
    for (var (i, item) in data.indexed) {
      if (i == 0) {
        text = item.key!;
      } else {
        if (i % 3 == 0) {
          text = "$text,\n${item.key}";
        } else {
          text = "$text,${item.key}";
        }
      }
    }
    return text;
  }

  getTextView(text) {
    return Transform.rotate(
        angle: -150,
        child: MetaTextView(
            text: text.toString(),
            textStyle: MetaStyle(
                fontSize: 8,
                fontColor: MetaColors().primaryColor,
                fontWeight: FontWeight.w100)));
  }

  flipTriangle(bool X, bool Y) {
    return Container(
      child: Transform.flip(
        flipX: X,
        flipY: Y,
        child: CustomPaint(
          size: Size(boxw, boxw), // You can adjust the size as needed
          painter: TrianglePainter(),
        ),
      ),
    );
  }
}

class NorthKundliModel {
  (int, List<String>)? id0;
  (int, List<String>)? id1;
  (int, List<String>)? id2;
  (int, List<String>)? id3;
  (int, List<String>)? id4;
  (int, List<String>)? id5;
  (int, List<String>)? id6;
  (int, List<String>)? id7;
  (int, List<String>)? id8;
  (int, List<String>)? id9;
  (int, List<String>)? id10;
  (int, List<String>)? id11;

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
      required this.id0});
}
