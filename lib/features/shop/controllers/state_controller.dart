import 'package:explore_ease/common/widgets/loader/loader.dart';
import 'package:explore_ease/data/repositories/product/product_repository.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../../data/repositories/states/state_repository.dart';
import '../models/state_model.dart';

class StateController extends GetxController{
  static StateController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<StateModel> featuredStates = <StateModel>[].obs;
  final RxList<StateModel> allStates = <StateModel>[].obs;
  final stateRepository = Get.put(StateRepository());
  final landmarkRepository = Get.put(LandmarkRepository());

  @override
  void onInit() {
    getFeaturedStates();
    super.onInit();
  }

  ///Load states
  Future<void> getFeaturedStates() async{
    try{
      //show loader while loading states
      isLoading.value=true;

      final states = await stateRepository.getAllStates();

      allStates.assignAll(states);

      featuredStates.assignAll(allStates.where((state) => state.isFeatured ?? false).take(4));


    }catch(e){
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value=false;
    }

  }
  ///get states for category
  Future<List<StateModel>> getStatesForCategory(String categoryId) async{
    try{
      final states = await stateRepository.getStatesForCategory(categoryId);
      return states;
    }catch (e){
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
  ///get state specific products from your data source
  Future<List<LandmarkModel>> getStateLandmarks({required String stateId, int limit = -1}) async{
    try{
      final landmarks = await landmarkRepository.getLandmarksForStates(stateId: stateId, limit: limit);
      return landmarks;
    }catch (e){
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

}