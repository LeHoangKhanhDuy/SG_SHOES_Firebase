import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          height: 250,
          // image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
          image: AssetImage(TImages.logoBlack),
        ),
      ],
    );
  }
}
