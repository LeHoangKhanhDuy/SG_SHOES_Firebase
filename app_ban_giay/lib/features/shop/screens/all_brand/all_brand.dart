import 'package:app_ban_giay/common/widgets/appbar/appbar.dart';
import 'package:app_ban_giay/features/shop/screens/all_brand/brand_product.dart';
import 'package:app_ban_giay/features/shop/screens/home/product/gridlayout_product.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/section_heading.dart';
import 'package:app_ban_giay/common/widgets/brand/brand_card.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Danh mục'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              //Heading
              const SectionHeading(title: 'Danh mục giày'),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Brand
              GridLayoutProduct(
                itemCount: 10, 
                mainAxisExtent: 80, 
                itemBuilder: (context, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                )
              ), 
            ],
          ),
        ),
      ),
    );
  }
}