import 'package:app_ban_giay/common/widgets/appbar/appbar.dart';
import 'package:app_ban_giay/common/widgets/icons/cart_menu_icon.dart';
import 'package:app_ban_giay/features/personalization/controllers/user_controller.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/simmer.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                //Load tu tu
                return const TShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        CartIcon(onPressed: () {}, iconColor: TColors.white),
      ],
    );
  }
}
