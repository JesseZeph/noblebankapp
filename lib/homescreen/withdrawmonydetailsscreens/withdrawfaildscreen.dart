import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// import 'package:get/get.dart';
import '../../colors/colors.dart';
import '../../images/images.dart';
import '../../routes/route_names.dart';
import '../../routscreens/routwidget.dart';
import '../../textfontfamily/textfontfamily.dart';

class WithdrawsFaildScreen extends StatelessWidget {
  const WithdrawsFaildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 100, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(Images.withdrawfaildimage, height: 125, width: 125),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    "Withdrawal failed!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontWeight: FontWeight.w500,
                      color: ColorResources.white,
                    ),
                  ),
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "You do not have sufficient funds to complete this transaction, please select a lesser amount.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                        color: ColorResources.grey2,
                        height: 1.5,
                      ),
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
                    color: ColorResources.backGroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorResources.red2, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      "REVIEW WITHDRAWAL",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticNeueCyrBold,
                          fontSize: 15,
                          color: ColorResources.red2),
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
