import 'package:app_ban_giay/common/widgets/success_failed_screen/success_screen.dart';
import 'package:app_ban_giay/features/authentication/screens/login/login.dart';
import 'package:app_ban_giay/utils/constants/image_strings.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/constants/text_strings.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';

class OTPVerify extends StatelessWidget {
  const OTPVerify({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          width: double.infinity,
          child: Column(
            children: [
              //Image
              Image(image: const AssetImage(TImages.verifyEmail), width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              //Title
              Text(TTexts.otpPhone, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text('+84 123456789', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Pinput(
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.green),
                  ),
                ),
                onCompleted: (pin) => debugPrint(pin),
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
              //Btn
              SizedBox(width:  double.infinity, 
              child: ElevatedButton(
                onPressed: () => Get.to(() => SuccessScreen(
                  image: TImages.verifyEmailSucess,
                  title: TTexts.successOTP,
                  subTitle: TTexts.successOTPTitle,
                  onPressed: () => Get.to(() => const LoginScreen()),
                  )), 
                  child: const Text(TTexts.continueSuccess))),
              const SizedBox(height: TSizes.spaceBtwItems,),
              SizedBox(width:  double.infinity, child: TextButton(onPressed: (){}, child: const Text(TTexts.resendOTP))),
            ],
          ),
        ),
      ),
    );
  }
}