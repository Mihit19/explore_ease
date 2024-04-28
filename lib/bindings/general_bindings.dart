import 'package:explore_ease/features/shop/controllers/variation_controller.dart';
import 'package:explore_ease/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}