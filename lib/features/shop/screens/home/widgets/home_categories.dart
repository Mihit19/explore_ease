import 'package:explore_ease/features/shop/controllers/category_controller.dart';
import 'package:explore_ease/features/shop/screens/sub_category/sub_categories.dart';
import 'package:explore_ease/utils/shimmer/category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_texts/image_text.dart';


class EEHomeCategories extends StatelessWidget {
  const EEHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(
      () {
        if(controller.isLoading.value){
          return const EECategoryShimmer();
        }
        if(controller.featuredCategories.isEmpty){
          return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = controller.featuredCategories[index];
              return TVerticalImageText(image: category.image,title: category.name, onTap: ()=> Get.to(()=> const SubCategoriesScreen()),);
            },
          ),
        );
      }
    );
  }
}
