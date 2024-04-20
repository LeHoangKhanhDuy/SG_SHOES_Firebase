import 'package:app_ban_giay/features/shop/screens/home/widget/rounded_container.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/section_heading.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/image_strings.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BillPaymentSection extends StatelessWidget {
  const BillPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(title: 'Phương thức thanh toán', buttonTitle: 'Chọn', onPressed: (){} ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(image: AssetImage(TImages.momoLogo), fit: BoxFit.contain),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text('Momo', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}