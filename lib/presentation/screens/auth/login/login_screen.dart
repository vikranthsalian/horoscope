import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/ext/expanded_ext.dart';
import 'package:adithya_horoscope/core/service/common_service.dart';
import 'package:adithya_horoscope/data/cubits/login/login_cubit.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/presentation/components/dialog/common_dialog.dart';
import 'package:adithya_horoscope/presentation/screens/auth/login/login_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/checkbox.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_field.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MetaColors.whiteColor,
        resizeToAvoidBottomInset: true,
        body: Container(
          child: BlocProvider(
            create: (context) => LoginFormBloc(),
            child: Builder(builder: (context) {
              LoginFormBloc formBloc = BlocProvider.of<LoginFormBloc>(context);

              if (kDebugMode) {
                //formBloc.tfUsername.updateValue("episode1982@nate.com");
                // formBloc.tfPassword.updateValue("12345678");
                formBloc.tfUsername
                    .updateValue("vikkysalian@adithya_horoscope.com");
                formBloc.tfPassword.updateValue("Rikimaru@123");
              }

              return FormBlocListener<LoginFormBloc, String, String>(
                  onSubmitting: (context, state) {
                    print("onSubmitting");
                  },
                  onSubmissionFailed: (context, state) {
                    print("Error is.......$state");
                  },
                  onSuccess: (context, state) async {
                    if (formBloc.submitted.value) {
                      UserData? modelResponse = formBloc.dataModel.value;
                      formBloc.clear();
                      context
                          .read<LoginCubit>()
                          .setLoginResponse(modelResponse!);

                      await CommonService().getConfigData({});

                      Navigator.pushReplacementNamed(
                          context, RouteConstants.navPath);
                    } else {
                      String msg = "";
                      if (formBloc.isWithdraw.value) {
                        msg = "adithya_horoscopeAccessRemoved";
                      } else {
                        msg = "emailPasswordDoNotMatch";
                      }
                      showDialog(
                          context: context,
                          builder: (_) => MetaDialogCommonError(
                                label: msg,
                                showYesNo: false,
                                buttonLabel: 'check',
                                onPress: () {
                                  Navigator.pop(context);
                                },
                              ));
                    }
                  },
                  onFailure: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.hasFailureResponse.toString())));
                  },
                  child: SingleChildScrollView(
                    child: MetaColumnView(
                      children: [
                        SizedBox(height: 60.h),
                        Container(
                          height: 60.h,
                          width: 200.w,
                          child: MetaSVGView(
                              svgName: AssetConstants.splash1,
                              basePath: MetaFlavourConstants.flavorPath),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Container(
                          padding: padding,
                          child: MetaBlocTextField(
                            labelText: "id",
                            hintText: "enterEmail",
                            textFieldBloc: formBloc.tfUsername,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          padding: padding,
                          child: MetaBlocTextField(
                              hintText: "enterPassword",
                              labelText: "password",
                              textFieldBloc: formBloc.tfPassword,
                              isPassword: true),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          padding: padding,
                          child: MetaButton(
                            radius: 12,
                            bgColor: MetaColors().primaryColor,
                            textStyle: const MetaStyle(
                                fontColor: MetaColors.whiteColor, fontSize: 20),
                            onTap: () async {
                              //Navigator.pushReplacementNamed(context, RouteConstants.onBoardPath);

                              formBloc.submit();
                            },
                            text: "login",
                          ),
                        ),
                        Container(
                          padding: padding,
                          child: MetaRowView(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MetaCheckBox(onCheckPressed: (value) {
                                  formBloc.keepLoggedIn.updateValue(value);
                                }),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: MetaTextView(
                                    text: "keepMeLoggedIn",
                                    textStyle: MetaStyle(
                                        fontSize: 12,
                                        fontColor: MetaColors.s25Clr,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          margin: padding,
                          alignment: Alignment.centerRight,
                          child: MetaTextView(
                            text: "id/pwFind",
                            textStyle: MetaStyle(
                                fontSize: 12,
                                fontColor: MetaColors().primaryColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Container(
                          padding: padding,
                          child: MetaRowView(
                            children: [
                              Expanded(
                                  child: Container(
                                      height: 2,
                                      color: MetaColors.colorf7f7f7)),
                              SizedBox(width: 10.w),
                              Container(
                                alignment: Alignment.center,
                                child: const MetaTextView(
                                  text: "letsGetStarted",
                                  textStyle: MetaStyle(
                                      fontSize: 12,
                                      fontColor: MetaColors.color848484,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                  child: Container(
                                      height: 2,
                                      color: MetaColors.colorf7f7f7)),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          height: 40.h,
                          width: 150.w,
                          child: MetaRowView(
                              children: [
                            MetaSVGView(
                                svgName: AssetConstants.kakao,
                                basePath: MetaFlavourConstants.flavorPath),
                            MetaSVGView(
                                svgName: AssetConstants.naver,
                                basePath: MetaFlavourConstants.flavorPath),
                            MetaSVGView(
                                svgName: AssetConstants.google,
                                basePath: MetaFlavourConstants.flavorPath),
                          ].expandedEqually().toList()),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          margin: padding,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteConstants.joinMembershipPath);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      color: MetaColors().primaryColor)),
                              child: MetaTextView(
                                text: "emailSignUp",
                                textStyle: MetaStyle(
                                    fontSize: 12,
                                    fontColor: MetaColors().primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // Container(
                        //   margin: padding,
                        //   child: InkWell(
                        //     onTap: () {
                        //       MetaNFCConfig().writeNFC("1");
                        //     },
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       height: 35.h,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(10.r),
                        //           border: Border.all(
                        //               color: MetaColors().primaryColor)),
                        //       child: MetaTextView(
                        //         text: "WRITE NFC",
                        //         textStyle: MetaStyle(
                        //             fontSize: 12,
                        //             fontColor: MetaColors().primaryColor,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        // Container(
                        //   margin: padding,
                        //   child: InkWell(
                        //     onTap: () {
                        //       MetaNFCConfig().writeNFC("2");
                        //     },
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       height: 35.h,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(10.r),
                        //           border: Border.all(
                        //               color: MetaColors().primaryColor)),
                        //       child: MetaTextView(
                        //         text: "WRITE NFC",
                        //         textStyle: MetaStyle(
                        //             fontSize: 12,
                        //             fontColor: MetaColors().primaryColor,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ));
            }),
          ),
        ));
  }
}
