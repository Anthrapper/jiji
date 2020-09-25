import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiji/ThemeData.dart';

class ItemImages extends StatelessWidget {
  final List<File> images;
  final Function addImageFunction;

  const ItemImages({Key key, this.images, this.addImageFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 81,
            child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => itemImageContainer(
                index < images.length ? images[index] : null,
              ),
              itemCount: max(images.length, 3),
            ),
          ),
          GestureDetector(
            onTap: () => showDialog(
                context: context,
                child: AlertDialog(
                  content: SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        
                          SizedBox(
                            height: 40,
                            width: 200,
                            child: RaisedButton(
                              color: MyThemeData.primaryColor,
                              onPressed: () {
                                addImageFunction(ImageSource.camera);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Camera",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 40,
                            width: 200,
                            child: RaisedButton(
                              color: MyThemeData.primaryColor,
                              onPressed: () {
                                addImageFunction(ImageSource.gallery);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Gallery",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: MyThemeData.primaryColor),
              width: 40,
              height: 100,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget itemImageContainer(File image) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            color: Color.fromRGBO(240, 240, 240, 1),
          ),
          child: image == null
              ? SizedBox()
              : Image.file(
                  image,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    ),
  );
}