import 'package:explore_ease/common/widgets/loader/loader.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:explore_ease/utils/constants/enums.dart';
import 'package:get/get.dart';

import '../../../data/repositories/product/product_repository.dart';

class LandmarkController extends GetxController{
  static LandmarkController get instance => Get.find();

  ///Variables
  final isLoading = false.obs;
  final landmarkRepository = Get.put(LandmarkRepository());
  RxList<LandmarkModel> featuredLandmarks = <LandmarkModel>[].obs;


  @override
  void onInit() {
    fetchFeaturedProducts();

    super.onInit();
  }

  void fetchFeaturedProducts() async{
    try{
      isLoading.value = true;

      final landmarks = await landmarkRepository.getFeaturedLandmarks();

      featuredLandmarks.assignAll(landmarks);

    }catch(e){
      EELoaders.errorSnackBar(title: 'Oh Snap!' , message: e.toString());

    }finally{
      isLoading.value=false;
    }
  }

  String getLandmarkPrice(LandmarkModel landmark) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    //if no variations, return simple price
    if(landmark.productType  == ProductType.single.toString()){
      return (landmark.salePrice>0? landmark.salePrice: landmark.price).toString();
    }else{
      //calculate the smallest and largest prices among variations
      for(var variation in landmark.productVariations!){
        //Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider = variation.salePrice>0.0 ? variation.salePrice:variation.price;

        //Update smallest and largest
        if(priceToConsider < smallestPrice){
          smallestPrice = priceToConsider;
        }
        if(priceToConsider> largestPrice){
          largestPrice=priceToConsider;
        }
      }
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      }else{
        return'$smallestPrice - \u{20B9}$largestPrice';
      }
    }
  }

  String? calculateSalePercentage( double originalPrice, double? salePrice){
    if(salePrice == null || salePrice<=0.0) return null;
    if(originalPrice<=0) return null;

    double percentage =((originalPrice-salePrice)/originalPrice)*100;
    return percentage.toStringAsFixed(0);
  }


}