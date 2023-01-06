import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mybankapp/colors/colors.dart';
import 'package:mybankapp/images/images.dart';
import 'package:mybankapp/routscreens/routwidget.dart';
import 'package:mybankapp/textfontfamily/textfontfamily.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorResources.backGroundColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            selectedIndex = 0;
            Navigator.of(context, rootNavigator: true)
                .pushReplacement(MaterialPageRoute(
              builder: (context) => NavigationBarBottom(),
            ));
          },
          child:
              Icon(Icons.arrow_back_ios, color: ColorResources.white, size: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Image.asset(Images.rewardsscreenimage),
                  SizedBox(height: 50),
                  Text(
                    "Get Free \₦1,000",
                    style: TextStyle(
                        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: ColorResources.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "You and your friends earn cash reward when they signup and save with your referral link or code.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.2,
                        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                        fontSize: 15,
                        color: ColorResources.grey2),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Here’s your referral code",
                    style: TextStyle(
                        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                        fontSize: 17,
                        color: ColorResources.white),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: ColorResources.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "ABCDE123",
                                    style: TextStyle(
                                        fontFamily:
                                            TextFontFamily.helveticNeueCyrBold,
                                        fontSize: 15,
                                        color: ColorResources.red),
                                  ),
                                  SvgPicture.asset(Images.copyicon),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: ColorResources.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "INVITE",
                              style: TextStyle(
                                  fontFamily:
                                      TextFontFamily.helveticaNeueCyrRoman,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13.5,
                                  color: ColorResources.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
