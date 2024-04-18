import 'dart:io';

import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaImageView extends StatelessWidget {
  final String imageName;
  final String type;
  final String basePath;
  final BoxFit fit;

  const MetaImageView(
      {super.key,
      required this.imageName,
      required this.basePath,
      this.type = AssetConstants.imagesPath,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    // if(height == null){
    //  return Image.asset(
    //       path,
    //       fit: fit
    //   );
    // }

    return Image.asset(
      basePath + type + imageName,
      fit: fit,
      width: double.infinity,
    );
  }
}

class MetaImageNetwork extends StatelessWidget {
  String path;
  double? height;
  double? width;
  double radius;
  BoxShape shape;
  MetaImageNetwork(
      {super.key,
      required this.path,
      this.radius = 8,
      this.height,
      this.width,
      this.shape = BoxShape.rectangle});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      cacheKey: path,
      fit: BoxFit.contain,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(radius.r),
        child: Container(
          decoration: BoxDecoration(
            shape: shape,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
      errorWidget: (context, url, error) {
        if (url.isEmpty) {
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: MetaSVGView(
                svgName: AssetConstants.logoOnySVG,
                basePath: MetaFlavourConstants.flavorPath),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      placeholder: (context, url) {
        if (url.isEmpty) {
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: MetaSVGView(
                svgName: AssetConstants.logoOnySVG,
                basePath: MetaFlavourConstants.flavorPath),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    return Image.network(path,
        //   width: width!.w,
        //  height: height!.h,
        fit: BoxFit.contain);
  }
}

class MetaImageFile extends StatelessWidget {
  File file;
  double? height;
  double? width;
  double radius;
  BoxShape shape;
  MetaImageFile(
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
