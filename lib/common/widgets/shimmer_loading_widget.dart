import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white10.withAlpha(20),
      highlightColor: Colors.white12,
      period: const Duration(milliseconds: 1000),
      child:
          child ??
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          ),
    );
  }
}
