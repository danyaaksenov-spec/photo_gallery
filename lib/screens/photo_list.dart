import 'package:flutter/material.dart';

import '../model/photo_model.dart';

class PhotoListPage extends StatelessWidget {
  const PhotoListPage({
    Key? key,
    required this.currentPhoto,
    required this.press,
  }) : super(key: key);

  final PhotoModel currentPhoto;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: ListTile(
        leading:
            Image.network(currentPhoto.urls['small'], width: 60, height: 60),
        title: Text(currentPhoto.id),
        trailing: Text(currentPhoto.color),
      ),
    );
  }
}
