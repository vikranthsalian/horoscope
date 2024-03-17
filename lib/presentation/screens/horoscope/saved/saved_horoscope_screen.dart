import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/domain/model/user.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/components/search_view.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/saved/saved_horoscope_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/icon.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedHoroScopeScreen extends StatelessWidget {
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
              create: (context) => SavedHoroScopeFormBloc(),
              child: Builder(builder: (context) {
                SavedHoroScopeFormBloc formBloc =
                    BlocProvider.of<SavedHoroScopeFormBloc>(context);

                return FormBlocListener<SavedHoroScopeFormBloc, String, String>(
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
                    child: MetaColumnView(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10.h),
                        Container(
                          padding: padding,
                          alignment: Alignment.center,
                          child: MetaTextView(
                            text: "saved_horoscope",
                            textStyle: MetaStyle(
                                fontSize: 20,
                                fontColor: MetaColors().primaryColor,
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          padding: padding,
                          child:
                              MetaSearchView(text: "search_horoscope_by_name"),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          padding: padding,
                          alignment: Alignment.centerLeft,
                          child: MetaTextView(
                            text: "recent_horoscope",
                            textStyle: MetaStyle(
                                fontSize: 15,
                                fontColor: MetaColors.color3F3F3F,
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          child: BlocBuilder<BooleanFieldBloc,
                                  BooleanFieldBlocState>(
                              bloc: formBloc.isLoading,
                              builder: (context, state) {
                                if (state.value == true) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                List<User> list =
                                    formBloc.dataModel.value ?? [];
                                print(list.length);
                                return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount: list.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          User item = list[index];

                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 5.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: MetaColors
                                                        .color3F3F3F
                                                        .withOpacity(0.3))),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5.h,
                                                horizontal: 10.w),
                                            child: ListTile(
                                              //   isThreeLine: true,
                                              leading: Container(
                                                height: 40.w,
                                                width: 40.w,
                                                child: MetaSVGView(
                                                    svgName:
                                                        AssetConstants.logoSVG,
                                                    basePath:
                                                        MetaFlavourConstants
                                                            .flavorPath),
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              trailing: Container(
                                                alignment: Alignment.topCenter,
                                                height: 80.w,
                                                width: 40.w,
                                                child: onclick(list[index]),
                                              ),
                                              title: MetaTextView(
                                                text: item.name ?? "",
                                                textAlign: TextAlign.start,
                                                textStyle: MetaStyle(
                                                    fontSize: 12,
                                                    fontColor:
                                                        MetaColors.color3F3F3F,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              subtitle: MetaTextView(
                                                text: (item.date ?? "") +
                                                    "\n" +
                                                    (item.place ?? ""),
                                                textAlign: TextAlign.start,
                                                textStyle: MetaStyle(
                                                    fontSize: 10,
                                                    fontColor:
                                                        MetaColors.color3F3F3F,
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                            ),
                                          );
                                        }));
                              }),
                        )
                      ],
                    ));
              }),
            ),
          )),
    );
  }

  onclick(User user) {
    return Align(
      child: PopupMenuButton(
        color: MetaColors.color3F3F3F,
        icon: AbsorbPointer(
          child: MetaIcon(
              onIconPressed: () {},
              icon: Icons.more_vert,
              size: 15,
              color: MetaColors.color3F3F3F),
        ),
        onSelected: (data) {
          if (data == "1") {
            Navigator.pushNamed(globalContext, RouteConstants.viewHoroScopePath,
                arguments: {"user": user});
          }

          if (data == "3") {
            FirebaseDatabase.instance
                .reference()
                .child('horoscope_details')
                .child(user.uniqueID!)
                .remove();
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
              value: "1",
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Row(
                  children: [
                    AbsorbPointer(
                      child: MetaIcon(
                          onIconPressed: () {},
                          icon: Icons.remove_red_eye_rounded,
                          size: 15,
                          color: MetaColors().primaryColor),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      //      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: MetaTextView(
                        text: "View",
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
              value: "2",
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Row(
                  children: [
                    AbsorbPointer(
                      child: MetaIcon(
                          onIconPressed: () {},
                          icon: Icons.file_download,
                          size: 15,
                          color: MetaColors().primaryColor),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      //    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: MetaTextView(
                        text: "Download",
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
              value: "3",
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Row(
                  children: [
                    AbsorbPointer(
                      child: MetaIcon(
                          onIconPressed: () {},
                          icon: Icons.delete_forever,
                          size: 15,
                          color: MetaColors().primaryColor),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                        // padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: MetaTextView(
                      text: "Delete",
                      textStyle: MetaStyle(
                          fontSize: 12,
                          fontColor: MetaColors().primaryColor,
                          fontWeight: FontWeight.w100),
                    )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
