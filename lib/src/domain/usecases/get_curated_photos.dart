import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/photos.dart';
import '../repositories/photos_repositories.dart';

class GetCuratedPhotos implements UserCase<List<Photos>, Param> {
  final PhotosRepositories repository;
  GetCuratedPhotos(this.repository);
  @override
  Future<Either<Failure, List<Photos>>> call(params) {
    return repository.getCuratedPhotos(
        page: params.page, perPage: params.perPage);
  }
}

class Param extends Equatable {
  final int page;
  final int perPage;
  const Param({
    required this.page,
    required this.perPage,
  });

  @override
  List<Object?> get props => [page, perPage];
}
