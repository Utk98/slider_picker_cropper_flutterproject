// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'crop.dart';
// import 'package:image_crop/image_crop.dart';


// import '';
//
// class DestinationCarousel extends StatefulWidget {
//   const DestinationCarousel({Key? key}) : super(key: key);
//
//   @override
//   _DestinationCarouselState createState() => _DestinationCarouselState();
// }
//
//
// class _DestinationCarouselState extends State<DestinationCarousel> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
// import 'package:image_crop/image_crop.dart';
// import 'package:image_crop/image_crop.dart';
// import 'package:projectintern/crop.dart';

class DestinationCarousel extends StatefulWidget {
  // const DestinationCarousel({Key }) : super(key: );
  String imagePath = "";
  final picker = ImagePicker();

  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  String imagePath = "";
  final picker = ImagePicker();
  // var imageFile =
      // await DefaultCacheManager().getSingleFile('https://your_network_image_url');

  final CarouselController _controller = CarouselController();
    int index=1;


  final List<String> images = [
    'assets/images/img.png',
    'assets/images/img_2.png',
  ];




  List<Widget> generateImagesTiles(){
    return images.map((element) =>ClipRRect(
      child: Image.asset(element,
        fit: BoxFit.cover,
      ),
      // borderRadius: BorderRadius.circular(0),
    )).toList();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child : SingleChildScrollView(


      padding: const EdgeInsets.only(top:18),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:18),
              child: CarouselSlider(items: generateImagesTiles(),
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 28/24,

                  )),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.only(top:550,left: 250),
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.blue,child: Icon(Icons.crop),
          //     onPressed: () async {
          //       // File croppedFile = await ImageCropper.cropImage(
          //       //     sourcePath: images(),
          //       // final pickedFile =
          //
          //       await ImageCropper.cropImage(
          //          sourcePath: images.first,
          //           // sourcePath:
          //           aspectRatioPresets: [
          //             CropAspectRatioPreset.square,
          //             CropAspectRatioPreset.ratio3x2,
          //             CropAspectRatioPreset.original,
          //             CropAspectRatioPreset.ratio4x3,
          //             CropAspectRatioPreset.ratio16x9
          //           ],
          //           androidUiSettings: AndroidUiSettings(
          //               toolbarTitle: 'Cropper',
          //               toolbarColor: Colors.deepOrange,
          //               toolbarWidgetColor: Colors.white,
          //               initAspectRatio: CropAspectRatioPreset.original,
          //               lockAspectRatio: false),
          //           iosUiSettings: IOSUiSettings(
          //             minimumAspectRatio: 1.0,
          //           )
          //       );
          //       // if (croppedFile != null){
          //       //   setState(() {
          //       //     imagePath = croppedFile.path;
          //       //   });
          //       // }
          //
          //     },
          //   ),
          //
          //
          // ),

          Padding(
            padding: const EdgeInsets.only(top: 550),
                child: Container(
                 child: Column(
                  children: [
                      Container(
                        padding: EdgeInsets.all(1),
                        width: double.infinity,
                         // child: ElevatedButton(
                         //  style: ButtonStyle(
                         //  backgroundColor:
                         //   MaterialStateProperty.all<Color>(Colors.green.shade700),
                         //   ),
                        child: FloatingActionButton(
                              backgroundColor: Colors.blue,child: Icon(Icons.crop),
                           onPressed: () async {
                            final pickedFile =
                              await picker.getImage(source: );
                            // await ImageCropper.cropImage(
                            //             sourcePath: images.first,
                            // );
                              if (pickedFile != null) {
                             File? croppedFile = await ImageCropper.cropImage(
                             sourcePath: pickedFile.path,
                             aspectRatioPresets: [
                             CropAspectRatioPreset.square,
                             CropAspectRatioPreset.ratio3x2,
                             CropAspectRatioPreset.original,
                             CropAspectRatioPreset.ratio4x3,
                             CropAspectRatioPreset.ratio16x9
                            ],
                              androidUiSettings: AndroidUiSettings(
                              toolbarTitle: 'Cropper',
                              toolbarColor: Colors.green[700],
                              toolbarWidgetColor: Colors.white,
                              activeControlsWidgetColor: Colors.green[700],
                              initAspectRatio: CropAspectRatioPreset.original,
                              lockAspectRatio: false,
                              ),
                              iosUiSettings: IOSUiSettings(
                              minimumAspectRatio: 1.0,
                             ),
                           );
                          if (croppedFile != null){
                            setState(() {
                             imagePath = croppedFile.path;
                            });
                           }
                          }
                         },
                             // child: Text("Select Image"),
                            ),
                           ),
                            imagePath != ""
                              ? Container(
                               padding: EdgeInsets.symmetric(horizontal: 15),
                               child: Image.file(File(imagePath)),
                            )
                                : Container(),
                            ],
                          ),
            ),
          ),
        ],
      ),


    ),
    );
  }
}