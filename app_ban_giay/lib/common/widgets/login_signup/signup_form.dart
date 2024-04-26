import 'package:app_ban_giay/common/widgets/layouts/form_line.dart';
import 'package:app_ban_giay/common/widgets/login_signup/privacy_prolicy.dart';
import 'package:app_ban_giay/common/widgets/login_signup/social_button.dart';
import 'package:app_ban_giay/features/authentication/controllers/signup/sign_up_controller.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/constants/text_strings.dart';
import 'package:app_ban_giay/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.firstname,
                          validator: (value) =>
                              TValidator.validateEmptyText('Họ', value),
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.firstName,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          controller: controller.lastname,
                          validator: (value) =>
                              TValidator.validateEmptyText('Tên', value),
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.lastName,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // //full name
            // TextFormField(
            //   controller: controller.fullname,
            //   validator: (value) => TValidator.validateEmptyText('Họ và tên', value),
            //   expands: false,
            //   decoration: const InputDecoration(
            //     labelText: TTexts.fullName,
            //     prefixIcon: Icon(Iconsax.user),
            //   ),
            // ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            //Username
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  TValidator.validateEmptyText('Tên tài khoản', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            //Phone
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => TValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            //Pass
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    )),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            //CFPass
            // Obx(
            //   () => TextFormField(
            //     controller: controller.confirmPhoneNumber,
            //     validator: (value) => TValidator.validatePassword(value),
            //     obscureText: controller.hidePassword.value,
            //     decoration: InputDecoration(
            //       labelText: TTexts.password,
            //       prefixIcon: const Icon(Iconsax.password_check),
            //       suffixIcon: IconButton(
            //         onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
            //         icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
            //       )
            //     ),
            //   ),
            // ),
            // const SizedBox(height: TSizes.spaceBtwInputFields,),

            //Checkbox
            PrivacyPolicyCheckBox(dark: dark),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            //SignUp Btn
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.signup(),
                    child: const Text(TTexts.signUp))),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            //Line
            FormLine(dark: dark),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            //Footer
            const SocialBtn(),
          ],
        ));
  }
}
