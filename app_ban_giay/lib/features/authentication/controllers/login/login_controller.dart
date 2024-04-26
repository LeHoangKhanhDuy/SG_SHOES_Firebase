import 'package:app_ban_giay/common/widgets/loader/loaders.dart';
import 'package:app_ban_giay/data/repositories/authentication/authentication_repository.dart';
import 'package:app_ban_giay/features/personalization/controllers/user_controller.dart';
import 'package:app_ban_giay/utils/helpers/network_manager.dart';
//import 'package:app_ban_giay/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //Varriable
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  // @override
  // void onInit() {
  //   email.text = localStorage.read('REMEMBER_ME_EMAIL');
  //   password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  //   super.onInit();
  // }
  @override
  void onInit() {
    super.onInit();
    final rememberedEmail = localStorage.read('REMEMBER_ME_EMAIL');
    final rememberedPassword = localStorage.read('REMEMBER_ME_PASSWORD');

    if (rememberedEmail != null) {
      email.text = rememberedEmail;
    }

    if (rememberedPassword != null) {
      password.text = rememberedPassword;
    }
  }

  //Sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      //Start loading
      // TFullScreenLoader.openLoadingDialog(
      //     "Logging you in..", TImages.loadingsearch);

      //Check internet connec
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //TFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!loginFormKey.currentState!.validate()) {
        //TFullScreenLoader.stopLoading();
        return;
      }

      //Save data
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //login user using email & pass
      // ignore: unused_local_variable
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //save
      //await userController.saveUserRecord(userCredentials);

      //Remove
      //TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Opps', message: e.toString());
    }
  }

  //Google sign in
  Future<void> googleSignIn() async {
    try {
      // TFullScreenLoader.openLoadingDialog(
      //     'Đang đăng nhập...', TImages.loadingsearch);

      //Check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //TFullScreenLoader.stopLoading();
        return;
      }
      //Google authen
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //Save user
      await userController.saveUserRecord(userCredentials);

      //Remove loader
      //TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Opps', message: e.toString());
    }
  }
}
