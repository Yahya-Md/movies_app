import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_app/core/style/app_colors.dart';

class Movie {
  final String poster;
  final String title;
  final String rating;
  final List<String> categories;

  Movie({
    required this.poster,
    required this.title,
    required this.rating,
    required this.categories,
  });
}

class MovieCardWidget extends StatelessWidget {
  final Movie movie;
  const MovieCardWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              movie.poster,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black87.withValues(alpha: 0.2),
                  Colors.black12.withValues(alpha: 0.2)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 12),
                  child: Column(
                    spacing: 3,
                    children: [
                      Row(
                        children: [
                          Text(
                            movie.title,
                            style: textTheme.bodyLarge?.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Row(
                            spacing: 2,
                            children: [
                              Text(
                                movie.rating,
                                style: textTheme.bodyMedium?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: movie.categories
                            .map((category) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: AppColors.blue,
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      )),
                                  child: Text(
                                    category,
                                    style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
