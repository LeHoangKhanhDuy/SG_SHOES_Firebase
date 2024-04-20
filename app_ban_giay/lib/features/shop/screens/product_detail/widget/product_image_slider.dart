import 'package:app_ban_giay/common/widgets/appbar/appbar.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/circulation_icon.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/curved_widget.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/slider_image.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/image_strings.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key, required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return CurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            //Big img
            const SizedBox(
              height: 400,
              child: Padding(
              padding:
                EdgeInsets.all(TSizes.productImageRadius * 2),
              child: Center(
              child: Image(
                image:
                AssetImage(TImages.nike1))),
              )
            ),
    
            //Img slide
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => SlideImage(
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(TSizes.sm),
                    imageUrl: TImages.nike1,
                  ),
                ),
              ),
            ),
    
            //Appbar icon
            const TAppBar(
              showBackArrow: true,
              actions: [
                CirculationIcon(icon: Iconsax.heart5, color: Colors.red)
              ],
            ),
          ],
        ),
      ),
    );
  }
}