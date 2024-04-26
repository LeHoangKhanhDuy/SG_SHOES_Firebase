import 'package:app_ban_giay/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:app_ban_giay/features/authentication/screens/login/login.dart';
import 'package:app_ban_giay/utils/constants/image_strings.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/constants/text_strings.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //Image
                Image(
                    image: const AssetImage(TImages.resetPassword),
                    width: THelperFunctions.screenWidth() * 0.6),
                const SizedBox(height: TSizes.spaceBtwSections),

                //Title
                Text(TTexts.changePassTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(TTexts.changePassSubTitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwSections),

                //Btn
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.offAll(() => const LoginScreen()),
                        child: const Text(TTexts.done))),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                        child: const Text(TTexts.resendEmail))),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),
      ),
    );
  }
}
