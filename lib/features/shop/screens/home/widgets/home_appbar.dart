import 'package:explore_ease/features/personalization/controllers/user_controller.dart';
import 'package:explore_ease/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';


class EEHomeAppBar extends StatelessWidget {
  const EEHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return EEAppBar(title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(EETexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: EEColors.grey)),
        Obx(() {
          if(controller.profileLoading.value){
            return const EEShimmerEffect(width: 80, height: 15);
          }else{
            return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: EEColors.white));
          }
        }),
      ],
    ),
      actions: const [
        EECartCounterIcon(iconColor: EEColors.white,counterBgColor: EEColors.black,counterTextColor: EEColors.white)
      ],
    );
  }
}
