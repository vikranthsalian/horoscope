import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/data/cubits/login/login_cubit.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/presentation/screens/auth/login/login_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_field.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        body: BlocProvider(
          create: (context) => LoginFormBloc(),
          child: Builder(builder: (context) {
            LoginFormBloc formBloc = BlocProvider.of<LoginFormBloc>(context);

            if (kDebugMode) {
              formBloc.tfEmail.updateValue("vikkysalian@gmail.com");
              formBloc.tfPassword.updateValue("12345678");
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
                    context.read<LoginCubit>().setLoginResponse(modelResponse!);

                    Navigator.pushReplacementNamed(
                        context, RouteConstants.navPath);
                  }
                },
                onFailure: (context, state) {},
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: MetaColumnView(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: MetaTextView(
                                  text: "AMPWORK",
                                  textStyle: MetaStyle(
                                      fontSize: 16,
                                      fontColor: MetaColors.color3F3F3F,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: MetaTextView(
                                  text: "We AMPlify You",
                                  textStyle: MetaStyle(
                                      fontSize: 10,
                                      fontColor: MetaColors.color3F3F3F,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              Container(
                                height: MediaQuery.sizeOf(context).height * 0.4,
                                child: MetaSVGView(
                                    svgName: AssetConstants.logoSVG,
                                    basePath: MetaFlavourConstants.flavorPath),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: MetaTextView(
                                  text: "Aditya",
                                  textStyle: MetaStyle(
                                      fontSize: 28,
                                      fontColor: MetaColors().primaryColor,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.r),
                                topLeft: Radius.circular(30.r)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x54000000),
                                spreadRadius: 4,
                                blurRadius: 20,
                              )
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.r),
                              topLeft: Radius.circular(30.r)),
                          child: Container(
                            color: Colors.white,
                            child: MetaColumnView(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 10.h),
                                Container(
                                  alignment: Alignment.center,
                                  child: MetaTextView(
                                    text: "login",
                                    textStyle: MetaStyle(
                                        fontSize: 20,
                                        fontColor: MetaColors.color3F3F3F,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                  padding: padding,
                                  child: MetaBlocTextField(
                                    labelText: "email_address",
                                    hintText: "enter_email_address",
                                    textFieldBloc: formBloc.tfEmail,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  padding: padding,
                                  child: MetaBlocTextField(
                                    labelText: "password",
                                    hintText: "enter_password",
                                    textFieldBloc: formBloc.tfPassword,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(8)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 40.h,
                                  padding: padding,
                                  child: MetaButton(
                                    radius: 12,
                                    bgColor: MetaColors().primaryColor,
                                    textStyle: const MetaStyle(
                                        fontColor: MetaColors.whiteColor,
                                        fontWeight: FontWeight.w100,
                                        fontSize: 20),
                                    onTap: () async {
                                      formBloc.submit();
                                    },
                                    text: "login",
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                // MetaTextView(
                                //   text: "or",
                                //   textStyle: MetaStyle(
                                //       fontSize: 20,
                                //       fontColor: MetaColors.color3F3F3F,
                                //       fontWeight: FontWeight.w100),
                                // ),
                                // GoogleSignInButton()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          }),
        ));
  }
}
