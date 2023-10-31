// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class MyImage extends StatelessWidget {
  //
  final String imgUrl;

  final double? maxHeight;
  final double? width, height;
  final double? minWidth, minHeight;

  final BoxFit? fit;

  MyImage(
    this.imgUrl, {
    //
    this.width,
    this.height,
    //
    this.minWidth,
    this.minHeight,
    this.maxHeight,
    //
    this.fit = BoxFit.cover,
  }) : super(key: ValueKey(imgUrl));

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
          httpHeaders: const {
            // HttpHeaders.authorizationHeader: 'Bearer ${MySPHelper.token}',
          },
        ),
      ),
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
}
