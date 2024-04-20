import 'package:app_ban_giay/common/widgets/loader/loaders.dart';
import 'package:app_ban_giay/data/repositories/authentication/authentication_repository.dart';
import 'package:app_ban_giay/data/repositories/user/user_repository.dart';
import 'package:app_ban_giay/features/authentication/screens/signup/verify_email.dart';
import 'package:app_ban_giay/features/personalization/models/user_model.dart';
import 'package:app_ban_giay/utils/helpers/network_manager.dart';
import 'package:app_ban_giay/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //varriables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final fullname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final confirmPhoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //SignUp
  void signup() async {
    try {
      //start loading
      // FullScreenLoader.openLoadingDialog('Đang xử lý....', TImages.emailSend);

      //Check internet connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      //Form validation
      if (!signupFormKey.currentState!.validate()) return;

      //Privacy Policy
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'Để tạo tài khoản bạn phải chấp nhận Điều khoản sử dụng và Chính sách bảo mật',
        );
        return;
      }

      // //Register user & save
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save auth user data
      final newUser = UserModel(
        id: userCredential.user!.uid,
        fullName: fullname.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Show success Message
      TLoaders.successSnackBar(
          title: 'Chúc mừng',
          message: 'Tài khoản của bạn đã được tạo! Xác thực email để tiếp tục');

      //move to verify email
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();

      //Show error
      TLoaders.errorSnackBar(title: 'Opps!', message: e.toString());
    }
  }
}
