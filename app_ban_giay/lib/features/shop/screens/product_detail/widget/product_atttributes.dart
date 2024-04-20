import 'package:app_ban_giay/common/widgets/chip/choice_chip.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/section_heading.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
// import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        //Mô tả sản phẩm
        // RoundedContainer(
        //   padding: const EdgeInsets.all(TSizes.md),
        //   backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
        //   child: const Column(
        //     children: [
        //       //Title
        //       Row(
        //         children: [
        //           SectionHeading(title: 'Thông tin', showActionButton: false),

        //         ],
        //       ),
        //       //variation desciption
        //       ProductTitleText(
        //         title: 'Sự tỏa sáng tiếp tục sống mãi với Nike Air Force 1, biểu tượng bóng rổ mang đến một diện mạo mới cho những gì bạn biết rõ nhất: chất liệu da bóng bẩy, màu sắc táo bạo và độ bóng hoàn hảo giúp bạn nổi bật. Đế platform tinh tế giúp bạn có thêm chiều cao vừa phải.',
        //         smallSize: true,
        //         maxLines: 4,
        //       ),
        //     ],
        //   ),
        // ),
        const SizedBox(height: TSizes.spaceBtwItems),

        //Loại sản phẩm
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Màu sắc', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'Đen', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Trắng', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Đỏ', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: '36', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: '37', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: '38', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: '39', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: '40', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
