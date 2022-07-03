import 'package:flutter_walley_app/src/data/models/src_model.dart';
import 'package:flutter_walley_app/src/domain/entities/photos.dart';

import '../../domain/entities/src.dart';

class PhotosModel extends Photos {
  const PhotosModel({
    required int id,
    required int width,
    required int height,
    required String url,
    required String photographer,
    required String photographerUrl,
    required int photographerId,
    required String avgColor,
    required String alt,
    required Src src,
  }) : super(
          id: id,
          width: width,
          height: height,
          url: url,
          photographer: photographer,
          photographerUrl: photographerUrl,
          photographerId: photographerId,
          avgColor: avgColor,
          alt: alt,
          src: src,
        );

  factory PhotosModel.fromJson(Map<String, dynamic> json) {
    return PhotosModel(
        id: json['id'],
        width: json['width'],
        height: json['height'],
        url: json['url'],
        photographer: json['photographer'],
        photographerUrl: json['photographer_url'],
        photographerId: json['photographer_id'],
        avgColor: json['avg_color'],
        alt: json['alt'],
        src: SrcModel.fromSrc(SrcModel.fromJson(json['src'])));
  }

  static List<PhotosModel> fromJsonList(Map<String, dynamic> jsonList) {
    List<PhotosModel> photos = [];
    jsonList['photos'].forEach((value) {
      photos.add(PhotosModel.fromJson(value));
    });
    return photos;
  }

  static List<Photos> fromListToPhotos(List<PhotosModel> list) {
    // print(list);
    return list
        .map((er) => Photos(
              id: er.id,
              width: er.width,
              height: er.height,
              url: er.url,
              photographer: er.photographer,
              photographerUrl: er.photographerUrl,
              alt: er.alt,
              avgColor: er.avgColor,
              photographerId: er.photographerId,
              src: er.src,
            ))
        .toList();
  }
}
