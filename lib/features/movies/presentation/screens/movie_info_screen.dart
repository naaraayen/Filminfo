import 'package:flutter/material.dart';

import '../../../../core/consts/app_consts.dart';
import '../../domain/entities/movie_entity.dart';

class MovieInfoScreen extends StatelessWidget {
  static const routeName = '/MovieInfoScreen';
  const MovieInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieData = ModalRoute.of(context)!.settings.arguments as MovieEntity;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: Styles.pagePadding,
        child: Column(children: [
          SizedBox(
              height: 550,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  movieData.imageUrl!,
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            movieData.title!,
            style: Styles.titleStyle,
          ),
          Text(
            'Released Date: ${movieData.releaseDate}',
            style: Styles.subtitleStyle,
          ),
          Text(
            'Runtime: ${movieData.runningTime} min',
            style: Styles.subtitleStyle,
          ),
        ]),
      )),
    );
  }
}
