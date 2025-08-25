// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _HomeInitial value)?  initial,TResult Function( _HomeLoading value)?  loading,TResult Function( _HomeLoaded value)?  loaded,TResult Function( _HomeError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeInitial() when initial != null:
return initial(_that);case _HomeLoading() when loading != null:
return loading(_that);case _HomeLoaded() when loaded != null:
return loaded(_that);case _HomeError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _HomeInitial value)  initial,required TResult Function( _HomeLoading value)  loading,required TResult Function( _HomeLoaded value)  loaded,required TResult Function( _HomeError value)  error,}){
final _that = this;
switch (_that) {
case _HomeInitial():
return initial(_that);case _HomeLoading():
return loading(_that);case _HomeLoaded():
return loaded(_that);case _HomeError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _HomeInitial value)?  initial,TResult? Function( _HomeLoading value)?  loading,TResult? Function( _HomeLoaded value)?  loaded,TResult? Function( _HomeError value)?  error,}){
final _that = this;
switch (_that) {
case _HomeInitial() when initial != null:
return initial(_that);case _HomeLoading() when loading != null:
return loading(_that);case _HomeLoaded() when loaded != null:
return loaded(_that);case _HomeError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<FilterModel> filterList,  List<MovieModel> popularMovieList,  List<MovieModel> hotTrendingMovieList,  List<MovieModel> hotSearchMovieList,  List<MovieModel> newMovieList,  List<MovieModel> exportMovieList,  List<MovieModel> collectionMovieList,  FilterModel selectedFilter,  int carouselIndex,  bool isLoadingMore)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeInitial() when initial != null:
return initial();case _HomeLoading() when loading != null:
return loading();case _HomeLoaded() when loaded != null:
return loaded(_that.filterList,_that.popularMovieList,_that.hotTrendingMovieList,_that.hotSearchMovieList,_that.newMovieList,_that.exportMovieList,_that.collectionMovieList,_that.selectedFilter,_that.carouselIndex,_that.isLoadingMore);case _HomeError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<FilterModel> filterList,  List<MovieModel> popularMovieList,  List<MovieModel> hotTrendingMovieList,  List<MovieModel> hotSearchMovieList,  List<MovieModel> newMovieList,  List<MovieModel> exportMovieList,  List<MovieModel> collectionMovieList,  FilterModel selectedFilter,  int carouselIndex,  bool isLoadingMore)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _HomeInitial():
return initial();case _HomeLoading():
return loading();case _HomeLoaded():
return loaded(_that.filterList,_that.popularMovieList,_that.hotTrendingMovieList,_that.hotSearchMovieList,_that.newMovieList,_that.exportMovieList,_that.collectionMovieList,_that.selectedFilter,_that.carouselIndex,_that.isLoadingMore);case _HomeError():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<FilterModel> filterList,  List<MovieModel> popularMovieList,  List<MovieModel> hotTrendingMovieList,  List<MovieModel> hotSearchMovieList,  List<MovieModel> newMovieList,  List<MovieModel> exportMovieList,  List<MovieModel> collectionMovieList,  FilterModel selectedFilter,  int carouselIndex,  bool isLoadingMore)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _HomeInitial() when initial != null:
return initial();case _HomeLoading() when loading != null:
return loading();case _HomeLoaded() when loaded != null:
return loaded(_that.filterList,_that.popularMovieList,_that.hotTrendingMovieList,_that.hotSearchMovieList,_that.newMovieList,_that.exportMovieList,_that.collectionMovieList,_that.selectedFilter,_that.carouselIndex,_that.isLoadingMore);case _HomeError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _HomeInitial extends HomeState {
  const _HomeInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initial()';
}


}




/// @nodoc


class _HomeLoading extends HomeState {
  const _HomeLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.loading()';
}


}




/// @nodoc


class _HomeLoaded extends HomeState {
  const _HomeLoaded({required final  List<FilterModel> filterList, required final  List<MovieModel> popularMovieList, required final  List<MovieModel> hotTrendingMovieList, required final  List<MovieModel> hotSearchMovieList, required final  List<MovieModel> newMovieList, required final  List<MovieModel> exportMovieList, required final  List<MovieModel> collectionMovieList, required this.selectedFilter, required this.carouselIndex, this.isLoadingMore = false}): _filterList = filterList,_popularMovieList = popularMovieList,_hotTrendingMovieList = hotTrendingMovieList,_hotSearchMovieList = hotSearchMovieList,_newMovieList = newMovieList,_exportMovieList = exportMovieList,_collectionMovieList = collectionMovieList,super._();
  

 final  List<FilterModel> _filterList;
 List<FilterModel> get filterList {
  if (_filterList is EqualUnmodifiableListView) return _filterList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filterList);
}

 final  List<MovieModel> _popularMovieList;
 List<MovieModel> get popularMovieList {
  if (_popularMovieList is EqualUnmodifiableListView) return _popularMovieList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_popularMovieList);
}

 final  List<MovieModel> _hotTrendingMovieList;
 List<MovieModel> get hotTrendingMovieList {
  if (_hotTrendingMovieList is EqualUnmodifiableListView) return _hotTrendingMovieList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotTrendingMovieList);
}

 final  List<MovieModel> _hotSearchMovieList;
 List<MovieModel> get hotSearchMovieList {
  if (_hotSearchMovieList is EqualUnmodifiableListView) return _hotSearchMovieList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotSearchMovieList);
}

 final  List<MovieModel> _newMovieList;
 List<MovieModel> get newMovieList {
  if (_newMovieList is EqualUnmodifiableListView) return _newMovieList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newMovieList);
}

 final  List<MovieModel> _exportMovieList;
 List<MovieModel> get exportMovieList {
  if (_exportMovieList is EqualUnmodifiableListView) return _exportMovieList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exportMovieList);
}

 final  List<MovieModel> _collectionMovieList;
 List<MovieModel> get collectionMovieList {
  if (_collectionMovieList is EqualUnmodifiableListView) return _collectionMovieList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_collectionMovieList);
}

 final  FilterModel selectedFilter;
 final  int carouselIndex;
