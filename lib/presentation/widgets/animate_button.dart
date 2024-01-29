//
// import 'package:adithya_horoscope/core/constants/color_constants.dart';
// import 'package:adithya_horoscope/presentation/components/button_like/all.dart';
// import 'package:adithya_horoscope/presentation/components/button_like/button_like.dart';
// import 'package:adithya_horoscope/presentation/widgets/icon.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:adithya_horoscope/presentation/widgets/style.dart';
// import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
//
//
// class MetaButtonAnimate extends StatelessWidget {
//   final Function onTap;
//   final String text;
//   final Alignment alignment;
//   final MetaStyle textStyle;
//   final Color buttonColor;
//   final Color defaultColor;
//   final String buttonType;
//   final double radius;
//   final double elevation;
//   final BorderSide? borderSide;
//   const MetaButtonAnimate(
//       {Key? key,
//         required this.onTap,
//         required this.text,
//         required this.textStyle,
//         required this.buttonColor,
//         required this.defaultColor,
//         this.alignment = Alignment.center,
//         this.buttonType = "normal",
//         this.radius = 0,
//         this.elevation = 0,
//         this.borderSide,
//       })
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MetaAnimateButton(
//         size: 15.r,
//         isLiked: basicInfo?.socialEntries?.getFavourite ?? false,
//         circleColor: CircleColor(start:  buttonColor, end: buttonColor),
//         bubblesColor: BubblesColor(
//           dotPrimaryColor: buttonColor,
//           dotSecondaryColor: buttonColor,
//         ),
//         onTap: (bool isLiked){
//           StoreService().storeLike({
//             "status":!isLiked,
//             "id":data['id'].toString(),
//             "userId":globalContext.read<LoginCubit>().getLoginResponse().id.toString(),
//           });
//           return Future(() => !isLiked);
//         },
//         likeBuilder: (bool isLiked) {
//           return AbsorbPointer(
//             child: MetaIcon(
//                 icon:Icons.favorite,
//                 onIconPressed: (){
//
//                 },
//                 size: 15.r,
//                 color:isLiked  ? buttonColor : defaultColor
//             ),
//           );
//
//         }
//     );
//   }
//
//
// }
//
