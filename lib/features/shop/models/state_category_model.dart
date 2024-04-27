import 'package:cloud_firestore/cloud_firestore.dart';

class StateCategoryModel{
  final String stateId;
  final String categoryId;

  StateCategoryModel({
    required this.stateId,
    required this.categoryId
});

  Map<String, dynamic> toJson(){
    return{
      'stateId': stateId,
      'categoryId' : categoryId
    };
  }

  factory StateCategoryModel.fromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String,dynamic>;
    return StateCategoryModel(
      stateId: data['stateId'] as String,
      categoryId: data['categoryId'] as String
    );
  }

}