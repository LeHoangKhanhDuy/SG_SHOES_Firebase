import 'package:app_ban_giay/common/widgets/appbar/appbar.dart';
import 'package:app_ban_giay/data/repositories/authentication/authentication_repository.dart';
import 'package:app_ban_giay/features/personalization/screens/address/address.dart';
import 'package:app_ban_giay/features/personalization/screens/profile/widget/edit_profile.dart';
import 'package:app_ban_giay/features/personalization/screens/setting/widget/setting_menu_title.dart';
import 'package:app_ban_giay/features/personalization/screens/profile/user_profile.dart';
import 'package:app_ban_giay/features/shop/screens/cart/cart.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/primary_header_container.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/section_heading.dart';
import 'package:app_ban_giay/features/shop/screens/order/order.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  //Appbar
                  TAppBar(
                    title: Text(
                      'Cài đặt',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),

                  //Profile
                  UserProfile(
                      onPressed: () => Get.to(() => const EditProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            //Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Account setting
                  const SectionHeading(
                    title: 'Cài đặt tài khoản',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  SettingMenuTitle(
                      icon: Iconsax.location,
                      title: 'Địa chỉ giao hàng',
                      subTitle: 'Cài đặt địa chỉ nhận hàng',
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  SettingMenuTitle(
                      icon: Iconsax.shopping_cart,
                      title: 'Giỏ hàng',
                      subTitle: 'Thêm, xóa, sửa, thanh toán',
                      onTap: () => Get.to(() => const CartScreen())),
                  SettingMenuTitle(
                      icon: Iconsax.bag_tick,
                      title: 'Đơn hàng',
                      subTitle: 'Theo dõi tình trạng đơn hàng của bạn',
                      onTap: () => Get.to(() => const OrderScreen())),
                  const SettingMenuTitle(
                      icon: Iconsax.bank,
                      title: 'Tài khoản ngân hàng',
                      subTitle: 'Thêm tài khoản để thanh toán dễ dàng'),
                  const SettingMenuTitle(
                      icon: Iconsax.discount_shape,
                      title: 'Khuyến mãi',
                      subTitle: 'Danh sách voucher dành cho bạn'),
                  const SettingMenuTitle(
                      icon: Iconsax.notification,
                      title: 'Thông báo',
                      subTitle: 'Cài đặt thông báo'),
                  const SettingMenuTitle(
                      icon: Iconsax.security_card,
                      title: 'Tài khoản & Bảo mật',
                      subTitle: 'Bảo vệ dữ liệu và tài khoản của bạn'),

                  //App setting
                  // const SizedBox(height: TSizes.spaceBtwSections),
                  // const SectionHeading(title: 'Cài đặt ứng dụng', showActionButton: false),
                  // const SizedBox(height: TSizes.spaceBtwItems),
                  // const SettingMenuTitle(icon: Iconsax.document_upload, title: 'Cloud', subTitle: 'Tải dữ liệu lên Cloud'),
                  // SettingMenuTitle(icon: Iconsax.location, title: 'Vị trí', subTitle: 'Đề xuất theo vị trí của bạn', trailing: Switch(value: true, onChanged: (value) {})),
                  // SettingMenuTitle(icon: Iconsax.security_user, title: 'Chế độ an toàn', subTitle: 'Tìm kiếm theo lứa tuổi', trailing: Switch(value: false, onChanged: (value) {})),
                  // SettingMenuTitle(icon: Iconsax.image, title: 'Chất lượng hình ảnh', subTitle: 'Chất lượng hình ảnh HD', trailing: Switch(value: true, onChanged: (value) {})),

                  //Logout
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => controller.logout(),
                      child: const Text(
                        'Đăng xuất',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
