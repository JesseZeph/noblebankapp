import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mybankapp/colors/colors.dart';
import 'package:mybankapp/controllers/splashcontroller.dart';
import 'package:mybankapp/images/images.dart';

import '../routes/route_names.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // SplashController splashController = Get.put(SplashController());
  @override
  void initState() {
    Timer(
      Duration(seconds: 6),
      () => context.goNamed(RouteName.onboardingScreen),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      body: Center(
        child: SvgPicture.asset(Images.myBankAppLogo),
      ),
    );
  }
}
