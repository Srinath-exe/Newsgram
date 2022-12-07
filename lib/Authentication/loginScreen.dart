import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/constants/buttons.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/AuthController.dart';
import 'package:sign_in_button/sign_in_button.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/new_bg.jpg",
                ),
                opacity: 0.5,
                repeat: ImageRepeat.repeat,
                fit: BoxFit.contain)),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: Config().deviceWidth(context),
                  height: Config().deviceHeight(context) * 0.95,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Welcome to',
                            style: TextStyle(
                                color: white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            'assets/images/newsgram.png',
                            width: Config().deviceWidth(context) * 0.7,
                          ),
                        ],
                      ),
                      Lottie.asset('assets/lottie/onboarding.json',
                          width: Config().deviceWidth(context)),
                      SignInButton(
                        Buttons.google,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60)),
                        padding: const EdgeInsets.all(12),
                        onPressed: () {
                          controller.googleLogin();
                        },
                      ),
                      // ThemeButton(
                      //     bgColor: black,
                      //     txtColor: white,
                      //     width: Config().deviceWidth(context) * 0.8,
                      //     text: 'Get Started',
                      //     onTap: () {}

                      //     //   Navigator.of(context).push(MaterialPageRoute<void>(
                      //     //       builder: (BuildContext context) {
                      //     //     return LoginScreen();
                      //     //   }));
                      //     // },
                      //     )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
