import 'package:movieapp/models/movie_model.dart';

abstract class MovieState {}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final List<MovieModel> movies;

  MovieLoadedState(this.movies);
}

class MovieErrorState extends MovieState {
  final String message;

  MovieErrorState(this.message);
}
