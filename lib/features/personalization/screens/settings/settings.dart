import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/custom_shape/container/primary_header_container.dart';
import 'package:explore_ease/common/widgets/list%20tiles/settings_menu_tile.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/authentication/screens/login/login.dart';
import 'package:explore_ease/features/shop/screens/cart/cart.dart';
import 'package:explore_ease/features/shop/screens/itineraries/itinerary.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list tiles/user_profile_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            ///header
            EEPrimaryHeaderContainer(
                child: Column(
                  children: [
                    EEAppBar(
                        title: Text('Account',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineMedium!
                                .apply(color: Colors.white))),

                    /// user profile card
                    const EEUserProfileTile(),
                    const SizedBox(height: EESizes.spaceBtwSections),

                  ],
                )),

            ///body
             Padding(
              padding: const EdgeInsets.all(EESizes.defaultSpace),
              child: Column(
                children: [

                  ///Account settings
                  const EESectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: EESizes.spaceBtwItems),

                  EESettingsMenuTile(icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to(()=> const CartScreen()),
                  ),
                  EESettingsMenuTile(icon: Iconsax.bag_tick,
                      title: 'My Itineraries',
                      subTitle: 'Previously made itineraries',
                      onTap: () => Get.to(()=> const ItineraryScreen())
                  ),
                  const EESettingsMenuTile(icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message'),
                  const EESettingsMenuTile(icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts'),

                  /// App settings
                  const SizedBox(height: EESizes.spaceBtwSections),
                  const EESectionHeading(
                    title: 'App Settings', showActionButton: false,),
                  const SizedBox(height: EESizes.spaceBtwItems),
                  const EESettingsMenuTile(icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firebase'),
                  EESettingsMenuTile(icon: Iconsax.location,
                    title: 'GeoLocation',
                    subTitle: 'Set recommendations based on location',
                    trailing:Switch(value: true, onChanged: (value) {})),
                  EESettingsMenuTile(icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subTitle: 'Search result is safe for all ages',
                      trailing:Switch(value: false, onChanged: (value) {})),
                  EESettingsMenuTile(icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be seen',
                      trailing:Switch(value: false, onChanged: (value) {})),
                  const SizedBox(height: EESizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => Get.to(() => const LoginScreen()),child: const Text('logout')),
                  ),
                  const SizedBox(height: EESizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

