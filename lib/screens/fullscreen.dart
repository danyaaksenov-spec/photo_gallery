import 'package:flutter/material.dart';
import 'package:photo_gallery/model/photo_model.dart';

class FullPhoto extends StatelessWidget {
  const FullPhoto({Key? key, required this.photoModel}) : super(key: key);

  final PhotoModel photoModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text('View full photo'),
          elevation: 0,
          backgroundColor: Color(
              int.parse('0xff${photoModel.color.replaceFirst("#", "")}'))),
      body: Container(
        //width: double.infinity,
        height: size.height,
        child: Image.network(
          photoModel.urls['small'],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
