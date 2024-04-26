import 'package:app_ban_giay/common/widgets/loader/loaders.dart';
import 'package:app_ban_giay/data/repositories/authentication/authentication_repository.dart';
import 'package:app_ban_giay/features/authentication/screens/password/reset_pass.dart';
import 'package:app_ban_giay/utils/helpers/network_manager.dart';
import 'package:app_ban_giay/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //Send
  sendPasswordResetEmail() async {
    try {
      //Start
      //TFullScreenLoader.openLoadingDialog('Đang xử lý...', TImages.loading);

      //Check connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form vali
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Send email reset
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //Remove loader
      TFullScreenLoader.stopLoading();

      //Show success
      TLoaders.successSnackBar(
          title: 'Email send',
          message: 'Email đã được gửi để thay đổi mật khẩu'.tr);

      //Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      //Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Opps', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //Start
      //TFullScreenLoader.openLoadingDialog('Đang xử lý...', TImages.loading);

      //Check connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Send email reset
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove loader
      TFullScreenLoader.stopLoading();

      //Show success
      TLoaders.successSnackBar(
        title: 'Email send',
        message: 'Email đã được gửi để thay đổi mật khẩu'.tr,
      );
    } catch (e) {
      //Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Opps', message: e.toString());
    }
  }
}
