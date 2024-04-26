import 'package:app_ban_giay/common/widgets/loader/loaders.dart';
import 'package:app_ban_giay/data/repositories/user/user_repository.dart';
import 'package:app_ban_giay/features/personalization/controllers/user_controller.dart';
import 'package:app_ban_giay/features/personalization/screens/profile/widget/edit_profile.dart';
//import 'package:app_ban_giay/utils/constants/image_strings.dart';
import 'package:app_ban_giay/utils/helpers/network_manager.dart';
//import 'package:app_ban_giay/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //init user data
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //Fetch
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //Start
      //TFullScreenLoader.openLoadingDialog('Đang cập nhật...', TImages.loading);

      //Check connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //TFullScreenLoader.stopLoading();
        return;
      }

      //Form vali
      if (!updateUserNameFormKey.currentState!.validate()) {
        //TFullScreenLoader.stopLoading();
        return;
      }

      //update
      Map<String, dynamic> name = {
        'Họ': firstName.text.trim(),
        'Tên': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //update Rx
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove loader
      //TFullScreenLoader.stopLoading();

      //Show success mess
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Tên của bạn đã được thay đổi');

      //Move to previous screen
      Get.off(() => const EditProfileScreen());
    } catch (e) {
      //TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Opps!', message: e.toString());
    }
  }
}
