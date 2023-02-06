import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../colors/colors.dart';
import '../routes/route_names.dart';
import '../textfontfamily/textfontfamily.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 350,
            left: 15,
            right: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to NobleBank",
                  style: TextStyle(
                      fontFamily: TextFontFamily.helveticNeueCyrBold,
                      fontSize: 29,
                      color: ColorResources.white),
                ),
                SizedBox(height: 12),
                Text(
                  "The bank for everyone.",
                  style: TextStyle(
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontSize: 16,
                      color: ColorResources.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Column(
              children: [
                InkWell(
                  onTap: () => context.goNamed(RouteName.signUpScreen),
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: ColorResources.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "CREATE YOUR FREE ACCOUNT",
                        style: TextStyle(
                            fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: ColorResources.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => context.goNamed(RouteName.logInScreen),
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: ColorResources.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "LOG INTO YOUR ACCOUNT",
                        style: TextStyle(
                            fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: ColorResources.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
