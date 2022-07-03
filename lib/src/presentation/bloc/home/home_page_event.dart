import 'package:equatable/equatable.dart';

import '../../../core/enum/categories_name.dart';

abstract class HomePageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCuratedLoaded extends HomePageEvent {
  final int page;
  final int perPage;

  GetCuratedLoaded(this.page, this.perPage);
  @override
  List<Object?> get props => [page, perPage];
}

class GetCategoriesLoaded extends HomePageEvent {
  final int page;
  final int perPage;
  final CategoriesName type;

  GetCategoriesLoaded(this.page, this.perPage, this.type);

  @override
  List<Object?> get props => [page, perPage, type];
}

class GetSearchLoaded extends HomePageEvent {
  final String query;
  final int page;
  final int perPage;

  GetSearchLoaded(this.query, this.page, this.perPage);

  @override
  List<Object?> get props => [page, perPage, query];
}
