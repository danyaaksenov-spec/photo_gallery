// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:photo_gallery/controller/unsplash_api_data_controller.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/screens/fullscreen.dart';

import 'photo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UnsplashDataController unsplashDataController =
      Get.put(UnsplashDataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photos',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white30,
      ),
      body: Obx(
        () => unsplashDataController.isDataLoadCompleted == true
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                //shrinkWrap: true,
                itemCount: unsplashDataController.photos.length,
                itemBuilder: (context, index) {
                  var currentPhoto = unsplashDataController.photos[index];
                  return PhotoListPage(
                    currentPhoto: currentPhoto,
                    press: () {
                      Get.to(() => FullPhoto(photoModel: currentPhoto));
                    },
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
