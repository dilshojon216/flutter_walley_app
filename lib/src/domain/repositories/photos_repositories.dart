import 'package:dartz/dartz.dart';

import '../../core/enum/categories_name.dart';
import '../../core/error/failures.dart';
import '../entities/photos.dart';

abstract class PhotosRepositories {
  Future<Either<Failure, List<Photos>>> getCuratedPhotos(
      {int perPage, int page});

  Future<Either<Failure, List<Photos>>> getSearchPhotos(
      {int perPage, int page, String query});

  Future<Either<Failure, List<Photos>>> getCategoriesPhotos(
      {CategoriesName value, int perPage, int page});
}
