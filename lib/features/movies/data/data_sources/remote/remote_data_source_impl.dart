import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/consts/app_consts.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../models/movie_model.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<MovieEntity>> getComingSoonMovies() async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://$hostUrl/title/get-coming-soon-movies?homeCountry=US&purchaseCountry=US&currentCountry=US'),
          headers: {
            'X-RapidAPI-Key': dotenv.env['APIKEY'].toString(),
            'X-RapidAPI-Host': hostUrl
          });
      final responseData = json.decode(response.body) as List<dynamic>;
      List<MovieEntity> comingSoonMoviesList = [];
      final extractedData = responseData.take(1).toList();
      for (var item in extractedData) {
        comingSoonMoviesList.add(MovieModel(id: item['id']));
      }
      return comingSoonMoviesList;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://imdb8.p.rapidapi.com/title/get-most-popular-movies?homeCountry=US&purchaseCountry=US&currentCountry=US'),
          headers: {
            'X-RapidAPI-Key': dotenv.env['APIKEY'].toString(),
            'X-RapidAPI-Host': hostUrl
          });
      final responseData = json.decode(response.body) as List<dynamic>;
      List<MovieEntity> popularMoviesList = [];
      final extractedData = responseData.take(1).toList();
      for (var item in extractedData) {
        popularMoviesList.add(MovieModel(id: item));
      }
      return popularMoviesList;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<MovieEntity>> getBestPictureWinners() async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://imdb8.p.rapidapi.com/title/get-best-picture-winners'),
          headers: {
            'X-RapidAPI-Key': dotenv.env['APIKEY'].toString(),
            'X-RapidAPI-Host': hostUrl
          });
      final responseData = json.decode(response.body) as List<dynamic>;
      List<MovieEntity> popularMoviesList = [];
      final extractedData = responseData.take(1).toList();
      print('ex data= $extractedData');
      for (var item in extractedData) {
        popularMoviesList.add(MovieModel(id: item));
      }
      return popularMoviesList;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies() async {
    try {
      final response = await http.get(
          Uri.parse('https://$hostUrl/title/get-top-rated-movies'),
          headers: {
            'X-RapidAPI-Key': dotenv.env['APIKEY'].toString(),
            'X-RapidAPI-Host': hostUrl
          });
      final responseData = json.decode(response.body) as List<dynamic>;
      List<MovieEntity> comingSoonMoviesList = [];
      final extractedData = responseData.take(1).toList();
      for (var item in extractedData) {
        comingSoonMoviesList.add(MovieModel(id: item['id']));
      }
      return comingSoonMoviesList;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<MovieEntity>> getSearchMoviesList(String searchKeyword) async {
    try {
      final response = await http.get(
          Uri.parse('https://$hostUrl/title/find?q=$searchKeyword'),
          headers: {
            'X-RapidAPI-Key': dotenv.env['APIKEY'].toString(),
            'X-RapidAPI-Host': hostUrl
          });

      final responseData = json.decode(response.body);
      final extractedData = responseData['results'];
      List<MovieEntity> searchMovieList = [];
      for (var item in extractedData) {
        searchMovieList.add(MovieModel(
          id: item['id'] ?? '',
          title: item['title'] ?? '',
          imageUrl: item['image']['url'] ?? '',
          releaseDate: item['year'].toString(),
          runningTime: item['runningTimeInMinutes'].toString(),
        ));
      }
      return searchMovieList;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<MovieEntity> findMovieInfoById(String movieId) async {
    final extractedId = extractIdFromMovieId(movieId);
    try {
      final response = await http.get(
          Uri.parse(
              'https://imdb8.p.rapidapi.com/title/get-meta-data?ids=$extractedId&region=US'),
          headers: {
            'X-RapidAPI-Key': dotenv.env['APIKEY'].toString(),
            'X-RapidAPI-Host': hostUrl
          });
      final responseData = json.decode(response.body);
      final extractedData = responseData[extractedId] as Map<String, dynamic>;
      return MovieModel.fromMap(extractedData);
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  String extractIdFromMovieId(String movieId) {
    return movieId.split('/')[2];
  }
}
