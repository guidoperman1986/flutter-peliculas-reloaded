import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/search/search_delegate.dart';
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CardSwiper(
            movies: moviesProvider.onDisplayMovies,
            error: moviesProvider.nowPlayingError,
          ),
          MovieSlider(
            popularMovies: moviesProvider.popularMovies,
            title: 'Populares!!!',
            onNextPage: () => moviesProvider.getPopularMovies(),
          )
        ],
      )),
    );
  }
}
