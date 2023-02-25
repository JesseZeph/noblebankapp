import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';
import '../../colors/colors.dart';
import '../../images/images.dart';
import '../../routes/route_names.dart';
import '../../textfontfamily/textfontfamily.dart';

class InvestCongratulationsScreen extends StatelessWidget {
  const InvestCongratulationsScreen({Key? key}) : super(key: key);

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
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontWeight: FontWeight.w500,
                      color: ColorResources.white,
                    ),
                  ),
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Your order for ₦50,000 worth of Propertyvest Estate is successful.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 14,
                        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                        color: ColorResources.grey2,
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
                  // selectedIndex = 0;
            context.goNamed(RouteName.homeScreen);
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
