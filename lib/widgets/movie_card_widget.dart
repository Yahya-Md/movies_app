import 'dart:ui';
import 'package:flutter/material.dart';

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
                    colors: [Colors.black87, Colors.black12],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ClipRRect(
              child: BackdropFilter(
                enabled: false,
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            movie.title,
                            style: textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Row(
                            spacing: 2,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                movie.rating,
                                style: textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: movie.categories
                            .map((category) => Chip(
                                  label: Text(category),
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
