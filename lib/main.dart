import 'package:flutter/material.dart';
import 'package:movies_app/widgets/movie_card_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SizedBox(
              height: 300,
              width: 200,
              child: MovieCardWidget(
                movie: Movie(
                    poster:
                        'https://cdn.prod.website-files.com/687e8d1b96312cc631cafec7/68c48d141e8381607486e3fb_66a4263d01a185d5ea22eeec_6408f6e7b5811271dc883aa8_batman-min.png',
                    title: 'The Batman',
                    rating: '7,8',
                    categories: [
                      'Adventure',
                    ]),
              ),
            ),
          )),
    );
  }
}
