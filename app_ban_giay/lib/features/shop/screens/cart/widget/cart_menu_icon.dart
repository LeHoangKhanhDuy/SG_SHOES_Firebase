import 'package:app_ban_giay/features/shop/screens/home/widget/product_title_text.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/slider_image.dart';
import 'package:app_ban_giay/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/image_strings.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        SlideImage(
          imageUrl: TImages.nike1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
    
        //Title, price, size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: ProductTitleText(title: 'Nike Air Force One', maxLines: 1)),
          
              //Loai
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Màu ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Đen ', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: '40', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}