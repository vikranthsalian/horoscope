// import 'package:flutter/material.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:adithya_horoscope/core/constants/color_constants.dart';
// import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
// import 'package:adithya_horoscope/core/constants/route_constants.dart';
// import 'package:adithya_horoscope/presentation/widgets/button.dart';
// import 'package:adithya_horoscope/presentation/widgets/image_view.dart';
// import 'package:adithya_horoscope/presentation/widgets/style.dart';
// import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
// class MetaErrorBuilder extends StatelessWidget {
//
//   final bloc;
//   MetaErrorBuilder(this.bloc)
//   @override
//   Widget build(BuildContext context) {
//
//       return  BlocBuilder(
//         bloc: bloc,
//         builder: (context, state) {
//           List rules =
//               state.fixtureCreateModel?.rulesResponse ?? [];
//           return InkWell(
//             onTap: () async {
//               await showDialog(
//                   context: context,
//                   builder: (_) => DialogLocationPicker(
//                       title: "Select Rules",
//                       list: rules,
//                       onSelected: (value) {
//                         formBloc!.tfRule.updateValue(value.name);
//                         formBloc!.tpRuleID
//                             .updateValue(value.id.toString());
//                       }));
//             },
//             child: Cric8BlocTextField(
//               labelText: "Rules Template",
//               isEnabled: false,
//               textFieldBloc: formBloc!.tfRule,
//               backgroundColor: Colors.transparent,
//             ),
//           );
//         },
//       ),;
//   }
// }
