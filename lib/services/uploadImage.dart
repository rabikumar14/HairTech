import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';


Future<String> uploadNewImage(String imageFile) async {
      //Check Permissions
      await Permission.photos.request();

      var permissionStatus = await Permission.photos.status;

      if (permissionStatus.isGranted) {
        //Select Image
        var file = File(imageFile);

        if (imageFile != null) {
          //Upload to Firebase
          var snapshot = await FirebaseStorage.instance
              .ref()
              .child('folderNames/' +
                  imageFile.substring(imageFile.lastIndexOf('/')))
              .putFile(file)
              .whenComplete(() => null);

          var downloadUrl = await snapshot.ref.getDownloadURL();

          return downloadUrl;
        } else {

          
          
          print('No Path Received');
        }
      } else {
        print('Grant Permissions and try again');
      }
    }