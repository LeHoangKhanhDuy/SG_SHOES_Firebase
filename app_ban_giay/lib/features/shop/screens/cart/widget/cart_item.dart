import 'package:app_ban_giay/features/shop/screens/cart/widget/add_remove_btn.dart';
import 'package:app_ban_giay/features/shop/screens/cart/widget/cart_menu_icon.dart';
import 'package:app_ban_giay/features/shop/screens/home/product/product_price_text.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,  this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const TCartCounterIcon(),
          if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
    
          if(showAddRemoveButtons)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //Extra space
                  SizedBox(width: 70),
                  //Add nad remove btn
                  ProductQuantityWAddRemoveBtn(),
                ],
              ),                  
              ProductPriceText(price: '2,000,000'),
            ],
          ),
        ],
      ),
    );
  }
}