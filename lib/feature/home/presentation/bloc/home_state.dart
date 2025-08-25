import 'package:drama_flix/feature/home/data/model/filter_model.dart';
import 'package:drama_flix/feature/home/data/model/movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const HomeState._();
  const factory HomeState.initial() = _HomeInitial;
  const factory HomeState.loading() = _HomeLoading;

  const factory HomeState.loaded({
    required List<FilterModel> filterList,
    required List<MovieModel> popularMovieList,
    required List<MovieModel> hotTrendingMovieList,
    required List<MovieModel> hotSearchMovieList,
    required List<MovieModel> newMovieList,
    required List<MovieModel> exportMovieList,
    required List<MovieModel> collectionMovieList,
    required FilterModel selectedFilter,
    required int carouselIndex,
    @Default(false) bool isLoadingMore,
  }) = _HomeLoaded;

  const factory HomeState.error(String message) = _HomeError;
}