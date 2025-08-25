import 'package:drama_flix/feature/home/data/model/movie_section_type.dart';
import 'package:drama_flix/feature/home/presentation/bloc/home_cubit.dart';
import 'package:drama_flix/feature/home/presentation/bloc/home_state.dart';
import 'package:drama_flix/feature/home/presentation/widget/filter_chips_bar.dart';
import 'package:drama_flix/feature/home/presentation/widget/horizontal_movie_section.dart';
import 'package:drama_flix/feature/home/presentation/widget/popular_movie_carousel.dart';
import 'package:drama_flix/feature/home/presentation/widget/search_bar_hint.dart';
import 'package:drama_flix/feature/home/presentation/widget/shimmer_filter_list.dart';
import 'package:drama_flix/feature/home/presentation/widget/shimmer_loaded_app_bar.dart';
import 'package:drama_flix/feature/home/presentation/widget/shimmer_movie_row.dart';
import 'package:drama_flix/feature/home/presentation/widget/shimmer_popular_movie_carousel.dart';
import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          context.read<HomeCubit>().resetAppBarColor();
          return state.maybeMap(
            loaded: (s) {
              return _buildLoadedState(context: context);
            },
            error: (message) => Center(
              child: Text(
                'Lỗi: $message',
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
            orElse: () => _buildLoadingState(),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ShimmerLoadedAppBar(),
          const ShimmerFilterList(),
          const ShimmerPopularMovieCarousel(),
          const ShimmerMovieRow(),
          const ShimmerMovieRow(),
        ],
      ),
    );
  }

  Widget _buildLoadedState({required BuildContext context}) {
    final cubit = context.read<HomeCubit>();
    final appLocalizations = AppLocalizations.of(context);
    return Stack(
      children: [
        CustomScrollView(
          controller: cubit.scrollController,
          slivers: [
            SearchBarHint(color: cubit.appBarColor),
            FilterChipsBar(),

            SliverToBoxAdapter(
              child: PopularMovieCarousel(
                pageController: cubit.pageController,
                onPageChanged: (index) {
                  context.read<HomeCubit>().updateCarouselIndex(index);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: HorizontalMovieSection(
                title: appLocalizations.hotTrendingMovies,
                type: MovieSectionType.hotTrending,
              ),
            ),
            SliverToBoxAdapter(
              child: HorizontalMovieSection(
                title: appLocalizations.newReleasedMovies,
                type: MovieSectionType.newReleased,
              ),
            ),

            SliverToBoxAdapter(
              child: HorizontalMovieSection(
                title: appLocalizations.mostSearchedMovies,
                type: MovieSectionType.hotSearched,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: kBottomNavigationBarHeight + 50),
            ),
          ],
        ),
      ],
    );
  }
}
