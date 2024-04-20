import 'package:app_ban_giay/common/widgets/brand/brand_card.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/rounded_container.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key, required this.images,
  });

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          //Brand
          const TBrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems,),
    
          //Top pro
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
          ),
        ],
      ),
    );
  }
}


Widget brandTopProductImageWidget(String image, context){
  return Expanded(
    child: RoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(right: TSizes.sm),
      backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
      child: Image(image: AssetImage(image), fit: BoxFit.contain),
    ),
  );
}