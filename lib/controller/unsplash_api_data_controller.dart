import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:photo_gallery/model/photo_model.dart';

class UnsplashDataController extends GetxController {
  String accessKey = 'fSeqNvqPXryUrXnrdmy0a8EzpzOqATusAgoO8JIdFjc';
  String secretKey = 'S0xyMgFd5v6vZl87-0R0lVVBsttPGzl9YpQsIll5FVU';

  var isDataLoadCompleted = false.obs;
  var photos = <PhotoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPhotos();
  }

  void loadPhotos() async {
    String urlToAccessApi =
        'https://api.unsplash.com/photos/?client_id=' + accessKey;
    var response = await http.get(Uri.parse(urlToAccessApi));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      photos.value =
          List.from(decodedData).map((e) => PhotoModel.fromMap(e)).toList();
      isDataLoadCompleted.value = true;
    } else {
      Get.snackbar("Error", 'Error during fetch api');
    }
  }
}
