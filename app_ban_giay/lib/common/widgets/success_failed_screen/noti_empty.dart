import 'package:app_ban_giay/common/styles/spacing_styles.dart';
import 'package:app_ban_giay/navigation_menu.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/constants/text_strings.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image
              Image(image: const AssetImage('assets/logos/noti.png'), width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              //Title
              Text('Bạn không có thông báo nào', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              // Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              // const SizedBox(height: TSizes.spaceBtwItems,),

              //Btn
              SizedBox(width:  double.infinity, child: ElevatedButton(onPressed: () => Get.offAll(() => const NavigationMenu()) , child: const Text(TTexts.continueSuccess))),
            ],
          ),
        ),
      ),
    );
  }
}