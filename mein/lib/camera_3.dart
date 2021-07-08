import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mein/bottomnavigationbar.dart';
import 'dart:async';

import 'package:edge_detection/edge_detection.dart';

import 'package:mein/file_picker_service.dart';
import 'package:mein/ml_service.dart';


//Make sure to await the call to detectEdge.


class Camera_3 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//사진 찍기

class _MyHomePageState extends State<Camera_3> {
  String _imagePath;

  @override
  void initState() {
    super.initState();
  }
  File _image;
  PickedFile _image_2;
  final picker = ImagePicker();

  MLService _mlService = MLService();
  FilePickerService _filePickerService = FilePickerService();

  Widget LoadingImage(Uint8List imageData) {
    return Image.memory(imageData);
  }

  Future<void> getImage() async {
    String imagePath = await EdgeDetection.detectEdge;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      imagePath = (await EdgeDetection.detectEdge);
      print("$imagePath");
    } on PlatformException {
      imagePath = 'Failed to get cropped image path.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _imagePath = imagePath;
    });
  }
/*
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        //return imageData;
      } else {
        print('No image selected.');
      }
    });
    final imageData = await _filePickerService.imageFilePickAsBytes(_image);
    final ImageJSONData = await _mlService.convertImage(imageData);
  }
  */

/*
  Future getGallery() async {
    final PickedFile image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image_2 = image;
    });
  }
  */

  Future getGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Take a Picture or Select a Photo');
      }
    });
    final imageData = await _filePickerService.imageFilePickAsBytes(_image);
    final ImageJSONData = await _mlService.convertImage(imageData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Center(
              child: ElevatedButton(
                onPressed: getImage,
                child: Text('Scan'),
              ),
            ),
            SizedBox(height: 20),
            Text('Cropped image path:'),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
              child: Text(
                '$_imagePath\n',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        /*
        children: <Widget>[
          Container(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image)),
          Container(
            child: _image_2 == null
                ? Text('No image')
                : Image.file(File(_image_2.path)))
      ]
      *//*
        child: _image == null
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Take a Picture',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'or',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Select a Photo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  textAlign: TextAlign.center,
                )
              ])
            : Image.file(_image),
        //child: _image_2 == null ? Text('No image'): Image.file(File(_image_2.path)),
       
       */ //_image == null ? Text('No image selected.') : Image.file(_image),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: "btn1",
                onPressed: getImage,
                child: Icon(Icons.camera_alt),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: "btn2",
              onPressed: getGallery,
              child: Icon(Icons.add_photo_alternate),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(currentTab: 0),
    );
  }
}
