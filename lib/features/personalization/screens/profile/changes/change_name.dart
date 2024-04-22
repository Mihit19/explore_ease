import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/constants/text_strings.dart';
import 'package:explore_ease/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// custom appbar
      appBar: EEAppBar(showBackArrow: true ,title: Text('Change Name',style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(EESizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text('use real name for easy verification. This will appear on several pages.',
            style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: EESizes.spaceBtwSections),

            Form(
              key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => EEValidator.validateEmptyText('First name', value),
                      expands: false,
                      decoration: const InputDecoration(labelText: EETexts.firstName, prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(height: EESizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => EEValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: const InputDecoration(labelText: EETexts.lastName, prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                )
            ),
            const SizedBox(height: EESizes.spaceBtwSections),

            ///save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}
