import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillAmountSection extends StatelessWidget {
  const BillAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //Sub
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng sản phẩm', style: Theme.of(context).textTheme.bodyMedium),
            Text('4,000,000đ', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Sub
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Phí giao hàng', style: Theme.of(context).textTheme.bodyMedium),
            Text('20,000đ', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Sub
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng thanh toán', style: Theme.of(context).textTheme.bodyMedium),
            Text('4,020,000đ', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],   
    );
  }
}