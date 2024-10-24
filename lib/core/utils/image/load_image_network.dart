import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LoadNetworkImage extends StatelessWidget {
  const LoadNetworkImage({
    super.key,
  required this.imageUrl,
  this.imageColor,this.fit = BoxFit.cover,
  this.loadingWidget, this.radius,
  });

  final String imageUrl;
  final Color? imageColor;
  final BoxFit fit;
  final Widget? loadingWidget;
  final BorderRadiusGeometry? radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero ,
      child: CachedNetworkImage(
        placeholder: (context, url) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            loadingWidget ??  const CircularProgressIndicator()
          ],
        ),
        imageUrl: imageUrl,
        color: imageColor,
        fit: fit,
        errorWidget: (context, url, error) {
          return const Icon(Icons.image_not_supported,size: 48);
        },
      ),
    );
  }
}