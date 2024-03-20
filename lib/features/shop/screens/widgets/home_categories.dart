import 'package:flutter/material.dart';
import '../../../../common/widgets/image_texts/image_text.dart';
import '../../../../utils/constants/image_strings.dart';

class EEHomeCategories extends StatelessWidget {
  const EEHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(image: EEImage.hotel,title: 'Hotels', onTap: (){},);
        },
      ),
    );
  }
}
