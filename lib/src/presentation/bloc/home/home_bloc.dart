import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_walley_app/src/core/error/failures.dart';
import 'package:flutter_walley_app/src/data/datasources/photos_api.dart';
import 'package:flutter_walley_app/src/data/repositories/photos_repositories_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/usecases/get_categories_photos.dart';

import '../../../domain/usecases/get_curated_photos.dart';
import '../../../domain/usecases/get_search_photos.dart';
import '../home_page_state.dart';
import 'home_page_event.dart';

class HomeBloc extends Bloc<HomePageEvent, HomePageState> {
  GetCategoriesPhotos getCategoriesPhotos =
      GetCategoriesPhotos(PhotosRepositoriesImpl(
          networkInfo: NetworkInfoImpl(
            InternetConnectionChecker(),
          ),
          photosApi: PhotosApi()));
  GetCuratedPhotos getCuratedPhotos = GetCuratedPhotos(
    PhotosRepositoriesImpl(
        networkInfo: NetworkInfoImpl(
          InternetConnectionChecker(),
        ),
        photosApi: PhotosApi()),
  );
  GetSearchPhotos getSearchPhotos = GetSearchPhotos(PhotosRepositoriesImpl(
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
      photosApi: PhotosApi()));

  HomeBloc() : super(HomePageStateInitial()) {
    on<GetCuratedLoaded>(_getCuratedLoaded);
  }

  void _getCuratedLoaded(
      GetCuratedLoaded event, Emitter<HomePageState> emit) async {
    emit(HomePageStateLoading());
    try {
      var data = await getCuratedPhotos
          .call(Param(page: event.page, perPage: event.perPage));

      data.fold((l) {
        if (l is ServerFailure) {
          emit(HomePageStateError(l.message));
        }
      }, (r) {
        emit(HomePageStateLoaded(r));
      });
    } catch (e) {
      emit(HomePageStateError(e.toString()));
    }
  }
}
