import 'dart:convert';
import 'package:flutter_walley_app/src/data/models/photos_model.dart';
import 'package:http/http.dart' as http;

import '../../config/others/constants.dart';

class PhotosApi {
  Future<List<PhotosModel>> getCurated({int? page, int? perPage}) async {
    try {
      final response = await http.get(
          Uri.parse("${BASEURL_PHOTO}curated?page=$page&per_page=$perPage"),
          headers: {
            "Authorization": AUTH_API_KEY,
          });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(PhotosModel.fromJsonList(data).toString());
        return PhotosModel.fromJsonList(data);
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
