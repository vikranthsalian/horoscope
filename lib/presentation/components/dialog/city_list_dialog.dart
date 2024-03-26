import 'dart:convert';

import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/domain/model/cities_model.dart';
import 'package:adithya_horoscope/presentation/components/dialog/dialog.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/icon.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_field.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaCityDialogList extends StatelessWidget {
  Function? onSelected;
  String? selected;
  MetaCityDialogList({
    this.onSelected,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CityFormBloc(),
      child: Builder(builder: (context) {
        CityFormBloc formBloc = BlocProvider.of<CityFormBloc>(context);
        return MetaDialog(
            child: Container(
          child: MetaColumnView(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: MetaColors.whiteColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: MetaTextView(
                          textAlign: TextAlign.start,
                          text: "select_city",
                          textStyle: MetaStyle(
                              fontSize: 14,
                              fontColor: MetaColors.blackColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )),
              Container(
                child: MetaTextField(
                  labelText: "searchHere",
                  hintText: "searchHere",
                  onTapped: (ts) {
                    formBloc.search();
                  },
                  showTopLabel: false,
                  onChanged: (text) {
                    formBloc.search();
                  },
                  onSubmitted: (text) {
                    formBloc.search();
                  },
                  textInputAction: TextInputAction.search,
                  controller: formBloc.controller.value,
                  suffixIcon: Container(
                      child: MetaIcon(
                          onIconPressed: () {},
                          icon: Icons.search,
                          size: 20,
                          color: MetaColors().primaryColor)),
                ),
              ),
              Container(
                height: 200.h,
                child: BlocBuilder(
                    bloc: formBloc.isLoading,
                    builder: (context, state) {
                      List<CitiesModel> list = formBloc.data.value ?? [];

                      if (formBloc.controller.value!.text.length > 3) {
                        return Container(
                          color: MetaColors.whiteColor,
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: list.length,
                            itemBuilder: (context, i) {
                              CitiesModel item = list[i];

                              return InkWell(
                                  onTap: () {
                                    onSelected!(item);
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.h, vertical: 9.h),
                                    child: MetaTextView(
                                      textAlign: TextAlign.center,
                                      text: item.city ?? "",
                                      textStyle: MetaStyle(
                                          fontSize: 12,
                                          fontColor: selected == item.city
                                              ? MetaColors().primaryColor
                                              : MetaColors.greyColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ));
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Container(height: 7);
                            },
                          ),
                        );
                      }
                      return Center(
                        child: Container(
                          child: MetaTextView(
                            textAlign: TextAlign.center,
                            text: "please_search_atleast_4_chars",
                            textStyle: MetaStyle(
                                fontSize: 12,
                                fontColor: MetaColors.greyColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    }),
              ),
              Container(height: 12.h),
              Container(
                height: 35.h,
                child: MetaButton(
                  radius: 12.r,
                  bgColor: MetaColors().primaryColor,
                  textStyle: const MetaStyle(
                      fontColor: MetaColors.whiteColor, fontSize: 14),
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  text: "close",
                ),
              ),
            ],
          ),
        ));
      }),
    );
  }
}

class CityFormBloc extends FormBloc<String, String> {
  final dataList = SelectFieldBloc<List<CitiesModel>, String>(initialValue: []);
  final data = SelectFieldBloc<List<CitiesModel>, String>(initialValue: []);
  final isLoading = BooleanFieldBloc(initialValue: false);

  final controller = SelectFieldBloc<TextEditingController, String>(
      initialValue: TextEditingController());

  CityFormBloc() : super(autoValidate: true, isLoading: true) {
    addFieldBlocs(fieldBlocs: []);
  }

  @override
  onLoading() async {
    isLoading.updateValue(true);
    readJson();
  }

  @override
  onSubmitting() async {}

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/flavor/adithya/jsons/cities.json');
    List data = await jsonDecode(response);
    List<CitiesModel> list = data
        .map((e) => CitiesModel.fromJson(e as Map<String, dynamic>))
        .toList();
    print(list.length);
    dataList.updateValue(list);
    isLoading.updateValue(false);
    emitLoaded();
  }

  search() {
    List<CitiesModel> main = dataList.value ?? [];
    if (controller.value!.text.length > 3) {
      isLoading.updateValue(true);
      List<CitiesModel> filtered = main
          .where((e) => (e.city!
              .toLowerCase()
              .contains(controller.value!.text.toLowerCase())))
          .toList();
      data.updateValue(filtered);
      print("dataList.value!.length");
      print(data.value!.length);
      isLoading.updateValue(false);
    } else {
      data.updateValue([]);
    }
  }
}
