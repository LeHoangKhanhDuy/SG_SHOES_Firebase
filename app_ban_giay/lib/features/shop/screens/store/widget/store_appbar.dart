import 'package:app_ban_giay/common/widgets/appbar/appbar.dart';
import 'package:app_ban_giay/common/widgets/icons/cart_menu_icon.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class StoreAppBar extends StatelessWidget {
  const StoreAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.storeAppbarTitle, style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.black)),
        ],
      ),
      actions: [
        CartIcon(onPressed: () {}, iconColor: TColors.black),
      ],
    );
  }
}