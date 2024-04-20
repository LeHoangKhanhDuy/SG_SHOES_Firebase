import 'package:app_ban_giay/common/widgets/product/ratings/rating_bar_indicator.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/rounded_container.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/image_strings.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReview extends StatelessWidget {
  const UserReview({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.user)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('Lê Hoàng Khánh Duy', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        //Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4.5),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('23/03/2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
          'asiudhausdhkajsdhjkadhjkashdjkasdhdshkjahsdjkahsdjkahskjdhajksdhkjashdkjashdkjasdhakjsdhajksdhajksdhajkshdkajsdhkjdasdasdasdasdasdasdasdasdasdad',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Xem thêm',
          trimCollapsedText: ' Rút gọn',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        //Company review
        RoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SG Shoes", style: Theme.of(context).textTheme.titleMedium),
                    Text('23/03/2024', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText(
                  'SG Shoes cảm ơn Bạn đã giành thời gian đánh giá cho Shop. Shop cung cấp các sản phẩm giày thể thao với đa dạng mẫu mã phù hợp với mọi lứa tuổi. Hy vọng SG Shoes sẽ luôn là lựa chọn hàng đầu của Bạn trang thời gian tới.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Xem thêm',
                  trimCollapsedText: ' Rút gọn',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
      ],
    );
  }
}