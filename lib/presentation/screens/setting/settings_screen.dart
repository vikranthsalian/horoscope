import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/data/cubits/kundliType/kundli_type_cubit.dart';
import 'package:adithya_horoscope/domain/model/sort_model.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/components/dialog/list_dialog.dart';
import 'package:adithya_horoscope/presentation/screens/setting/settings_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_field.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: MetaColors.whiteColor,
          appBar: MetaAppBar(title: MetaFlavourConstants.appTitle),
          resizeToAvoidBottomInset: true,
          body: Container(
            child: BlocProvider(
              create: (context) => SettingsFormBloc(),
              child: Builder(builder: (context) {
                SettingsFormBloc formBloc =
                    BlocProvider.of<SettingsFormBloc>(context);

                return FormBlocListener<SettingsFormBloc, String, String>(
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
                              text: "settings",
                              textStyle: MetaStyle(
                                  fontSize: 20,
                                  fontColor: MetaColors().primaryColor,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: padding,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                List<DialogListModel> list = [
                                  DialogListModel(id: 0, name: 'English'),
                                  DialogListModel(id: 1, name: 'Kannada'),
                                  DialogListModel(id: 2, name: 'Hindi'),
                                  DialogListModel(id: 3, name: 'Malayalam')
                                ];
                                showDialog(
                                    context: context,
                                    builder: (_) => MetaDialogList(
                                          header: "select_language",
                                          list: list,
                                          selected:
                                              formBloc.languageID.valueToInt ??
                                                  0,
                                          onSelected: (value) {
                                            formBloc.tfLanguage
                                                .updateValue(value.name);
                                            formBloc.languageID.updateValue(
                                                value.id.toString());
                                          },
                                        ));
                              },
                              child: MetaBlocTextField(
                                enabled: false,
                                labelText: "language",
                                hintText: "choose_your_language",
                                textFieldBloc: formBloc.tfLanguage,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                List<DialogListModel> list = [
                                  DialogListModel(id: 0, name: 'south_kundli'),
                                  DialogListModel(id: 1, name: 'north_kundli'),
                                ];
                                showDialog(
                                    context: context,
                                    builder: (_) => MetaDialogList(
                                          header: "select_kundli_type",
                                          list: list,
                                          selected:
                                              formBloc.kundliID.valueToInt ?? 0,
                                          onSelected: (value) {
                                            formBloc.tfKundliType
                                                .updateValue(value.name);
                                            formBloc.kundliID.updateValue(
                                                value.id.toString());

                                            context
                                                .read<KundliTypeCubit>()
                                                .setKundliType(value.id);
                                          },
                                        ));
                              },
                              child: MetaBlocTextField(
                                enabled: false,
                                labelText: "kundli_type",
                                hintText: "choose_kundli_type",
                                textFieldBloc: formBloc.tfKundliType,
                                inputType: TextInputType.text,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                List<DialogListModel> list = [
                                  DialogListModel(id: 0, name: 'center_limb'),
                                  DialogListModel(id: 1, name: 'upper_limb'),
                                ];
                                showDialog(
                                    context: context,
                                    builder: (_) => MetaDialogList(
                                          header: "select_sunrise_system",
                                          list: list,
                                          selected:
                                              formBloc.systemId.valueToInt ?? 0,
                                          onSelected: (value) {
                                            formBloc.tfSunriseSystem
                                                .updateValue(value.name);
                                            formBloc.systemId.updateValue(
                                                value.id.toString());
                                          },
                                        ));
                              },
                              child: MetaBlocTextField(
                                enabled: false,
                                labelText: "sunrise_system",
                                hintText: "choose_sunrise_system",
                                textFieldBloc: formBloc.tfSunriseSystem,
                                inputType: TextInputType.text,
                              ),
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
