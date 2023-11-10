// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';

class MyImage extends StatelessWidget {
  //
  final String imgUrl;

  final double? maxHeight;
  final double? width, height;
  final double? minWidth, minHeight;

  final VoidCallback? onChangeImage;

  final BoxFit? fit;

  final String? errorImage;

  MyImage(
    this.imgUrl, {
    //
    this.width,
    this.height,
    //
    this.minWidth,
    this.minHeight,
    this.maxHeight,
    this.onChangeImage,
    //
    this.errorImage = AppDrawables.errorProfileImage,
    this.fit = BoxFit.cover,
  }) : super(key: ValueKey(imgUrl));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: maxHeight ?? double.infinity,
            ),
            child: CachedNetworkImage(
              fit: fit,
              width: width,
              height: height,
              imageUrl: imgUrl,
              placeholder: (context, url, [_]) => getPlaceholder(),
              errorWidget: (context, url, error) => getErrorImage(),
            ),
          ),
        ),
        if (onChangeImage != null)
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onChangeImage,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 30,
                      sigmaY: 20,
                    ),
                    child: SvgPicture.asset(AppDrawables.gallery),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget getPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      direction: ShimmerDirection.ltr,
      child: Container(
        width: width ?? minWidth,
        color: Colors.grey[300],
        height: height ?? minHeight,
      ),
    );
  }

  Widget getErrorImage() {
    return errorImage != null
        ? Image.asset(
            errorImage!,
            width: width,
            height: height,
          )
        : getPlaceholder();
  }
}
