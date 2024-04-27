import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/state_model.dart';

class StateRepository extends GetxController{
  static StateRepository get instance => Get.find();


  ///Variables
  final _db = FirebaseFirestore.instance;


  ///Get all Categories
  Future<List<StateModel>> getAllStates()async{
    try{
      final snapshot = await _db.collection('States').get();
      final result = snapshot.docs.map((e) => StateModel.fromSnapshot(e)).toList();
      return result;
    }on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///get states for category
  Future<List<StateModel>> getStatesForCategory(String categoryId)async{
    try{
      QuerySnapshot stateCategoryQuery = await _db.collection('StateCategory').where('categoryId', isEqualTo: categoryId).get();

      List<String> stateIds = stateCategoryQuery.docs.map((doc) => doc['stateId'] as String).toList();
      
      final statesQuery = await _db.collection('States').where(FieldPath.documentId, whereIn: stateIds).limit(2).get();

      List<StateModel> states = statesQuery.docs.map((doc) => StateModel.fromSnapshot(doc)).toList();

      return states;

    }on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}