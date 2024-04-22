import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/images/EE_circular_image.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/personalization/controllers/user_controller.dart';
import 'package:explore_ease/features/personalization/screens/profile/changes/change_name.dart';
import 'package:explore_ease/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: EEAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      ///body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              /// Profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : EEImage.user;
                      return controller.imageUploading.value
                          ? const EEShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : EECircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              ///Details
              const SizedBox(
                height: EESizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(height: EESizes.spaceBtwItems),
              const EESectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: EESizes.spaceBtwItems),

              EEProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              EEProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () {},
              ),

              const SizedBox(
                height: EESizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(height: EESizes.spaceBtwItems),
              const EESectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: EESizes.spaceBtwItems),
              EEProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              EEProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              EEProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              EEProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              EEProfileMenu(
                title: 'Date of Birth',
                value: '19 Jun, 2003',
                onPressed: () {},
              ),

              const Divider(),
              const SizedBox(height: EESizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Close Account',
                      style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
