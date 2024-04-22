import 'package:explore_ease/common/widgets/loader/loader.dart';
import 'package:explore_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:explore_ease/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../signup/network_manager.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  ///variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///Send reset password email
  sendPasswordResetEmail()async{
    try {
      //Start loading
      EEFullScreenLoader.openLoadingDialogue('Processing your request', EEImage.processingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EEFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        EEFullScreenLoader.stopLoading();
        return;
      }
      //Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //Remove loader
      EEFullScreenLoader.stopLoading();
      //show success screen
      EELoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

      //Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      //remove loader
      EEFullScreenLoader.stopLoading();
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //Start loading
      EEFullScreenLoader.openLoadingDialogue('Processing your request', EEImage.processingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EEFullScreenLoader.stopLoading();
        return;
      }
      //Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove loader
      EEFullScreenLoader.stopLoading();
      //show success screen
      EELoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

    } catch (e) {
      //remove loader
      EEFullScreenLoader.stopLoading();
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}