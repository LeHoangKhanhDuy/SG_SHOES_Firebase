import 'package:app_ban_giay/common/widgets/appbar/appbar.dart';
import 'package:app_ban_giay/common/widgets/product/ratings/rating_bar_indicator.dart';
import 'package:app_ban_giay/features/shop/screens/product_reviews/widget/overall_product_rate.dart';
import 'package:app_ban_giay/features/shop/screens/product_reviews/widget/user_review.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appbar
      appBar: const TAppBar(title: Text('Đánh giá sản phẩm'), showBackArrow: true),

      //BOdy
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text('jkdshfkjshfjksdhfjsdhfskjfhsjkdfhskjdfhskfhsjdk'),
              // const SizedBox(height: TSizes.spaceBtwItems),

              //Xếp hạng đánh giá
              const OverallProductRate(),
              //sao đánh giá
              const TRatingBarIndicator(rating: 4.9),
              Text("", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Người dùng đánh giá
              const UserReview(),
              const UserReview(),
              const UserReview(),
              
            ],
          ),
        ),
      ),
    );
  }
}




