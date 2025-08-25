import 'package:drama_flix/feature/home/data/model/movie_model.dart';
import 'package:drama_flix/feature/home/presentation/widget/small_movie_card.dart';
import 'package:flutter/material.dart';

class HorizontalMovieSection extends StatelessWidget {
  final String title;
  final List<MovieModel> movieList;

  const HorizontalMovieSection({
    super.key,
    required this.title,
    required this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16.0 : 8.0,
                  right: index == movieList.length - 1 ? 16.0 : 0,
                ),
                child: SmallMovieCard(movie: movieList[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
