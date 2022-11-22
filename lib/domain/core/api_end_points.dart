import 'package:netflix_clone_bloc/core/strings.dart';
import 'package:netflix_clone_bloc/infrastructure/api_key.dart';

class APIEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey";

  static const hotAndNewMovie = '$kBaseUrl/discover/movie?api_key=$apiKey';
  static const hotAndNewTv = '$kBaseUrl/discover/tv?api_key=$apiKey';
}
