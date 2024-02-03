import 'dart:io';

import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class MetaLottieView extends StatelessWidget {
  final String lottieName;
  final String type;
  final String basePath;
  final BoxFit fit;

  const MetaLottieView(
      {super.key,
      required this.lottieName,
      required this.basePath,
      this.type = AssetConstants.jsonPath,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      basePath + type + lottieName,
      fit: fit,
      width: double.infinity,
    );
  }
}

class MetaLottieNetwork extends StatelessWidget {
  String path;
  double? height;
  double? width;
  double radius;
  BoxShape shape;
  MetaLottieNetwork(
      {super.key,
      required this.path,
      this.radius = 8,
      this.height,
      this.width,
      this.shape = BoxShape.rectangle});

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
      path,
      fit: BoxFit.contain,
      // errorBuilder: (context, imageProvider) => ClipRRect(
      //   borderRadius: BorderRadius.circular(radius.r),
      //   child: Container(
      //     decoration: BoxDecoration(
      //       shape: shape,
      //       image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      //     ),
      //   ),
      // ),
      // errorWidget: (context, url, error) {
      //   return ClipRRect(
      //       borderRadius: BorderRadius.circular(radius.r),
      //       child: Container(
      //         width: 100.w,
      //         height: 100.w,
      //         child: MetaLottieView(
      //           imageName: AssetConstants.logo,
      //           basePath: MetaFlavourConstants.flavorPath,
      //           fit: BoxFit.scaleDown,
      //         ),
      //       ));
      // },
      // placeholder: (context, url) {
      //   return ClipRRect(
      //     borderRadius: BorderRadius.circular(radius.r),
      //     child: Container(
      //       width: 100.w,
      //       height: 100.w,
      //       child: MetaLottieView(
      //         imageName: AssetConstants.logo,
      //         basePath: MetaFlavourConstants.flavorPath,
      //         fit: BoxFit.scaleDown,
      //       ),
      //     ),
      //   );
      // },
    );
  }
}

class MetaLottieFile extends StatelessWidget {
  File file;
  double? height;
  double? width;
  double radius;
  BoxShape shape;
  MetaLottieFile(
      {super.key,
      required this.file,
      this.radius = 8,
      this.height,
      this.width,
      this.shape = BoxShape.rectangle});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius.r),
        child: Image.file(
          File(file.path),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ));
  }
}
