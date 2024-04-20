
import 'package:app_ban_giay/features/shop/screens/home/widget/section_heading.dart';
import 'package:app_ban_giay/features/shop/screens/product_detail/widget/bottom_add_tocart.dart';
import 'package:app_ban_giay/features/shop/screens/product_detail/widget/product_atttributes.dart';
import 'package:app_ban_giay/features/shop/screens/product_detail/widget/product_image_slider.dart';
import 'package:app_ban_giay/features/shop/screens/product_detail/widget/product_meta_data.dart';
import 'package:app_ban_giay/features/shop/screens/product_detail/widget/rating_and_share.dart';
import 'package:app_ban_giay/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Product img
            ProductImageSlider(dark: dark),

            //Product detail
            Padding(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  //Rating - Share btn
                  const RatingAndShare(),

                  //Price title stock brand
                  const ProductMetaData(),

                  //Attributes
                  const ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  
                  //Checkout btn
                  // SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Mua hàng'))),
                  // const SizedBox(height: TSizes.spaceBtwSections),

                  //Mô tả
                  const SectionHeading(title: 'Mô tả sản phẩm', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'Xuất hiện lần đầu vào năm 1982, AF-1 là đôi giày bóng rổ đầu tiên sử dụng công nghệ Nike Air, cách mạng hóa môn thể thao này và nhanh chóng được ưa chuộng trên toàn thế giới. Cho đến ngày nay, Air Force 1 vẫn giữ đúng giá trị cốt lõi với bộ đệm êm ái và đàn hồi - chính yếu tố đã làm thay đổi lịch sử giày thể thao.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Xem thêm',
                    trimExpandedText: ' Rút gọn',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //Đánh giá
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(title: 'Đánh giá sản phẩm', showActionButton: false),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18), onPressed: () => Get.to(() => const ProductReviewScreen())),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




