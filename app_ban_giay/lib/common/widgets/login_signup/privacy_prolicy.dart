import 'package:app_ban_giay/features/authentication/controllers/signup/sign_up_controller.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/constants/text_strings.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyCheckBox extends StatelessWidget {
  const PrivacyPolicyCheckBox({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24, 
          height: 24, 
          child: Obx (
            () => Checkbox(
              value: controller.privacyPolicy.value, 
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
        )),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Expanded(
          child: Text.rich(
            TextSpan(children: [
              TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '${TTexts.termsOfUse} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TColors.white : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.white : TColors.primary,
              )),
              TextSpan(text: TTexts.and, style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: ' ${TTexts.privacyPolicy}', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TColors.white : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.white : TColors.primary,
              )),
            ]),
          ),
        ),
      ],
    );
  }
}