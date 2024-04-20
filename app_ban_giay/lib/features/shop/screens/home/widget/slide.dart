import 'package:app_ban_giay/features/shop/controllers/home_controller.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/circular_container.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/slider_image.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TSlider extends StatelessWidget {
  const TSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(viewportFraction: 1, onPageChanged: (index, _) => controllers.updatePageIndicator(index)),
          items: banners.map((url) => SlideImage(imageUrl: url, backgroundColor: null,)).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
    
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i < banners.length; i++)
                CircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controllers.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey,
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}