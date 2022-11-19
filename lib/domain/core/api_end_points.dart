import 'package:netflix_clone_bloc/core/strings.dart';
import 'package:netflix_clone_bloc/infrastructure/api_key.dart';

class APIEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
}
