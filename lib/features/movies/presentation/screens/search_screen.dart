import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/consts/app_consts.dart';
import '../components/movie_tile.dart';
import '../cubit/movie_cubit.dart';


class SearchScreen extends StatefulWidget {
  static const routeName = '/SearchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchMovieController = TextEditingController();
  bool isSearched = false;

  void submitSearch() {
    isSearched = false;
    String searchText = searchMovieController.text;
    if (searchText.isEmpty) {
      // TODO: validate
      return;
    }

    FocusScope.of(context).unfocus();

    context.read<MovieCubit>().fetchSearchMovie(searchText);
    setState(() {
      isSearched = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 4,
        automaticallyImplyLeading: false,
        elevation: 1.0,
        title: TextField(
          autofocus: true,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0)),
            focusColor: Colors.black,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          controller: searchMovieController,
        ),
        actions: [
          IconButton(
              onPressed: submitSearch,
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: Styles.pagePadding,
        child: isSearched
            ? BlocBuilder<MovieCubit, MovieState>(
                builder: (context, state) {
                  if (state is MovieFetchingError) {
                    return const Center(
                      child: Text('Something Went Wrong'),
                    );
                  }
                  if (state is MovieFetched) {
                    return ListView.builder(
                        itemCount: state.moviesList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Container(
                              height: 300,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: MovieTile(movieData: state.moviesList[index])
                            ),
                          );
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            : const SizedBox(),
      ),
    );
  }
}
