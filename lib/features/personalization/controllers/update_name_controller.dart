import 'package:explore_ease/common/widgets/loader/loader.dart';
import 'package:explore_ease/data/repositories/data/user_repository.dart';
import 'package:explore_ease/features/personalization/controllers/user_controller.dart';
import 'package:explore_ease/features/personalization/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../authentication/controllers/signup/network_manager.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  ///init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //start loading
      EEFullScreenLoader.openLoadingDialogue(
          'We are updating your information...', EEImage.processingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EEFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        EEFullScreenLoader.stopLoading();
        return;
      }
      //update users first name and last name
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);
      //update the Rx User Value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove loader
      EEFullScreenLoader.stopLoading();

      //show success message
      EELoaders.successSnackBar(
          title: 'Congratulations', message: 'Your name has been updated.');

      //Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      EEFullScreenLoader.stopLoading();
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
