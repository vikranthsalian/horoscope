import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/screens/auth/signup/signup_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_field.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MetaColors.whiteColor,
          appBar: MetaAppBar(title: MetaFlavourConstants.appTitle),
          resizeToAvoidBottomInset: true,
          body: Container(
            child: BlocProvider(
              create: (context) => SignupFormBloc(),
              child: Builder(builder: (context) {
                SignupFormBloc formBloc =
                    BlocProvider.of<SignupFormBloc>(context);

                return FormBlocListener<SignupFormBloc, String, String>(
                    onSubmissionFailed: (context, state) {
                      print("Error is.......$state");
                    },
                    onSuccess: (context, state) {
                      formBloc.clear();
                      // SignUpResponse? modelResponse = formBloc.dataModel.value;
                      //  Navigator.pop(context,(true,modelResponse!.email));
                    },
                    onFailure: (context, state) {
                      MetaAlert.showSnackbar(
                        error: true,
                        message: state.hasFailureResponse.toString(),
                      );
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.h),
                          Container(
                            padding: padding,
                            alignment: Alignment.center,
                            child: MetaTextView(
                              text: "new_profile",
                              textStyle: MetaStyle(
                                  fontSize: 20,
                                  fontColor: MetaColors().primaryColor,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            padding: padding,
                            alignment: Alignment.centerLeft,
                            child: MetaTextView(
                              text: "enter_details",
                              textStyle: MetaStyle(
                                  fontSize: 15,
                                  fontColor: MetaColors.color3F3F3F,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: padding,
                            child: MetaBlocTextField(
                              labelText: "full_name",
                              hintText: "enter_full_name",
                              textFieldBloc: formBloc.tfFName,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            child: MetaBlocTextField(
                              labelText: "email_address",
                              hintText: "enter_email_address",
                              textFieldBloc: formBloc.tfEmail,
                              inputType: TextInputType.emailAddress,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          // Container(
                          //   padding: padding,
                          //   child: MetaBlocTextField(
                          //     labelText: "date_of_birth",
                          //     hintText: "choose_date_of_birth",
                          //     textFieldBloc: formBloc.tfMobile,
                          //     inputType: TextInputType.text,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 10.h,
                          // ),
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
                            height: 30.h,
                          ),
                          Container(
                            padding: padding,
                            child: MetaButton(
                              radius: 12,
                              bgColor: MetaColors().primaryColor,
                              textStyle: const MetaStyle(
                                  fontColor: MetaColors.whiteColor,
                                  fontSize: 20),
                              onTap: () {
                                FocusScope.of(context).unfocus();

                                formBloc.submit();
                              },
                              text: "proceed".toUpperCase(),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: MetaTextView(
                              text: MetaFlavourConstants.appTitle,
                              textStyle: MetaStyle(
                                  fontSize: 28,
                                  fontColor: MetaColors().primaryColor,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: MetaTextView(
                              text: "ampwork",
                              textStyle: MetaStyle(
                                  fontSize: 16,
                                  fontColor: MetaColors.color3F3F3F,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: MetaTextView(
                              text: "we_amplify_you",
                              textStyle: MetaStyle(
                                  fontSize: 10,
                                  fontColor: MetaColors.color3F3F3F,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                        ],
                      ),
                    ));
              }),
            ),
          )),
    );
  }
}
