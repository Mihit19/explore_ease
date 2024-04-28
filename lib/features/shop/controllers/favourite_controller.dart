import 'dart:convert';

import 'package:explore_ease/common/widgets/loader/loader.dart';
import 'package:explore_ease/data/repositories/product/product_repository.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:explore_ease/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController{
  static FavouriteController get instance => Get.find();

  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourite();
  }

  //Method to initialize favourites by reading from storage
  void initFavourite(){
    final json = EELocalStorage.instance().readData('favourites');

    if(json != null){
      final storedFavourites = jsonDecode(json) as Map <String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String landmarkId){
    return favourites[landmarkId] ?? false;
  }

  void toggleFavouriteLandmark(String landmarkId){
    if(!favourites.containsKey(landmarkId)){
      favourites[landmarkId] = true;
      saveFavouritesToStorage();
      EELoaders.customToast(message: 'Landmark has been added to the Wishlist.');
    }else{
      EELocalStorage.instance().removeData(landmarkId);
      favourites.remove(landmarkId);
      saveFavouritesToStorage();
      favourites.refresh();
      EELoaders.customToast(message: 'Landmark has been removed from the Wishlist');
    }
  }

  void saveFavouritesToStorage(){
    final encodedFavourites = json.encode(favourites);
    EELocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<LandmarkModel>> favouriteLandmarks() async{
    return await LandmarkRepository.instance.getFavouriteLandmarks(favourites.keys.toList());
  }
}