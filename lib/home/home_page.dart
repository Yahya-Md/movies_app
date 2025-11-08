import 'package:flutter/material.dart';
import 'package:movies_app/core/style/app_colors.dart';
import 'package:movies_app/widgets/movie_card_widget.dart';
import 'package:movies_app/widgets/popular_movies_list_widget.dart';
import 'package:movies_app/widgets/section_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SectionHeaderWidget(
                  rightTitle: 'View all',
                  leftTitle: 'Popular',
                  onTapRightButton: () {
                    // TODO: Add as dependency
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 350,
                child: PopularMoviesListWidget(
                  onMovieCardTap: (id) {
                    print(id);
                  },
                  movies: [
                    Movie(
                      id: 100,
                      poster:
                          "https://image.tmdb.org/t/p/w300/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
                      title: "The Super Mario Bros. Movie",
                      rating: "7.5",
                      categories: ["categories"],
                    ),
                    Movie(
                      id: 101,
                      poster:
                          "https://image.tmdb.org/t/p/w300/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
                      title: "The Super Mario Bros. Movie",
                      rating: "7.5",
                      categories: ["categories"],
                    ),
                    Movie(
                      id: 102,
                      poster:
                          "https://image.tmdb.org/t/p/w300/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
                      title: "The Super Mario Bros. Movie",
                      rating: "7.5",
                      categories: ["categories"],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SectionHeaderWidget(
                  rightTitle: 'View all',
                  leftTitle: 'New',
                  onTapRightButton: () {
                    // TODO: Add as dependency
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
