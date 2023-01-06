import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mybankapp/accountscreens/notificationscreen.dart';
import 'package:mybankapp/accountscreens/privacypolicyscreen.dart';
import 'package:mybankapp/accountscreens/termsandconditionsscreen.dart';
import 'package:mybankapp/colors/colors.dart';
import 'package:mybankapp/images/images.dart';
import 'package:mybankapp/textfontfamily/textfontfamily.dart';
import 'package:mybankapp/welcomescreen/welcomescreen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  InkWell inkWell(String image, String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(image, color: ColorResources.red),
        title: Text(
          text,
          style: TextStyle(
              fontFamily: TextFontFamily.helveticaNeueCyrRoman,
              fontSize: 17,
              color: ColorResources.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 90, bottom: 5),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorResources.white, width: 2),
                    color: ColorResources.grey5,
                  ),
                  child: Image.asset(Images.personicon),
                ),
                SizedBox(height: 20),
                Text(
                  "John Doe",
                  style: TextStyle(
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontSize: 29,
                      fontWeight: FontWeight.w500,
                      color: ColorResources.white),
                ),
                SizedBox(height: 10),
                Text(
                  "+234 806 123 8970",
                  style: TextStyle(
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontSize: 14,
                      color: ColorResources.grey2),
                ),
                SizedBox(height: 40),
                Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                    color: ColorResources.blue2,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          inkWell(Images.notificationicon, "Notification", () {
                            Get.off(NotificationScreen());
                          }),
                          Divider(
                            thickness: 0.5,
                            color: ColorResources.blue1.withOpacity(0.6),
                          ),
                          inkWell(Images.privacypolicyicon, "Privacy policy",
                              () {
                            Get.off(PrivacyPolicyScreen());
                          }),
                          Divider(
                            thickness: 0.5,
                            color: ColorResources.blue1.withOpacity(0.6),
                          ),
                          inkWell(Images.termsandconditionsicon,
                              "Terms and conditions", () {
                            Get.off(TermsAndConditions());
                          }),
                          Divider(
                            thickness: 0.5,
                            color: ColorResources.blue1.withOpacity(0.6),
                          ),
                          inkWell(Images.logouticon, "Logout", () {
                            Get.off(WelcomeScreen());
                          }),
                          Divider(
                            thickness: 0.5,
                            color: ColorResources.blue1.withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
