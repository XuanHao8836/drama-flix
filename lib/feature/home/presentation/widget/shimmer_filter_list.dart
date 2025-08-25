import 'package:drama_flix/common/widgets/shimmer_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFilterList extends StatelessWidget {
  const ShimmerFilterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: ShimmerLoadingWidget(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              5,
                  (index) => Container(
                width: 80,
                height: 30,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