@JsonKey() final  bool isLoadingMore;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeLoadedCopyWith<_HomeLoaded> get copyWith => __$HomeLoadedCopyWithImpl<_HomeLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeLoaded&&const DeepCollectionEquality().equals(other._filterList, _filterList)&&const DeepCollectionEquality().equals(other._popularMovieList, _popularMovieList)&&const DeepCollectionEquality().equals(other._hotTrendingMovieList, _hotTrendingMovieList)&&const DeepCollectionEquality().equals(other._hotSearchMovieList, _hotSearchMovieList)&&const DeepCollectionEquality().equals(other._newMovieList, _newMovieList)&&const DeepCollectionEquality().equals(other._exportMovieList, _exportMovieList)&&const DeepCollectionEquality().equals(other._collectionMovieList, _collectionMovieList)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.carouselIndex, carouselIndex) || other.carouselIndex == carouselIndex)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_filterList),const DeepCollectionEquality().hash(_popularMovieList),const DeepCollectionEquality().hash(_hotTrendingMovieList),const DeepCollectionEquality().hash(_hotSearchMovieList),const DeepCollectionEquality().hash(_newMovieList),const DeepCollectionEquality().hash(_exportMovieList),const DeepCollectionEquality().hash(_collectionMovieList),selectedFilter,carouselIndex,isLoadingMore);

@override
String toString() {
  return 'HomeState.loaded(filterList: $filterList, popularMovieList: $popularMovieList, hotTrendingMovieList: $hotTrendingMovieList, hotSearchMovieList: $hotSearchMovieList, newMovieList: $newMovieList, exportMovieList: $exportMovieList, collectionMovieList: $collectionMovieList, selectedFilter: $selectedFilter, carouselIndex: $carouselIndex, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$HomeLoadedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeLoadedCopyWith(_HomeLoaded value, $Res Function(_HomeLoaded) _then) = __$HomeLoadedCopyWithImpl;
@useResult
$Res call({
 List<FilterModel> filterList, List<MovieModel> popularMovieList, List<MovieModel> hotTrendingMovieList, List<MovieModel> hotSearchMovieList, List<MovieModel> newMovieList, List<MovieModel> exportMovieList, List<MovieModel> collectionMovieList, FilterModel selectedFilter, int carouselIndex, bool isLoadingMore
});




}
/// @nodoc
class __$HomeLoadedCopyWithImpl<$Res>
    implements _$HomeLoadedCopyWith<$Res> {
  __$HomeLoadedCopyWithImpl(this._self, this._then);

  final _HomeLoaded _self;
  final $Res Function(_HomeLoaded) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filterList = null,Object? popularMovieList = null,Object? hotTrendingMovieList = null,Object? hotSearchMovieList = null,Object? newMovieList = null,Object? exportMovieList = null,Object? collectionMovieList = null,Object? selectedFilter = null,Object? carouselIndex = null,Object? isLoadingMore = null,}) {
  return _then(_HomeLoaded(
filterList: null == filterList ? _self._filterList : filterList // ignore: cast_nullable_to_non_nullable
as List<FilterModel>,popularMovieList: null == popularMovieList ? _self._popularMovieList : popularMovieList // ignore: cast_nullable_to_non_nullable
as List<MovieModel>,hotTrendingMovieList: null == hotTrendingMovieList ? _self._hotTrendingMovieList : hotTrendingMovieList // ignore: cast_nullable_to_non_nullable
as List<MovieModel>,hotSearchMovieList: null == hotSearchMovieList ? _self._hotSearchMovieList : hotSearchMovieList // ignore: cast_nullable_to_non_nullable
as List<MovieModel>,newMovieList: null == newMovieList ? _self._newMovieList : newMovieList // ignore: cast_nullable_to_non_nullable
as List<MovieModel>,exportMovieList: null == exportMovieList ? _self._exportMovieList : exportMovieList // ignore: cast_nullable_to_non_nullable
as List<MovieModel>,collectionMovieList: null == collectionMovieList ? _self._collectionMovieList : collectionMovieList // ignore: cast_nullable_to_non_nullable
as List<MovieModel>,selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as FilterModel,carouselIndex: null == carouselIndex ? _self.carouselIndex : carouselIndex // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _HomeError extends HomeState {
  const _HomeError(this.message): super._();
  

 final  String message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeErrorCopyWith<_HomeError> get copyWith => __$HomeErrorCopyWithImpl<_HomeError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$HomeErrorCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeErrorCopyWith(_HomeError value, $Res Function(_HomeError) _then) = __$HomeErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$HomeErrorCopyWithImpl<$Res>
    implements _$HomeErrorCopyWith<$Res> {
  __$HomeErrorCopyWithImpl(this._self, this._then);

  final _HomeError _self;
  final $Res Function(_HomeError) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_HomeError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
