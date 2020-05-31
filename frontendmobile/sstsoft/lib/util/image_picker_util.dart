import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  static Future<ImageModel> imageOptionsDialogBox(BuildContext context) async{
    ImageModel model;
    await showDialog<ImageModel>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                GestureDetector(
                  child: new Text("Tomar foto"),
                  onTap: () async {
                    var image = await ImagePicker.pickImage(
                      source: ImageSource.camera,
                    );
                    Navigator.of(context).pop();

                    model = ImageModel(image, image.path);
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  child: new Text("Seleccionar de la galería"),
                  onTap: () async {
                    var image = await ImagePicker.pickImage(
                      source: ImageSource.gallery,
                    );
                    Navigator.of(context).pop();

                    model = ImageModel(image, image.path);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
    return model;
  }
}

class ImageModel {
  File image;
  String imageName;

  ImageModel(this.image, this.imageName);

  @override
  String toString() {
    return "${image.path}-.-$imageName";
  }
}
