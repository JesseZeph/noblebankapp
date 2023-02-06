import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';
import '../../colors/colors.dart';
import '../../images/images.dart';
import '../../routscreens/routwidget.dart';
import '../../textfontfamily/textfontfamily.dart';

import '../../routes/route_names.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(Images.checkimage, height: 200, width: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Text(
                    "Congratulations!",
                    style: TextStyle(
                      fontSize: 34,
                      fontFamily: TextFontFamily.helveticaNeueCyrMedium,
                      fontWeight: FontWeight.w500,
                      color: ColorResources.white,
                    ),
                  ),
                  SizedBox(height: 26),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Your order for ",
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 14,
                        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                        color: ColorResources.grey2,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "₦1,000 ",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                            color: ColorResources.white,
                          ),
                        ),
                        TextSpan(
                          text: "saving was placed successfully! A"
                              "text message will be sent to your phone containing the "
                              "ORDER NUMBER of your transaction, phone number and "
                              "address of the nearest agent to complete your "
                              "transaction.",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                            color: ColorResources.grey2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () {
                  selectedIndex = 0;
                  context.goNamed(RouteName.buttombar);
                  // Navigator.of(context, rootNavigator: true)
                  //     .pushReplacement(MaterialPageRoute(
                  //   builder: (context) => NavigationBarBottom(),
                  // ));
                },
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: ColorResources.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "CLOSE",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticNeueCyrBold,
                          fontSize: 15,
                          color: ColorResources.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
