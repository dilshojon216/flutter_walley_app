import 'package:equatable/equatable.dart';
import 'package:flutter_walley_app/src/domain/entities/photos.dart';

abstract class HomePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomePageStateInitial extends HomePageState {}

class HomePageStateLoading extends HomePageState {}

class HomePageStateLoaded extends HomePageState {
  final List<Photos> photos;

  HomePageStateLoaded(this.photos);
}

class HomePageStateError extends HomePageState {
  final String message;

  HomePageStateError(this.message);
}
