import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.backgroundImageURL,
    this.shimmerBorderRadius,
    this.shape = BoxShape.rectangle,
  });

  final String backgroundImageURL;
  final double? shimmerBorderRadius;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(shimmerBorderRadius ?? 0),
      child: Image.network(
        backgroundImageURL,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return LoaderWithShimmer(
              shimmerBorderRadius: shimmerBorderRadius,
              shape: shape,
            );
          }
        },
        errorBuilder: (context, error, stackTrace) => LoaderWithShimmer(
          shimmerBorderRadius: shimmerBorderRadius,
          shape: shape,
        ),
      ),
    );
  }
}

class LoaderWithShimmer extends StatelessWidget {
  const LoaderWithShimmer({
    super.key,
    this.shimmerBorderRadius,
    this.shape = BoxShape.rectangle,
  });

  final double? shimmerBorderRadius;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: shape,
        color: Colors.grey,
        borderRadius: shape == BoxShape.rectangle 
          ? BorderRadius.circular(shimmerBorderRadius ?? 0) 
          : null,
      ),
    ) .animate(
      onComplete: (controller) => controller.repeat()
    ).shimmer(
      duration: const Duration(seconds: 1)
    );
  }
}