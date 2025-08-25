import 'package:drama_flix/feature/home/data/model/movie_model.dart';
import 'package:drama_flix/feature/home/presentation/widget/big_movie_card.dart';
import 'package:flutter/material.dart';

class PopularMovieCarousel extends StatelessWidget {
  final List<MovieModel> popularMovieList;
  final int carouselIndex;
  final PageController pageController;
  final Function(int) onPageChanged;

  const PopularMovieCarousel({
    super.key,
    required this.popularMovieList,
    required this.carouselIndex,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Phim nổi bật',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20
            ),
          ),
        ),

        const SizedBox(height: 8),
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: pageController,
            itemCount: popularMovieList.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              double scale = 1.0;
              double opacity = 1.0;

              final currentPageValue = carouselIndex.toDouble();
              double distance = (index - currentPageValue).abs();

              scale = 1.0 - (distance * 0.4);
              if (scale < 0.8) scale = 0.8;

              opacity = 1.0 - (distance * 0.3);
              if (opacity < 0.3) opacity = 0.3;

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0,
                ),
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: BigMovieCard(movie: popularMovieList[index]),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
