import 'package:cached_network_image/cached_network_image.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/image_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaImageSlider extends StatefulWidget {
  final List<String> data;
  final double radius;
  final Function? onTap;
  MetaImageSlider({required this.data, this.radius = 0, this.onTap});
  @override
  _MetaImageSliderState createState() => _MetaImageSliderState();
}

class _MetaImageSliderState extends State<MetaImageSlider> {
  int _currentPage = 0;
  int nextPage = 0;
  PageController _controller = PageController();

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  initState() {
    super.initState();

    if (widget.data.length > 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
    }
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateSlider() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      nextPage = nextPage + 1;
      if (nextPage == widget.data.length) {
        nextPage = 0;
      }
      try {
        _controller
            .animateToPage(nextPage,
                duration: Duration(seconds: 1), curve: Curves.linear)
            .then((_) => _animateSlider());
      } catch (e) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MetaColors.whiteColor,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: widget.data.length,
            itemBuilder: (context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius),
                child: CachedNetworkImage(
                  imageUrl: widget.data[index],
                  fit: BoxFit.contain,
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(widget.radius),
                    child: InkWell(
                      onTap: () {
                        widget.onTap!(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(widget.radius),
                      child: MetaImageView(
                        imageName: MetaFlavourConstants.logo,
                        fit: BoxFit.cover,
                        basePath: MetaFlavourConstants.flavorPath,
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(widget.radius),
                      child: MetaImageView(
                        imageName: MetaFlavourConstants.logo,
                        fit: BoxFit.scaleDown,
                        basePath: MetaFlavourConstants.flavorPath,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          if (widget.data.length > 1)
            Container(
              height: 18.h,
              color: MetaColors.blackColor.withOpacity(0.7),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List<Widget>.generate(widget.data.length, (int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(widget.radius),
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 5.h,
                          width: (index == _currentPage) ? 30 : 10,
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 7.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: (index == _currentPage)
                                  ? MetaColors.whiteColor
                                  : MetaColors.whiteColor.withOpacity(0.5))),
                    );
                  })),
            ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            height: 18.h,
            alignment: Alignment.centerRight,
            child: MetaTextView(
              text: "${_currentPage + 1}/${widget.data.length}",
              textStyle: MetaStyle(
                  fontSize: 9,
                  fontColor: MetaColors.whiteColor,
                  fontWeight: FontWeight.normal),
            ),
          )
        ],
      ),
    );
  }
}
