import 'package:app_ban_giay/common/widgets/brand/brand_showcase.dart';
import 'package:app_ban_giay/features/shop/screens/home/product/gridlayout_product.dart';
import 'package:app_ban_giay/features/shop/screens/home/product/product_card_vertical.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/section_heading.dart';
import 'package:app_ban_giay/utils/constants/image_strings.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //Brand
            const BrandShowCase(images: [TImages.nike1, TImages.nike2]),
      
            //Prooduct
            SectionHeading(title: 'Có thể bạn sẽ thích', onPressed: (){} ),
            const SizedBox(height: TSizes.spaceBtwItems),
      
            GridLayoutProduct(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),
            const SizedBox(height: TSizes.spaceBtwSections,),
          ],
        ),
      ),
      ]
    );
  }
}