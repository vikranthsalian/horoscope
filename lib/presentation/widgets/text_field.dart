import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaTextField extends StatelessWidget {
  MetaTextField(
      {Key? key,
      required this.controller,
      this.maxLength,
      this.labelText,
      this.hintText,
      this.onChanged,
      this.onSubmitted,
      this.onTapped,
      this.onValidate,
      this.suffixIcon,
      this.prefixIcon,
      this.textStyling,
      this.labelStyling,
      this.backgroundColor,
      this.borderColor,
      this.errorColor,
      this.inputType = TextInputType.text,
      this.enabled = true,
      this.inputFormatters,
      this.hintStyle,
      this.isPassword = false,
      this.autofocus = false,
      this.borderRadius = 8,
      this.maxLines,
      this.textInputAction,
      this.readOnly = false,
      this.showTopLabel = false})
      : super(key: key);
  String? labelText;
  TextEditingController? controller;
  String? hintText;
  int? maxLength;
  Function(String)? onChanged;
  Function(String)? onSubmitted;
  Function(String)? onTapped;
  FormFieldValidator<String>? onValidate;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextStyle? textStyling;
  TextStyle? labelStyling;
  Color? backgroundColor;
  Color? borderColor;
  Color? errorColor;
  TextInputType inputType;
  bool enabled;
  bool readOnly;
  bool autofocus;
  TextAlign? textAlign;
  List<TextInputFormatter>? inputFormatters;
  TextStyle? hintStyle;
  bool isPassword;
  final double borderRadius;
  final int? maxLines;
  bool showTopLabel;
  TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MetaColumnView(
        children: [
          showTopLabel
              ? Container(
                  alignment: Alignment.centerLeft,
                  child: MetaTextView(
                    text: labelText ?? "",
                    textAlign: TextAlign.center,
                    textStyle: MetaStyle(
                        fontSize: 12,
                        fontColor: MetaColors.blackColor,
                        fontWeight: FontWeight.bold),
                  ))
              : Container(),
          TextFormField(
            controller: controller,
            onTap: () {
              if (onTapped != null) {
                onTapped!("sd");
              }
            },
            onFieldSubmitted: (text) {},
            autofocus: autofocus,
            textInputAction: textInputAction,
            enabled: enabled,
            keyboardType: inputType,
            maxLength: maxLength != 0 ? maxLength : null,
            onChanged: onChanged,
            style: textStyling,
            inputFormatters: inputFormatters,
            maxLines: maxLines ?? 1,
            validator: onValidate,
            decoration: InputDecoration(
              isDense: true,
              //   contentPadding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
              border: _renderBorder(MetaColors.sD9),
              disabledBorder: _renderBorder(MetaColors.sD9),
              focusedBorder: _renderBorder(MetaColors.sD9),
              enabledBorder: _renderBorder(MetaColors.sD9),
              label: MetaTextView(
                  text: labelText ?? "",
                  textStyle:
                      const MetaStyle(fontColor: MetaColors.sC4, fontSize: 12)),
              hintText: hintText,
              hintStyle: hintStyle,
              filled: true,
              fillColor: Colors.white,
              errorStyle: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: MetaColors.errorColor),
              helperMaxLines: 1,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
            readOnly: readOnly,
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _renderBorder(color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: color!),
      );
}

class MetaBlocTextField extends StatelessWidget {
  MetaBlocTextField({
    Key? key,
    required this.textFieldBloc,
    this.maxLength,
    this.labelText = "",
    this.hintText = "",
    this.onChanged,
    //   this.onValidate,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor = Colors.white,
    this.inputType = TextInputType.text,
    this.enabled = true,
    this.inputFormatters,
    this.isPassword = false,
    this.borderRadius = 8,
    this.maxLines,
    this.readOnly = false,
    this.showCounter = false,
    this.showTopLabel = true,
  }) : super(key: key);

  bool showCounter;
  String labelText;
  TextEditingController? controller;
  String hintText;
  int? maxLength;
  Function(String)? onChanged;
  // FormFieldValidator<String>? onValidate;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Color? backgroundColor;
  TextInputType inputType;
  bool enabled;
  bool readOnly;
  TextAlign? textAlign;
  List<TextInputFormatter>? inputFormatters;
  bool isPassword;
  bool showTopLabel;
  final double borderRadius;
  final int? maxLines;
  TextFieldBloc textFieldBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MetaColumnView(
        children: [
          showTopLabel
              ? Container(
                  alignment: Alignment.centerLeft,
                  child: MetaTextView(
                    text: labelText,
                    textAlign: TextAlign.center,
                    textStyle: MetaStyle(
                        fontSize: 12,
                        fontColor: MetaColors().primaryColor,
                        fontWeight: FontWeight.w400),
                  ))
              : Container(),
          TextFieldBlocBuilder(
            // key: UniqueKey(),
            textFieldBloc: textFieldBloc,
            keyboardType: inputType,
            maxLength: maxLength != 0 ? maxLength : null,
            onChanged: onChanged,
            textStyle: const MetaStyle(
                    fontColor: MetaColors.color3F3F3F,
                    fontSize: 14,
                    fontWeight: FontWeight.w100)
                .getStyle(),
            inputFormatters: inputFormatters,
            maxLines: maxLines ?? 1,
            obscureText: isPassword,
            isEnabled: enabled,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                border: _renderBorder(MetaColors.colord7d7d7),
                disabledBorder: _renderBorder(MetaColors.colord7d7d7),
                focusedBorder: _renderBorder(MetaColors.colord7d7d7),
                enabledBorder: _renderBorder(MetaColors.colord7d7d7),
                focusedErrorBorder: _renderBorder(MetaColors().primaryColor),
                errorBorder: _renderBorder(MetaColors.colord7d7d7),
                //  label:MetaTextView(text:labelText,textStyle: const MetaStyle(fontColor: MetaColors.sC4,fontSize: 12)),
                hintText: hintText.tr(),
                hintStyle: const MetaStyle(
                        fontColor: MetaColors.color848484, fontSize: 12)
                    .getStyle(),
                errorStyle: MetaStyle(
                        fontColor: MetaColors().primaryColor, fontSize: 12)
                    .getStyle(),
                filled: true,
                fillColor: backgroundColor,
                helperMaxLines: 1,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _renderBorder(color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: color),
      );

// UnderlineInputBorder _renderBorder(color) =>
//     UnderlineInputBorder(borderSide: BorderSide(color: color));
}
