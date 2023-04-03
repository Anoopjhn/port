import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonSquareImageWidget extends StatelessWidget {
  const CommonSquareImageWidget(
      {Key? key,
      required this.height,
      required this.width,
      this.borderRadius = 8,
      required this.networkImageUrl,
      required this.assetImageUrl,
      this.isCustomBorderRadius = false,
      this.customBorderRadius = BorderRadius.zero})
      : super(key: key);

  final double height;
  final double width;
  final double borderRadius;
  final String networkImageUrl;
  final String assetImageUrl;
  final bool isCustomBorderRadius;
  final BorderRadius customBorderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: isCustomBorderRadius
            ? customBorderRadius
            : BorderRadius.circular(borderRadius),
        child: networkImageUrl == ''
            ? Image.asset(
                assetImageUrl,
                fit: BoxFit.cover,
                height: height,
                width: width,
              )
            : Image.network(
                networkImageUrl,
                height: height,
                width: width,
                fit: BoxFit.cover,
                errorBuilder: (context, url, error) => Container(
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
                loadingBuilder: (context, widget, image) {
                  if (image == null) return widget;
                  return SizedBox(
                      height: height,
                      child: const Center(
                        child: CupertinoActivityIndicator(),
                      ));
                },
              )
        // CachedNetworkImage(
        //   height: height,
        //   width: width,
        //   fit: BoxFit.cover,
        //   imageUrl: networkImageUrl,
        //   placeholder: (context, url) => const Center(
        //     child: CupertinoActivityIndicator(),
        //   ),
        //   errorWidget: (context, url, error) => Container(
        //     color: Colors.grey[300],
        //     child: const Icon(
        //       Icons.error,
        //       color: Colors.red,
        //     ),
        //   ),
        // ),
        );
  }
}
