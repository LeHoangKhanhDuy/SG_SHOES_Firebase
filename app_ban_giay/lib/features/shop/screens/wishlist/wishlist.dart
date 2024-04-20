import 'package:app_ban_giay/common/widgets/appbar/appbar.dart';
import 'package:app_ban_giay/features/shop/screens/home/home.dart';
import 'package:app_ban_giay/features/shop/screens/home/product/gridlayout_product.dart';
import 'package:app_ban_giay/features/shop/screens/home/product/product_card_vertical.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/circulation_icon.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Yêu thích', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CirculationIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              GridLayoutProduct(itemCount: 6, itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}