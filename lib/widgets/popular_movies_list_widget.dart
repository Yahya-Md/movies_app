import 'package:flutter/material.dart';
import 'package:movies_app/widgets/movie_card_widget.dart';

class PopularMoviesListAnimation with ChangeNotifier {
  final PageController controller;
  double _offset = 0;

  PopularMoviesListAnimation({required this.controller}) {
    controller.addListener(_listener);
  }

  void _listener() {
    if (!controller.hasClients) return;
    _offset = controller.page ?? controller.initialPage.toDouble();
    notifyListeners();
  }

  double get offset => _offset;

  @override
  void dispose() {
    controller.removeListener(_listener);
    super.dispose();
  }
}

class PopularMoviesListWidget extends StatefulWidget {
  final List<Movie> movies;
  final void Function(int) onMovieCardTap;
  const PopularMoviesListWidget({
    super.key,
    required this.onMovieCardTap,
    required this.movies,
  });

  @override
  State<PopularMoviesListWidget> createState() =>
      _PopularMoviesListWidgetState();
}

class _PopularMoviesListWidgetState extends State<PopularMoviesListWidget> {
  late final PageController controller;
  late final PopularMoviesListAnimation animation;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1, viewportFraction: 0.6);
    animation = PopularMoviesListAnimation(controller: controller);
  }

  @override
  void dispose() {
    animation.dispose();
    controller.dispose();
    super.dispose();
  }

  List<Movie> get movies => widget.movies;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return PageView.builder(
          controller: controller,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            double page = controller.page ?? controller.initialPage.toDouble();
            double scale = (1 - ((page - index).abs() * 0.2)).clamp(0.7, 1.0);
            double angle = -(page - index) * 0.15;
            double translateY = (page - index).abs() * 20;

            return Transform.translate(
              offset: Offset(0, translateY),
              child: Transform.rotate(
                angle: angle,
                child: Transform.scale(
                  scale: scale,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: MovieCardWidget(
                      onMovieCardTap: () => widget.onMovieCardTap(movie.id),
                      movie: movie,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/*
Movie(
                        id: 100,
                        poster:
                            "https://image.tmdb.org/t/p/w300/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
                        title: "The Super Mario Bros. Movie",
                        rating: "7.5",
                        categories: ["categories"],
                      ),
                      */
