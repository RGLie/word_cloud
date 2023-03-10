import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageColor extends StatefulWidget {
  const ImageColor({super.key});

  @override
  State<ImageColor> createState() => _ImageColorState();
}

class _ImageColorState extends State<ImageColor> {
  late File imageFile;
  PickedFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extract Colors in Image"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              _getFromGallery();
            },
            child: Icon(Icons.image),
          ),
          Container(
            child: _image == null
                ? Text('No image')
                : Image.file(File(_image!.path)),
          ),
        ],
      ),
    );
  }

  Future _getFromGallery() async {
    // PickedFile? pickedFile = await ImagePicker().getImage(
    //   source: ImageSource.gallery,
    //   maxWidth: 1800,
    //   maxHeight: 1800,
    // );
    // if (pickedFile != null) {
    //   setState(() {
    //     imageFile = File(pickedFile.path);
    //   });
    // }
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image!;
    });
  }
}
