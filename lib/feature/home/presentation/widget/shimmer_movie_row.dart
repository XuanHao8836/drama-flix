import 'package:drama_flix/common/widgets/shimmer_loading_widget.dart';
import 'package:flutter/material.dart';

class ShimmerMovieRow extends StatelessWidget {
  const ShimmerMovieRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoadingWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title shimmer
          Container(
            width: 150,
            height: 20,
            margin: const EdgeInsets.only(left: 16.0, bottom: 10.0, top: 20),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // Movie list shimmer
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
