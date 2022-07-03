import 'package:equatable/equatable.dart';
import './src.dart';

class Photos extends Equatable {
  final int? id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final Src src;
  final String alt;

  const Photos(
      {required this.id,
      required this.width,
      required this.height,
      required this.url,
      required this.photographer,
      required this.photographerUrl,
      required this.photographerId,
      required this.avgColor,
      required this.src,
      required this.alt});

  @override
  List<Object?> get props =>
      [id, width, height, url, photographer, photographerUrl, src, alt];
}
