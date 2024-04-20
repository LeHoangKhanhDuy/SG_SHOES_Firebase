import 'package:app_ban_giay/common/widgets/appbar/appbar.dart';
import 'package:app_ban_giay/common/widgets/success_failed_screen/success_screen.dart';
import 'package:app_ban_giay/features/shop/screens/cart/widget/cart_item.dart';
import 'package:app_ban_giay/features/shop/screens/checkout/widget/bill_address_section.dart';
import 'package:app_ban_giay/features/shop/screens/checkout/widget/bill_amount_section.dart';
import 'package:app_ban_giay/features/shop/screens/checkout/widget/bill_payment_section.dart';
import 'package:app_ban_giay/features/shop/screens/checkout/widget/voucher_code.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/rounded_container.dart';
import 'package:app_ban_giay/navigation_menu.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/image_strings.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Giỏ hàng', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              //Item cart
              const TCartItem(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),
              
              //coupon
              const VoucherCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Bill
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.dark : TColors.white,
                child: const Column(
                  children: [

                    //Pricing
                    BillAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Payment
                    BillPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Address
                    BillAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //check btn
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: TImages.paymentSuccess,
              title: 'Thanh toán thành công',
              subTitle: 'Đơn hàng của bạn sẽ được giao trong thời gian sớm nhất',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            )
          ), 
          child: const Text('Thanh toán 4,020,000đ'),
        ),
      ),
    );
  }
}

