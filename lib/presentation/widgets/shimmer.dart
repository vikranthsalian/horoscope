import 'package:flutter/material.dart';

class MetaShimmer extends StatefulWidget {
  const MetaShimmer({
    required this.child,
  });

  final Widget child;

  @override
  State<MetaShimmer> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<MetaShimmer> {
  @override
  Widget build(BuildContext context) {

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return _shimmerGradient.createShader(bounds);
      },
      child: widget.child,
    );
  }

  static const _shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
}
