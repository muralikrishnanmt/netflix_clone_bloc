import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_bloc/domain/core/api_end_points.dart';
import 'package:netflix_clone_bloc/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone_bloc/domain/hot_and_new_res/hot_and_new_service.dart';
import 'package:netflix_clone_bloc/domain/hot_and_new_res/model/hot_and_new_resp.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplementation implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        APIEndPoints.hotAndNewMovie,
      );
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        APIEndPoints.hotAndNewTv,
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    }
  }
}
