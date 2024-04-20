import 'package:app_ban_giay/common/styles/spacing_styles.dart';
import 'package:app_ban_giay/common/widgets/layouts/form_line.dart';
import 'package:app_ban_giay/common/widgets/login_signup/login_form.dart';
import 'package:app_ban_giay/common/widgets/login_signup/login_header.dart';
import 'package:app_ban_giay/common/widgets/login_signup/social_button.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Logo
              const LoginHeader(),

              //FOrm
              const LoginForm(),

              //Line
              FormLine(dark: dark),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Footer
              const SocialBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
