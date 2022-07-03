import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/enum/categories_name.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/photos.dart';
import '../repositories/photos_repositories.dart';

class GetCategoriesPhotos implements UserCase<List<Photos>, Params> {
  final PhotosRepositories repository;

  GetCategoriesPhotos(this.repository);

  @override
  Future<Either<Failure, List<Photos>>> call(params) {
    return repository.getCategoriesPhotos(
      value: params.type,
      page: params.page,
      perPage: params.perPage,
    );
  }
}

class Params extends Equatable {
  final int page;
  final int perPage;
  final CategoriesName type;

  const Params({
    required this.page,
    required this.perPage,
    required this.type,
  });

  @override
  List<Object?> get props => [page, perPage, type];
}
