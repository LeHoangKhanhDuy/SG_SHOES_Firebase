import 'package:app_ban_giay/features/authentication/screens/login/login.dart';
import 'package:app_ban_giay/features/authentication/screens/signup/signup.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/banner/giphy.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // SizedBox(
            //   width: 250, // Chiều rộng logo
            //   height: 400, // Chiều cao logo
            //   child: Image.asset('assets/logos/logolight.png'),
            // ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Image.asset(
              'assets/splash/logowhite.png',
              width: 300,
              height: 300,
            ),
            // const SizedBox(height: 100.0),
            const Text(
              'Walk. Move. Live.',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 150.0),

            //Lôgin
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: Container(
                height: 55,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: TColors.white),
                ),
                child: const Center(
                    child: Text('Đăng nhập',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: TColors.black,
                        ))),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            //Register
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
              child: Container(
                height: 55,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: TColors.white),
                ),
                child: const Center(
                    child: Text('Đăng ký',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: TColors.white,
                        ))),
              ),
            ),

            const Spacer(),

            const Text(
              'Liên hệ với chúng tôi',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40, // Chiều rộng logo
                  height: 40, // Chiều cao logo
                  child: Image.asset('assets/logos/facebook.png'),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 36, // Chiều rộng logo
                  height: 40, // Chiều cao logo
                  child: Image.asset('assets/logos/instagram.png'),
                ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
