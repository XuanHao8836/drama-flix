
import 'package:drama_flix/feature/home/data/model/movie_model.dart';
import 'package:flutter/material.dart';

class SmallMovieCard extends StatelessWidget {
  final MovieModel movie;

  const SmallMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            movie.imageUrl,
            width: 100,
            height: 150,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 100,
              height: 150,
              color: Colors.grey,
              child: const Icon(Icons.error_outline, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 100,
          child: Text(
            movie.title,
            style: const TextStyle(fontSize: 12, color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
