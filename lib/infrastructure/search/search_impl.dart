import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_bloc/domain/core/api_end_points.dart';
import 'package:netflix_clone_bloc/domain/search/models/search_resp/search_resp.dart';
import 'package:netflix_clone_bloc/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone_bloc/domain/search/search_service.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery}) async {
    try {
      final response = await Dio(BaseOptions()).get(
        APIEndPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
