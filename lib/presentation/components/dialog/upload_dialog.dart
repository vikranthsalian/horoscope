// import 'dart:io';
//
// import 'package:adithya_horoscope/core/constants/color_constants.dart';
// import 'package:adithya_horoscope/domain/model/sort_model.dart';
// import 'package:adithya_horoscope/presentation/components/dialog/dialog.dart';
// import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
// import 'package:adithya_horoscope/presentation/widgets/style.dart';
// import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
//
// class MetaDialogUpload extends StatelessWidget {
//   Function(XFile, String, int)? onSelected;
//   List<DialogListModel> list;
//   MetaDialogUpload({this.onSelected, this.list = const [], super.key});
//
//   String gallery = "GALLERY";
//   String galleryV = "GALLERY VIDEO";
//   String camera = "CAMERA";
//   String cameraV = "CAMERA VIDEO";
//
//   File? file;
//   final ImagePicker _picker = ImagePicker();
//
//   @override
//   Widget build(BuildContext context) {
//     return MetaDialog(
//         child: Container(
//       child: MetaColumnView(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Container(
//               width: MediaQuery.of(context).size.width,
//               color: MetaColors.whiteColor,
//               padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 5.h),
//                     child: const MetaTextView(
//                       textAlign: TextAlign.start,
//                       text: "selectFile",
//                       textStyle: MetaStyle(
//                           fontSize: 14,
//                           fontColor: MetaColors.blackColor,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ],
//               )),
//           Container(
//             color: MetaColors.whiteColor,
//             child: ListView.separated(
//                 shrinkWrap: true,
//                 padding: EdgeInsets.zero,
//                 itemCount: list.length,
//                 itemBuilder: (context, i) {
//                   return InkWell(
//                       onTap: () async {
//                         Navigator.pop(context);
//                         if (list[i].name == gallery) {
//                           final XFile? pickedFile = await _picker.pickImage(
//                               source: ImageSource.gallery);
//                           if (pickedFile != null) {
//                             //file = File(pickedFile.path.toString());
//                             onSelected!(pickedFile, "IMG", 1);
//                           } else {
//                             // User canceled the picker
//                           }
//                         } else if (list[i].name == galleryV) {
//                           final XFile? pickedFile = await _picker.pickVideo(
//                               source: ImageSource.gallery);
//                           if (pickedFile != null) {
//                             //  file = File(pickedFile.path.toString());
//                             onSelected!(pickedFile, "VID", 2);
//                           }
//                         } else if (list[i].name == camera) {
//                           final XFile? pickedFile = await _picker.pickImage(
//                               source: ImageSource.camera);
//                           if (pickedFile != null) {
//                             //  file = File(pickedFile.path.toString());
//                             onSelected!(pickedFile, "IMG", 3);
//                           }
//                         } else if (list[i].name == cameraV) {
//                           final XFile? pickedFile = await _picker.pickVideo(
//                               source: ImageSource.camera);
//                           if (pickedFile != null) {
//                             //  file = File(pickedFile.path.toString());
//                             onSelected!(pickedFile, "VID", 4);
//                           }
//                         }
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 10.h, vertical: 6.h),
//                         child: MetaTextView(
//                           textAlign: TextAlign.center,
//                           text: list[i].name!.tr(),
//                           textStyle: const MetaStyle(
//                               fontSize: 12,
//                               fontColor: MetaColors.color3c3c3c,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ));
//                 },
//                 separatorBuilder: (BuildContext context, int index) {
//                   return const Divider();
//                 }),
//           )
//         ],
//       ),
//     ));
//   }
// }
