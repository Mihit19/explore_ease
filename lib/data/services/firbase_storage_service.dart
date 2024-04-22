import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EEFirebaseStorageService extends GetxController{
  static EEFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAssets(String path) async{
    try{
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes);
      return imageData;
    }on FirebaseException catch(e) {
      throw 'Firebase Exception: ${e.message}';
    }on PlatformException catch(e){
      throw 'Platform Exception: ${e.message}';
    }on SocketException catch(e){
      throw 'Network Error: ${e.message}';
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<String> uploadImageData(String path ,Uint8List image, String name) async{
    try{
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
  }on FirebaseException catch(e) {
  throw 'Firebase Exception: ${e.message}';
  }on PlatformException catch(e){
  throw 'Platform Exception: ${e.message}';
  }on SocketException catch(e){
  throw 'Network Error: ${e.message}';
  } catch (e) {
  throw 'Something went wrong, Please try again';
  }
  }
}