import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../common/color_pallete.dart';

// ignore: must_be_immutable
class ImageInput extends StatefulWidget {
  Function(String img) callback;
  Widget? child;
  ImageInput({required this.callback, this.child});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  bool isLoading = false;
  String? img;

  returnFile(File image) async {
    setState(() {
      isLoading = true;
    });

    // final String path = await Get.find<ApiProvider>().uploadFile(image);
    img = (image.path);
    widget.callback(img!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  initState() {
    super.initState();
  }

  _imgFromCamera() async {
    final selectedimage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    returnFile(File(selectedimage!.path));
  }

  _imgFromGallery() async {
    final selectedimage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    returnFile(File(selectedimage!.path));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showPicker(context);
      },
      child: widget.child ??
          const CircleAvatar(
            radius: 15,
            backgroundColor: ColorPallete.primaryAccent,
            child: Icon(
              Icons.camera_alt,
              size: 20,
              color: ColorPallete.theme,
            ),
          ),
    );
  }
}

class AfterUploadImageView extends StatelessWidget {
  final String fileName;
  final Function()? onRmoveClicked;
  const AfterUploadImageView(
      {super.key, required this.fileName, required this.onRmoveClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          height: 95,
          width: 100,
          decoration: BoxDecoration(
            color: ColorPallete.grey,
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(fileName)),
          ),
        ),
        GestureDetector(
          onTap: onRmoveClicked,
          child: Container(
            height: 20,
            width: 100,
            color: ColorPallete.grey,
            child: const Center(
                child: Text(
              "Remove",
            )),
          ),
        )
      ]),
    );
  }
}
