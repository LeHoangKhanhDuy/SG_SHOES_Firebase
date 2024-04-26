import 'package:app_ban_giay/common/widgets/appbar/appbar.dart';
import 'package:app_ban_giay/common/widgets/images/circular_image.dart';
import 'package:app_ban_giay/features/personalization/controllers/user_controller.dart';
import 'package:app_ban_giay/features/personalization/screens/profile/widget/changename.dart';
import 'package:app_ban_giay/features/personalization/screens/profile/widget/edit_profile_menu.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/section_heading.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/simmer.dart';
import 'package:app_ban_giay/utils/constants/image_strings.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Sửa hồ sơ')),

      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : CircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Sửa')),
                  ],
                ),
              ),

              //Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Heading profile info
              const SectionHeading(
                  title: 'Thông tin tài khoản', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              EditProfileMenu(
                title: 'Họ và tên',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              EditProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () {},
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //heading personal info
              const SectionHeading(
                title: 'Thông tin cá nhân',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              EditProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              EditProfileMenu(
                title: 'Email',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              EditProfileMenu(
                title: 'Số điện thoại',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              EditProfileMenu(
                title: 'Giới tính',
                value: 'Nam',
                onPressed: () {},
              ),
              EditProfileMenu(
                title: 'Ngày sinh',
                value: '23-11-2002',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Đóng tài khoản',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
