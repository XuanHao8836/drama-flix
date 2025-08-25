import 'package:drama_flix/feature/home/data/model/filter_model.dart';
import 'package:drama_flix/feature/home/data/model/movie_model.dart';
import 'package:drama_flix/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCubit extends Cubit<HomeState> {

  final PageController pageController =
  PageController(viewportFraction: 0.7, initialPage: 0);
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<Color> appBarColor = ValueNotifier<Color>(Colors.transparent);

  @override
  Future<void> close() {
    pageController.dispose();
    scrollController.dispose();
    appBarColor.dispose();
    return super.close();
  }

  HomeCubit() : super(const HomeState.initial()){
    scrollController.addListener(() {
      if (scrollController.offset > 50) {
        appBarColor.value = Colors.black;
      } else {
        appBarColor.value = Colors.transparent;
      }
    });
    fetchHomeData();
  }

  final List<MovieModel> _dummyPopularMovies = [
    MovieModel(id: '1', title: 'Yêu Sai Lệch Phi Hành Gia Tái Sinh', imageUrl: 'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg', genre: 'Tình Yêu', year: 2023),
    MovieModel(id: '2', title: 'Khi Tổng Tài Yêu', imageUrl: 'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg', genre: 'Hài Hước', year: 2022),
    MovieModel(id: '3', title: 'Cuộc Trả Thù Của Người Đàn Ông Ngốc', imageUrl: 'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg', genre: 'Hành Động', year: 2024),
    MovieModel(id: '4', title: 'CEO Lạnh Lùng Vợ Bé Lợi Lộc', imageUrl: 'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg', genre: 'Lãng Mạn', year: 2021),
    MovieModel(id: '5', title: 'Be Cưng Giúp Tổng Tài', imageUrl: 'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg', genre: 'Tình Cảm', year: 2023),
    MovieModel(id: '6', title: 'Khách Hàng Đăng Ký', imageUrl: 'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg', genre: 'Hành Động', year: 2022),
    MovieModel(id: '7', title: 'Đứa Anh Hùng', imageUrl: 'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg', genre: 'Hành Động', year: 2024),
  ];

  final List<FilterModel> _dummyFilters = [
    const FilterModel.popular(),
    const FilterModel.newest(),
    const FilterModel.trending(),
    const FilterModel.genre(),
    const FilterModel.language(),
  ];

  Future<void> fetchHomeData() async {
    try {
      emit(HomeState.loading());

      await Future.delayed(const Duration(seconds: 2));

      final List<MovieModel> hotTrending = List.from(_dummyPopularMovies.sublist(3, 7));
      final List<MovieModel> hotSearch = List.from(_dummyPopularMovies.sublist(0, 4).reversed);
      final List<MovieModel> newMovies = List.from(_dummyPopularMovies.sublist(2, 6));
      final List<MovieModel> exportMovies = List.from(_dummyPopularMovies.sublist(1, 5));
      final List<MovieModel> collectionMovies = List.from(_dummyPopularMovies.sublist(0, 3));

      emit(HomeState.loaded(
        filterList: _dummyFilters,
        popularMovieList: _dummyPopularMovies,
        hotTrendingMovieList: hotTrending,
        hotSearchMovieList: hotSearch,
        newMovieList: newMovies,
        exportMovieList: exportMovies,
        collectionMovieList: collectionMovies,
        selectedFilter: const FilterModel.popular(),
        carouselIndex: 0,
      ));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }

  void updateSelectedFilter(FilterModel filter) {
    state.maybeWhen(
      loaded: (filterList, popularMovieList, hotTrendingMovieList, hotSearchMovieList, newMovieList, exportMovieList, collectionMovieList, currentSelectedFilter, carouselIndex, isLoadingMore) {
        emit(HomeState.loaded(
          filterList: filterList,
          popularMovieList: popularMovieList,
          hotTrendingMovieList: hotTrendingMovieList,
          hotSearchMovieList: hotSearchMovieList,
          newMovieList: newMovieList,
          exportMovieList: exportMovieList,
          collectionMovieList: collectionMovieList,
          selectedFilter: filter,
          carouselIndex: carouselIndex,
          isLoadingMore: isLoadingMore,
        ));
      },
      orElse: () {

      },
    );
  }

  void updateCarouselIndex(int index) {
    state.maybeWhen(
      loaded: (filterList, popularMovieList, hotTrendingMovieList, hotSearchMovieList, newMovieList, exportMovieList, collectionMovieList, selectedFilter, currentCarouselIndex, isLoadingMore) {
        if (index != currentCarouselIndex) {
          emit(HomeState.loaded(
            filterList: filterList,
            popularMovieList: popularMovieList,
            hotTrendingMovieList: hotTrendingMovieList,
            hotSearchMovieList: hotSearchMovieList,
            newMovieList: newMovieList,
            exportMovieList: exportMovieList,
            collectionMovieList: collectionMovieList,
            selectedFilter: selectedFilter,
            carouselIndex: index,
            isLoadingMore: isLoadingMore,
          ));
        }
      },
      orElse: () {

      },
    );
  }

  void resetAppBarColor () {
    appBarColor.value = Colors.transparent;
  }
}