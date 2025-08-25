class MovieModel {
  final String id;
  final String title;
  final String imageUrl;
  final String? genre;
  final int? year;

  MovieModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.genre,
    this.year,
  });
}