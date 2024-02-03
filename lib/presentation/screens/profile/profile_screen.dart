import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/screens/profile/profile_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/icon.dart';
import 'package:adithya_horoscope/presentation/widgets/image_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_field.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: MetaColors.whiteColor,
          appBar: MetaAppBar(title: MetaFlavourConstants.appTitle),
          body: Container(
            child: BlocProvider(
              create: (context) => ProfileFormBloc(),
              child: Builder(builder: (context) {
                ProfileFormBloc formBloc =
                    BlocProvider.of<ProfileFormBloc>(context);

                return FormBlocListener<ProfileFormBloc, String, String>(
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
                              text: "profile",
                              textStyle: MetaStyle(
                                  fontSize: 20,
                                  fontColor: MetaColors().primaryColor,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Stack(
                            children: [
                              SizedBox(
                                  width: 120.w,
                                  height: 120.w,
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                      child: MetaImageNetwork(
                                        path:
                                            "http://m.gettywallpapers.com/wp-content/uploads/2023/06/Dark-Balck-Profile-Pic.jpg",
                                      ))),
                              Positioned(
                                  bottom: 10,
                                  right: 0,
                                  child: Container(
                                      width: 25.w,
                                      height: 25.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: MetaColors.color3F3F3F),
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                          color: MetaColors.whiteColor),
                                      child: MetaIcon(
                                        onIconPressed: () {
                                          // showDialog(
                                          //     context: globalContext,
                                          //     builder: (_) {
                                          //       return   MetaDialogUpload(
                                          //           list: [
                                          //             DialogListModel(
                                          //                 id: 1,
                                          //                 name: "GALLERY"),
                                          //             DialogListModel(
                                          //                 id: 2,
                                          //                 name: "CAMERA"),
                                          //           ],
                                          //           onSelected: (XFile file,
                                          //               type, index) {
                                          //             onSelect!(file);
                                          //           });
                                          //     }
                                          //
                                          // );
                                        },
                                        icon: Icons.camera_alt,
                                        color: MetaColors.color3F3F3F,
                                        size: 15,
                                      ))),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            child: MetaBlocTextField(
                              labelText: "name",
                              hintText: "name",
                              textFieldBloc: formBloc.tfFName,
                              enabled: false,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            child: MetaBlocTextField(
                              labelText: "date_of_birth",
                              hintText: "date_of_birth",
                              textFieldBloc: formBloc.tfDOB,
                              inputType: TextInputType.text,
                              enabled: false,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            child: MetaBlocTextField(
                              labelText: "phone_number",
                              hintText: "phone_number",
                              textFieldBloc: formBloc.tfPhNo,
                              inputType: TextInputType.text,
                              enabled: false,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            alignment: Alignment.centerLeft,
                            child: MetaTextView(
                              text: "settings",
                              textStyle: MetaStyle(
                                  fontSize: 15,
                                  fontColor: MetaColors.color3F3F3F,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: padding,
                            alignment: Alignment.centerLeft,
                            child: MetaTextView(
                              text: "about",
                              textStyle: MetaStyle(
                                  fontSize: 15,
                                  fontColor: MetaColors.color3F3F3F,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteConstants.premiumPlanPath);
                            },
                            child: Container(
                              padding: padding,
                              alignment: Alignment.centerLeft,
                              child: MetaTextView(
                                text: "upgrade_to_membership",
                                textStyle: MetaStyle(
                                    fontSize: 16,
                                    fontColor: MetaColors().primaryColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            padding: padding,
                            alignment: Alignment.centerLeft,
                            child: MetaTextView(
                              text: "sign_out",
                              textStyle: MetaStyle(
                                  fontSize: 15,
                                  fontColor: MetaColors.color3F3F3F,
                                  fontWeight: FontWeight.w400),
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

  customButtons(String nowIcon, String text) {
    return Container(
      child: MetaColumnView(
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            child: MetaSVGView(
                svgName: nowIcon, basePath: MetaFlavourConstants.flavorPath),
          ),
          Container(
            padding: padding,
            alignment: Alignment.centerLeft,
            child: MetaTextView(
              text: text,
              textStyle: const MetaStyle(
                  fontSize: 12,
                  fontColor: MetaColors.color3F3F3F,
                  fontWeight: FontWeight.w100),
            ),
          ),
        ],
      ),
    );
  }
}
