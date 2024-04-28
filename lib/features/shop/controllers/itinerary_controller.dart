import 'package:explore_ease/features/shop/models/itinerary_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loader/loader.dart';
import '../../../common/widgets/success_screen/success_screen.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/itinerary/itinerary_repository.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import 'cart_controller.dart';

class ItineraryController extends GetxController {
  static ItineraryController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final orderRepository = Get.put(ItineraryRepository());

// Fetch user's order history
  Future<List<ItineraryModel>> fetchUserItineraries() async {
    try {
      final userItineraries = await orderRepository.fetchUserItinerary();
      return userItineraries;
    } catch (e) {
      EELoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder (double totalAmount) async {
    try {
// Start Loader
      EEFullScreenLoader.openLoadingDialogue(
          'Processing your Plan', EEImage.emptyCart);
// Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId!.isEmpty) return;
// Add Details
      final order = ItineraryModel(
// Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
// Set Date as needed
        items: cartController.cartItems.toList(),
      ); // OrderModel
// Save the order to Firestore
      await orderRepository.saveItinerary(order, userId);
// Update the cart status
      cartController.clearCart();
// Show Success screen
      Get.off(() =>
          SuccessScreen(
            image: EEImage.itinerarySaved,
            title: 'Planning Success!',
            subTitle: 'Hope you have a great time!',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          )); // SuccessScreen
    } catch (e) {
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
    }
  }