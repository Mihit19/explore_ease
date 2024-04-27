import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/constants/enums.dart';
import '../../services/firbase_storage_service.dart';

class LandmarkRepository extends GetxController {
  static LandmarkRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  ///Get limited featured products
  Future<List<LandmarkModel>> getFeaturedLandmarks() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => LandmarkModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<LandmarkModel>> getAllFeaturedLandmarks() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => LandmarkModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<LandmarkModel>> fetchLandmarksByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<LandmarkModel> landmarkList = querySnapshot.docs
          .map((doc) => LandmarkModel.fromQuerySnapshot(doc))
          .toList();
      return landmarkList;
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<LandmarkModel>> getLandmarksForStates(
      {required String stateId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: stateId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: stateId)
              .limit(limit)
              .get();
      final landmarks = querySnapshot.docs.map((doc) => LandmarkModel.fromSnapshot(doc)).toList();
      return landmarks;
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<LandmarkModel>> getLandmarksForCategory({required String categoryId, int limit = 4}) async {
    try {
      QuerySnapshot productCategoryQuery= limit == -1
          ? await _db
          .collection('ProductCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get()
          : await _db
          .collection('ProductCategory')
          .where('categoryId', isEqualTo: categoryId)
          .limit(limit)
          .get();

      List<String> landmarkIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      final landmarkQuery = await _db.collection('Products').where(FieldPath.documentId,whereIn: landmarkIds).get();
      List<LandmarkModel> landmarks = landmarkQuery.docs.map((doc) => LandmarkModel.fromSnapshot(doc)).toList();
      return landmarks;
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<LandmarkModel> products) async {
    try {
// Upload all the products along with their images.
      final storage = Get.put(EEFirebaseStorageService());
// Loop through each product
      for (var product in products) {
// Get image data link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);
// Upload image and get its URL
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());
// Assign URL to product.thumbnail attribute
        product.thumbnail = url;
// Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
// Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);
// Assign URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }
// Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
// Get image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);
// Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);
// Assign URL to variation.image attribute
            variation.image = url;
          }
        }
// Store product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
