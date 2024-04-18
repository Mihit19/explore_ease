import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/images/EE_circular_image.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const EECircularImage(
                        image: EEImage.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
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
                value: 'Mihit Kumar',
                onPressed: () {},
              ),
              EEProfileMenu(
                title: 'Username',
                value: 'Mihit_Kumar',
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
                value: '45678',
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              EEProfileMenu(
                title: 'E-mail',
                value: 'mrmihitkumar@gmail.com',
                onPressed: () {},
              ),
              EEProfileMenu(
                title: 'Phone Number',
                value: '8793960326',
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
                  onPressed: () {},
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
