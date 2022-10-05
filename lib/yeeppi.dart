import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/constants/buttons.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/constants/outlined_button.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: Config().deviceWidth(context),
                height: Config().deviceHeight(context) * 0.95,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 100,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          'Welcome to Yeeppi App',
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Lottie.asset('assets/lottie/phone.json',
                        width: Config().deviceWidth(context) * 0.7),
                    ThemeButton(
                        bgColor: black,
                        txtColor: white,
                        width: Config().deviceWidth(context) * 0.8,
                        text: 'Get Started',
                        onTap: () {}

                        //   Navigator.of(context).push(MaterialPageRoute<void>(
                        //       builder: (BuildContext context) {
                        //     return LoginScreen();
                        //   }));
                        // },
                        )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
