import 'package:explore_ease/features/shop/controllers/Image_controller.dart';
import 'package:get/get.dart';

import '../models/Product_variation_model.dart';
import '../models/product_model.dart';
import 'cart_controller.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();
  ///variables
  RxMap selectedAttributes ={}.obs;
  Rx<ProductVariationModel> selectedVariation =ProductVariationModel.empty().obs;
  ///-- Select Attribute, and Variation
  void onAttributeSelected(LandmarkModel landmark, attributeName, attributeValue) {
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;
    final selectedVariation = landmark.productVariations!.firstWhere((variation) =>
        _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty()
    );
    if(selectedVariation.image.isNotEmpty){
      ImageController.instance.selectedProductImage.value=selectedVariation.image;
    }

    // Show selected variation quantity already in the cart.
    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(landmark.id, selectedVariation.id);
    }

    //Assign selected variation
    this.selectedVariation.value=selectedVariation;
  }

  /// check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes){
    if(variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys){
      if(variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }
  ///Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
  selectedAttributes.clear();
  selectedVariation.value = ProductVariationModel.empty();
  }
}