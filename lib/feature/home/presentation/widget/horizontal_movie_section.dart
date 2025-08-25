import 'package:drama_flix/feature/home/data/model/movie_model.dart';
import 'package:drama_flix/feature/home/data/model/movie_section_type.dart';
import 'package:drama_flix/feature/home/presentation/bloc/home_cubit.dart';
import 'package:drama_flix/feature/home/presentation/bloc/home_state.dart';
import 'package:drama_flix/feature/home/presentation/widget/small_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HorizontalMovieSection extends StatelessWidget {
  final String title;
  final MovieSectionType type;

  const HorizontalMovieSection({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, List<MovieModel>>(
      selector: (state) => state.maybeMap(
          loaded: (s) =>  switch (type) {
            MovieSectionType.hotTrending => s.hotTrendingMovieList,
            MovieSectionType.newReleased => s.newMovieList,
            MovieSectionType.hotSearched => s.hotSearchMovieList,
          },
          orElse: () => []
      ),
      builder: (BuildContext context, List<MovieModel> movieList) {
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
      },
    );
  }
}
