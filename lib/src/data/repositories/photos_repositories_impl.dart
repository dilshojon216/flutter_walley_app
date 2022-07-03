import 'package:dartz/dartz.dart';
import 'package:flutter_walley_app/src/data/datasources/photos_api.dart';
import '../../core/enum/categories_name.dart';
import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/photos.dart';
import '../../domain/repositories/photos_repositories.dart';
import '../models/photos_model.dart';

class PhotosRepositoriesImpl implements PhotosRepositories {
  final PhotosApi photosApi;
  final NetworkInfo networkInfo;

  PhotosRepositoriesImpl({required this.networkInfo, required this.photosApi});

  @override
  Future<Either<Failure, List<Photos>>> getCategoriesPhotos(
      {CategoriesName? value, int? perPage, int? page}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Photos>>> getCuratedPhotos(
      {int? perPage, int? page}) {
    return _getListPhotos(
      photosApi.getCurated(
        perPage: perPage,
        page: page,
      ),
    );
  }

  @override
  Future<Either<Failure, List<Photos>>> getSearchPhotos(
      {int? perPage, int? page, String? query}) {
    throw UnimplementedError();
  }

  Future<Either<Failure, List<Photos>>> _getListPhotos(
      Future<List<PhotosModel>> photos) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await photos;
        return Right(PhotosModel.fromListToPhotos(result));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(ServerFailure("No internet connection"));
    }
  }
}
