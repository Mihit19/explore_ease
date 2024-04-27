import 'package:explore_ease/common/widgets/loader/loader.dart';
import 'package:explore_ease/data/repositories/categories/category_repository.dart';
import 'package:explore_ease/features/shop/models/category_model.dart';
import 'package:get/get.dart';

import '../../../data/repositories/product/product_repository.dart';
import '../models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final landmarkRepository = Get.put(LandmarkRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///Load category data
  Future<void> fetchCategories() async {
    try {
      //show loader while loading categories
      isLoading.value = true;
      // fetch categories from data source(firestore, api, etc.)
      final categories = await _categoryRepository.getAllCategories();
      //update the categories list
      allCategories.assignAll(categories);
      //filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(6)
          .toList());
    } catch (e) {
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  ///Load selected category data
  ///Get Category or Sub-Category Products
  Future<List<LandmarkModel>> getCategoryLandmarks({required String categoryId, int limit = 4}) async{
    try{
      final landmarks = await landmarkRepository.getLandmarksForCategory(categoryId: categoryId, limit: limit);
      return landmarks;
    }catch (e){
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
