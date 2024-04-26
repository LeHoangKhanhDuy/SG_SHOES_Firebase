import 'package:app_ban_giay/common/widgets/loader/loaders.dart';
import 'package:app_ban_giay/data/repositories/authentication/authentication_repository.dart';
import 'package:app_ban_giay/data/repositories/user/user_repository.dart';
import 'package:app_ban_giay/features/authentication/screens/login/login.dart';
import 'package:app_ban_giay/features/personalization/models/user_model.dart';
import 'package:app_ban_giay/features/personalization/screens/profile/widget/re_authenticate_user_login_form.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/helpers/network_manager.dart';
//import 'package:app_ban_giay/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      //profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //Save user
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //First update Rx user
      fetchUserRecord();

      //If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          //Convert
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          //Map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          //Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Không thể lưu thông tin',
          message:
              'Đã xảy ra lỗi khi lưu thông tin của bạn. Bạn có thể lưu lại dữ liệu trong hồ sơ của mình.');
    }
  }

  //Delete acc
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Xóa tài khoản',
      middleText: 'Bạn có chắc chắn muốn xóa tài khoản này',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Xóa'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Hủy'),
      ),
    );
  }

  //Delete user accc
  void deleteUserAccount() async {
    try {
      //TFullScreenLoader.openLoadingDialog('Đang xử lí...', TImages.loading);

      //First reauthen
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Re verify
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          //TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          //TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      //TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Opps!', message: e.toString());
    }
  }

  //Re authen
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      //TFullScreenLoader.openLoadingDialog('Đang xử lí...', TImages.loading);

      //Check connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //TFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        //TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      //TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      //TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Opps!', message: e.toString());
    }
  }

  //Upload profile imgh
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageUploading.value = true;
        //Upload img
        final imageUrl = await userRepository.upLoadImage(
          'Users/Images/Profile/',
          image,
        );

        //Update user img record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
          title: 'Chúc mừng!',
          message: 'Ảnh đại diện của bạn đã được thay đổi',
        );
      }
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Opps!',
        message: 'Lỗi không thể thay đổi ảnh đại diện: $e',
      );
    } finally {
      imageUploading.value = false;
    }
  }
}
