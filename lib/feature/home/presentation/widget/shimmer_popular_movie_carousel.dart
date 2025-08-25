import 'package:drama_flix/common/widgets/shimmer_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPopularMovieCarousel extends StatelessWidget {
  final int itemCount;

  const ShimmerPopularMovieCarousel({super.key, this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(
      viewportFraction: 0.7,
      initialPage: 1,
    );

    return ShimmerLoadingWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 20,
            margin: const EdgeInsets.only(left: 16.0, top: 16),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),

          SizedBox(
            height: 320,
            child: PageView.builder(
              controller: pageController,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                double currentPageValue =
                pageController.hasClients && pageController.page != null
                    ? pageController.page!
                    : 1.0;
                double distance = (index - currentPageValue).abs();

                double scale = 1.0 - (distance * 0.2);
                if (scale < 0.85) scale = 0.85;

                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: Transform.scale(
                    scale: scale,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
