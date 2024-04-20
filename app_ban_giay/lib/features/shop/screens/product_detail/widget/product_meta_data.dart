import 'package:app_ban_giay/features/shop/screens/home/product/product_price_text.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/product_title_text.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/rounded_container.dart';
import 'package:app_ban_giay/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:app_ban_giay/common/widgets/images/circular_image.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/enum.dart';
import 'package:app_ban_giay/utils/constants/image_strings.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //Price sale price
        Row(
          children: [
            //Price
            const ProductPriceText(price: '1,800,000', isLarge: true),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('2,000,000đ', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),

            //Sale tag
              RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('10%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //Title
        const ProductTitleText(title: 'Nike Air Force One', ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //Stock
        Row(
          children: [
            const ProductTitleText(title: 'Kho:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('Còn hàng', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //Brand
        Row(
          children: [
            CircularImage(
              image: TImages.nikeIcon, 
              width: 32, 
              height: 32, 
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            const BrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}