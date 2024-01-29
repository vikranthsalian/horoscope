import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareOverlay extends ModalRoute<void> {
  var name, dur, path, isLandscape;
  ShareOverlay(this.name, this.dur, this.path, this.isLandscape);
  List<String> sharePath = [];

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => MetaColors.colorGifpLAy.withOpacity(0.85);

  @override
  String get barrierLabel => "";

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    //name="Ninja Rabbit Funnky Revenge";
    try {
      List<String> stringPref = dur.toString().split('.');
      dur = stringPref[0];
      List<String> stringPref2 = dur.toString().split(':');
      if (int.parse(stringPref2[0]) > 0) {
        dur = stringPref2[0] + " Hr";
        if (int.parse(stringPref2[1]) > 0) {
          dur = stringPref2[0] + "Hr " + stringPref2[1] + " Min";
        }
      } else if (int.parse(stringPref2[1]) > 0) {
        dur = stringPref2[1] + " Min";
        if (int.parse(stringPref2[2]) > 0) {
          dur = stringPref2[1] + "Hr " + stringPref2[2] + " Sec";
        }
      } else {
        dur = stringPref2[2] + " Sec";
      }
    } catch (ex) {}
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    print('Login Button Pressed');
                    Navigator.pop(context);
                  },
                  child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      height: 20,
                      //   margin: EdgeInsets.all(4),
                      width: 20,
                      //   padding: EdgeInsets.all(12.0),
                      child: Container(
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                          image: new AssetImage(
                            "assets/images/close.png",
                          ),
                        )),
                      ))),
            ],
          ),
        ),
        isLandscape
            ? Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 2.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 3.h),
                        child: Text(
                          '$name',
                          style: TextStyle(
                            color: MetaColors.whiteColor,
                            letterSpacing: 2.5,
                            fontSize: 3.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Segoe',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.h, vertical: 2.h),
                        height: 100,
                        child: Row(
                          children: [
//                      Container(
//                        alignment: Alignment.center,
//                        child: Text(
//                          '''Play
//Again''',
//                          textAlign: TextAlign.end,
//                          style: TextStyle(color: Colors.white, fontSize: 50.0),
//                        ),
//                      ),
                            Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new AssetImage(
                                  "assets/images/play.png",
                                ),
                              )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.8.h),
                        padding: EdgeInsets.symmetric(vertical: 0.8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  image: new DecorationImage(
                                image: new AssetImage(
                                  "assets/images/duration.png",
                                ),
                              )),
                            ),
                            Container(
                              child: Text('$dur',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: MetaColors.whiteColor,
                                    letterSpacing: 2.5,
                                    fontSize: 2.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Segoe',
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              //  _onShareFiles(context);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              width: 90,
                              padding: EdgeInsets.symmetric(vertical: 0.8.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.6.h),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                        "assets/images/share2.png",
                                      ),
                                    )),
                                  ),
                                  Container(
                                    width: 40,
                                    child: Text('Share',
                                        style: TextStyle(
                                          color: MetaColors.blackColor,
                                          letterSpacing: 1.5,
                                          fontSize: 1.2.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Segoe',
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //        _onFind(path);
                            },
                            child: Container(
                              width: 90,
                              padding: EdgeInsets.symmetric(vertical: 0.8.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.6.h),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                        "assets/images/find.png",
                                      ),
                                    )),
                                  ),
                                  Container(
                                    width: 40,
                                    child: Text('Find',
                                        style: TextStyle(
                                          color: MetaColors.blackColor,
                                          letterSpacing: 1.5,
                                          fontSize: 1.2.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Segoe',
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            //     _onShare(context);
                          },
                          child: Container(
                            width: 150,
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(3.6.h),
                                topLeft: Radius.circular(3.6.h),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      image: new DecorationImage(
                                    image: new AssetImage(
                                      "assets/images/logo.png",
                                    ),
                                  )),
                                ),
                                Container(
                                  child: Text('Share App',
                                      style: TextStyle(
                                        color: MetaColors.blackColor,
                                        letterSpacing: 1.5,
                                        fontSize: 2.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Segoe',
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 3.h),
                            child: Text(
                              '$name',
                              style: TextStyle(
                                color: MetaColors.whiteColor,
                                letterSpacing: 2.5,
                                fontSize: 3.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Segoe',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 2.h, vertical: 2.h),
                            height: 100,
                            child: Row(
                              children: [
//                      Container(
//                        alignment: Alignment.center,
//                        child: Text(
//                          '''Play
//Again''',
//                          textAlign: TextAlign.end,
//                          style: TextStyle(color: Colors.white, fontSize: 50.0),
//                        ),
//                      ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: new AssetImage(
                                      "assets/images/play.png",
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 1.8.h),
                            padding: EdgeInsets.symmetric(vertical: 0.8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 20,
                                  height: 20,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      image: new DecorationImage(
                                    image: new AssetImage(
                                      "assets/images/duration.png",
                                    ),
                                  )),
                                ),
                                Container(
                                  child: Text('$dur',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: MetaColors.whiteColor,
                                        letterSpacing: 2.5,
                                        fontSize: 2.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Segoe',
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              //   _onShareFiles(context);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              width: 90,
                              padding: EdgeInsets.symmetric(vertical: 0.8.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.6.h),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                        "assets/images/share2.png",
                                      ),
                                    )),
                                  ),
                                  Container(
                                    width: 40,
                                    child: Text('Share',
                                        style: TextStyle(
                                          color: MetaColors.blackColor,
                                          letterSpacing: 1.5,
                                          fontSize: 1.2.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Segoe',
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //     _onFind(path);
                            },
                            child: Container(
                              width: 90,
                              padding: EdgeInsets.symmetric(vertical: 0.8.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.6.h),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                        "assets/images/find.png",
                                      ),
                                    )),
                                  ),
                                  Container(
                                    width: 40,
                                    child: Text('Find',
                                        style: TextStyle(
                                          color: MetaColors.blackColor,
                                          letterSpacing: 1.5,
                                          fontSize: 1.2.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Segoe',
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                //   _onShare(context);
                              },
                              child: Container(
                                width: 150,
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(3.6.h),
                                    topLeft: Radius.circular(3.6.h),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          image: new DecorationImage(
                                        image: new AssetImage(
                                          "assets/images/logo.png",
                                        ),
                                      )),
                                    ),
                                    Container(
                                      child: Text('Share App',
                                          style: TextStyle(
                                            color: MetaColors.blackColor,
                                            letterSpacing: 1.5,
                                            fontSize: 2.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Segoe',
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
      ],
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }

  // _onShare(BuildContext context) async {
  //   final RenderBox box = context.findRenderObject();
  //   await Share.share("Test Phase Alpha Hey check out my app at: https://play.google.com/",
  //       subject: "Hey check out my app at: https://play.google.com/",
  //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  // }
  //
  // _onShareFiles(BuildContext context) async {
  //   final RenderBox box = context.findRenderObject();
  //
  //   sharePath.add(path);
  //
  //   await Share.shareFiles(sharePath,
  //       text: "",
  //       subject: "Hey check out my app at: https://play.google.com/",
  //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  // }
  //
  // _onFind(String path)  {
  //   OpenFile.open(path);
  // }
}
