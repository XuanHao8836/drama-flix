import 'package:drama_flix/common/widgets/shimmer_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadedAppBar extends StatelessWidget {
  const ShimmerLoadedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 60.0),
      child:ShimmerLoadingWidget(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: Container(height: 14, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
