

import 'package:cloud_firestore/cloud_firestore.dart';

class StateModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? landmarksCount;

  StateModel(
      {required this.id, required this.image, required this.name, this.isFeatured, this.landmarksCount});

  /// Empty Helper Function
  static StateModel empty() =>
      StateModel(

          id: '', image: '', name: '');

  /// Convert model to Json structure so that you can store data in Firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'LandmarksCount': landmarksCount,
      'IsFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory StateModel.fromJson (Map<String, dynamic> document) {
    final data =document;
    if (data.isEmpty) return StateModel.empty();
    return StateModel(
      id: data['id'] ??'',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      landmarksCount: int.parse((data['LandmarksCount'] ?? 0).toString()),
    );
  }

  factory StateModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() !=null){
      final data = document.data()!;
      return StateModel(
        id: data['id'] ??'',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        landmarksCount: int.parse((data['LandmarksCount'] ?? 0).toString()),
      );
    }else{
      return StateModel.empty();
    }

  }

}