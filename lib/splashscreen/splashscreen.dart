import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../colors/colors.dart';
import '../images/images.dart';
import '../routes/route_names.dart';

// ignore: must_be_immutable
class SplashScreen extends ConsumerStatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  // SplashController splashController = Get.put(SplashController());
  @override
  void initState() {
    Timer(Duration(seconds: 6), () {
      if (mounted) {
        context.goNamed(RouteName.onboardingScreen);
      }
    });

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
