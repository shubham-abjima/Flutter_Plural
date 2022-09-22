import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/data/response/ApiResponse.dart';
import 'package:flutter_architecture/models/movies_list_model.dart';
import 'package:flutter_architecture/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MoviesListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    _myRepo.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
