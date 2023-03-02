import 'package:flutter/material.dart';

import '../../../../core/consts/app_consts.dart';
import '../screens/movie_info_screen.dart';
import '../../domain/entities/movie_entity.dart';

class MovieTile extends StatelessWidget {
  final MovieEntity? movieData;
  const MovieTile({super.key, required this.movieData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MovieInfoScreen.routeName, arguments: movieData);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
            footer: Text(
              movieData!.title.toString(),
              textAlign: TextAlign.center,
              style: Styles.labelStyle
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            child: Container(
              foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                    Colors.black87,
                    Colors.black54,
                    Colors.transparent
                  ])),
              child: Image.network(
                movieData!.imageUrl.toString(),
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
