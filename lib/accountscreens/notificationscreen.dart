import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';
import '../colors/colors.dart';
import '../images/images.dart';
import '../textfontfamily/textfontfamily.dart';

import '../routes/route_names.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  Builder container(String image, String text1, String text2) {
    return Builder(builder: (context) {
      return Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorResources.backGroundColor,
          border: Border.all(
            width: 1,
            color: ColorResources.blue1.withOpacity(0.6),
          ),
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SvgPicture.asset(image),
          ),
          title: Text(
            text1,
            style: TextStyle(
                fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ColorResources.white),
          ),
          subtitle: Text(
            text2,
            style: TextStyle(
                fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                fontSize: 12,
                color: ColorResources.grey2),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorResources.backGroundColor,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              // selectedIndex = 4;
              context.goNamed(RouteName.accountScreen);
              // Navigator.of(context, rootNavigator: true)
              //     .pushReplacement(MaterialPageRoute(
              //   builder: (context) => NavigationBarBottom(),
              // ));
            },
            child: Icon(Icons.arrow_back_ios,
                color: ColorResources.white, size: 15)),
        title: Text(
          "Notification",
          style: TextStyle(
              fontFamily: TextFontFamily.helveticNeueCyrBold,
              fontSize: 17,
              color: ColorResources.white),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 14,
                    color: ColorResources.white),
              ),
              SizedBox(height: 10),
              container(Images.arrowIcon, "Withdrew ₦5,000", "08:58 PM"),
              SizedBox(height: 10),
              container(Images.iosWalletIcon, "Received money ₦2,000 from Dito",
                  "08:40 PM"),
              SizedBox(height: 10),
              container(Images.arrowIcon,
                  "Withdrew ₦40,000 from emergency funds", "08:20 AM"),
              SizedBox(height: 10),
              container(Images.iosWalletIcon, "Added ₦4,400 to your savings",
                  "06:58 AM"),
              SizedBox(height: 30),
              Text(
                "Yesterday",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 14,
                    color: ColorResources.white),
              ),
              SizedBox(height: 10),
              container(Images.arrowIcon, "Withdrew ₦5,000", "08:58 PM"),
              SizedBox(height: 10),
              container(Images.iosWalletIcon, "Received money ₦2,000 from Dito",
                  "08:40 PM"),
              SizedBox(height: 10),
              container(Images.arrowIcon,
                  "Withdrew ₦40,000 from emergency funds", "08:20 AM"),
            ],
          ),
        ),
      ),
    );
  }
}
