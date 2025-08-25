import 'package:drama_flix/feature/home/data/model/filter_model.dart';
import 'package:drama_flix/feature/home/data/model/movie_model.dart';
import 'package:drama_flix/feature/home/presentation/bloc/home_cubit.dart';
import 'package:drama_flix/feature/home/presentation/bloc/home_state.dart';
import 'package:drama_flix/feature/home/presentation/widget/filter_chips_bar.dart';
import 'package:drama_flix/feature/home/presentation/widget/horizontal_movie_section.dart';
import 'package:drama_flix/feature/home/presentation/widget/popular_movie_carousel.dart';
import 'package:drama_flix/feature/home/presentation/widget/search_bar_hint.dart';
import 'package:drama_flix/feature/home/presentation/widget/shimmer_Movie_Row.dart';
import 'package:drama_flix/feature/home/presentation/widget/shimmer_filter_list.dart';
import 'package:drama_flix/feature/home/presentation/widget/shimmer_loaded_app_bar.dart';
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
          return state.when(
            initial: () => _buildLoadingState(),
            loading: () => _buildLoadingState(),
            loaded:
                (
                  filterList,
                  popularMovieList,
                  hotTrendingMovieList,
                  hotSearchMovieList,
                  newMovieList,
                  exportMovieList,
                  collectionMovieList,
                  selectedFilter,
                  carouselIndex,
                  isLoadingMore,
                ) {
                  return _buildLoadedState(
                    context: context,
                    filterList: filterList,
                    popularMovieList: popularMovieList,
                    hotTrendingMovieList: hotTrendingMovieList,
                    hotSearchMovieList: hotSearchMovieList,
                    newMovieList: newMovieList,
                    exportMovieList: exportMovieList,
                    collectionMovieList: collectionMovieList,
                    selectedFilter: selectedFilter,
                    carouselIndex: carouselIndex,
                  );
                },
            error: (message) => Center(
              child: Text(
                'Lỗi: $message',
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
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

  Widget _buildLoadedState({
    required BuildContext context,
    required List<FilterModel> filterList,
    required List<MovieModel> popularMovieList,
    required List<MovieModel> hotTrendingMovieList,
    required List<MovieModel> hotSearchMovieList,
    required List<MovieModel> newMovieList,
    required List<MovieModel> exportMovieList,
    required List<MovieModel> collectionMovieList,
    required FilterModel selectedFilter,
    required int carouselIndex,
  }) {
    final cubit = context.read<HomeCubit>();
    final appLocalizations = AppLocalizations.of(context);
    return Stack(
      children: [
        CustomScrollView(
          controller: cubit.scrollController,
          slivers: [
            SearchBarHint(color: cubit.appBarColor),
            FilterChipsBar(
              filterList: filterList,
              selectedFilter: selectedFilter,
            ),

            SliverToBoxAdapter(
              child: PopularMovieCarousel(
                popularMovieList: popularMovieList,
                carouselIndex: carouselIndex,
                pageController: cubit.pageController,
                onPageChanged: (index) {
                  context.read<HomeCubit>().updateCarouselIndex(index);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: HorizontalMovieSection(
                title: appLocalizations.hotTrendingMovies,
                movieList: hotTrendingMovieList,
              ),
            ),
            SliverToBoxAdapter(
              child: HorizontalMovieSection(
                title: appLocalizations.newReleasedMovies,
                movieList: newMovieList,
              ),
            ),

            SliverToBoxAdapter(
              child: HorizontalMovieSection(
                title: appLocalizations.mostSearchedMovies,
                movieList: hotSearchMovieList,
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
