import 'package:flutter_architecture/data/network/BaseApiServices.dart';
import 'package:flutter_architecture/data/network/NetApiServices.dart';
import 'package:flutter_architecture/models/movies_list_model.dart';
import 'package:flutter_architecture/resources/App_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetApiServices();
  Future<MoviesListModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.loginEndPoint);
      return response = MoviesListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
