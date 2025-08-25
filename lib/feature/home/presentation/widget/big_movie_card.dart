
import 'package:drama_flix/feature/home/data/model/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigMovieCard extends StatelessWidget {
  final MovieModel movie;

  const BigMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Ảnh nền
          Positioned.fill(
            child: Image.network(
              movie.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.movie, size: 50, color: Colors.grey),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.black.withOpacity(0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 6, color: Colors.black)],
                    ),
                  ),
                  if (movie.genre != null || movie.year != null)
                    Text(
                      '${movie.genre ?? ''} ${movie.year != null ? '(${movie.year})' : ''}'
                          .trim(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
