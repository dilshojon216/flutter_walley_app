import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/photos.dart';
import '../repositories/photos_repositories.dart';

class GetSearchPhotos implements UserCase<List<Photos>, Params> {
  final PhotosRepositories repository;

  GetSearchPhotos(this.repository);

  @override
  Future<Either<Failure, List<Photos>>> call(params) {
    return repository.getSearchPhotos(
      query: params.query,
      perPage: params.perPage,
      page: params.page,
    );
  }
}

class Params extends Equatable {
  final int page;
  final int perPage;
  final String query;

  const Params({
    required this.page,
    required this.perPage,
    required this.query,
  });

  @override
  List<Object?> get props => [page, perPage, query];
}
