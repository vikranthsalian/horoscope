import 'package:adithya_horoscope/core/config/loader_config.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/utils/google.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: _isSigningIn
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                // setState(() {
                //   _isSigningIn = true;
                // });

                MetaProgressHUD.showLoading(text: "logging_you_in.......");
                await Google().signOut();
                await Google().signIn();
                MetaProgressHUD.dismiss();
                //
                // setState(() {
                //   _isSigningIn = false;
                // });
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/google_logo.png"),
                      height: 35.0,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: MetaTextView(
                          text: 'sign_in_with_google',
                          textStyle: MetaStyle(
                              fontSize: 12,
                              fontColor: MetaColors.color3F3F3F,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}
