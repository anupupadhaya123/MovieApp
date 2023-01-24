import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/api/api_client.dart';
import 'package:movieapp/logic/movie_cubit/movie_state.dart';
import 'package:movieapp/models/movie_model.dart';

class MovieTrendingCubit extends Cubit<MovieState> {
  MovieTrendingCubit() : super(MovieLoadingState()) {
    fetchTrendingMovies();
  }

  ApiClient apiClient = ApiClient();

  void fetchTrendingMovies() async {
    try {
      List<MovieModel> movies = await apiClient.getTrendingMovies();
      emit(MovieLoadedState(movies));
    } catch (ex) {
      emit(MovieErrorState(ex.toString()));
    }
  }
}
