import 'package:app_ban_giay/features/shop/screens/home/product/gridlayout_product.dart';
import 'package:app_ban_giay/features/shop/screens/home/product/product_card_vertical.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.filter)),
          onChanged: (value) {},
          items: ['Danh mục', 'Giá cao nhất', 'Giá thấp nhất', 'Giảm giá', 'Mới nhất', 'Phổ biến']
          .map((option) => DropdownMenuItem(value: option, child: Text(option)))
          .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
    
        //Prooduct
        GridLayoutProduct(
          itemCount: 4,
          itemBuilder: (_, index) => const ProductCardVertical(),
        ),
      ],
    );
  }
}