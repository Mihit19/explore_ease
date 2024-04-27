import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_ease/common/widgets/loader/loader.dart';
import 'package:explore_ease/data/repositories/product/product_repository.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class AllLandmarkController extends GetxController{
  static AllLandmarkController get instance => Get.find();

  final repository = LandmarkRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<LandmarkModel> landmarks = <LandmarkModel>[].obs;

  Future<List<LandmarkModel>> fetchLandmarksByQuery(Query? query) async{
    try{
      if(query==null) return [];

      final landmark = await repository.fetchLandmarksByQuery(query);

      return landmark;
    }catch (e){
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return[];
    }
  }

  void sortLandmarks (String sortOption) {
    selectedSortOption.value = sortOption;
    switch (sortOption) {
      case 'Name':
        landmarks.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        landmarks.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        landmarks.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        landmarks.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Sale':
        landmarks.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
// Default sorting option: Name
        landmarks.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignLandmarks (List<LandmarkModel> landmarks) {
// Assign products to the 'products' list
    this.landmarks.assignAll(landmarks);
    sortLandmarks('Name');
  }

}