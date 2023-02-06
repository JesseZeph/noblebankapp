import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// import 'package:get/get.dart';
import '../../colors/colors.dart';
import '../../images/images.dart';
import '../../routes/route_names.dart';
import '../../routscreens/routwidget.dart';
import '../../textfontfamily/textfontfamily.dart';

class InvestReviewScreen extends StatelessWidget {
  const InvestReviewScreen({Key? key}) : super(key: key);

  Row row(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontFamily: TextFontFamily.helveticaNeueCyrLight,
            fontSize: 15,
            color: ColorResources.grey2,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            fontFamily: TextFontFamily.helveticaNeueCyrRoman,
            fontSize: 15,
            color: ColorResources.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  selectedIndex = 0;
                  context.goNamed(RouteName.buttombar);
                  // Navigator.of(context, rootNavigator: true)
                  //     .pushReplacement(MaterialPageRoute(
                  //   builder: (context) => NavigationBarBottom(),
                  // ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: ColorResources.white,
                  size: 18,
                ),
              ),
              SizedBox(height: 50),
              Text(
                "Review your investment",
                style: TextStyle(
                  fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                  fontSize: 30,
                  color: ColorResources.white2,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(Images.gridimage, height: 50, width: 50),
                  SizedBox(width: 15),
                  Text(
                    "Propertyvest Estate Investment",
                    style: TextStyle(
                        fontFamily: TextFontFamily.helveticaNeueCyrLight,
                        fontSize: 17,
                        color: ColorResources.white2),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Divider(
                thickness: 0.5,
                color: ColorResources.blue1,
              ),
              SizedBox(height: 25),
              row("Units", "20 Units"),
              SizedBox(height: 23),
              Divider(
                thickness: 0.5,
                color: ColorResources.blue1,
              ),
              SizedBox(height: 25),
              row("Value", "₦50,000"),
              SizedBox(height: 23),
              Divider(
                thickness: 0.5,
                color: ColorResources.blue1,
              ),
              SizedBox(height: 25),
              row("Processing Fee (1.5%)", "+ ₦750"),
              SizedBox(height: 23),
              Divider(
                thickness: 0.5,
                color: ColorResources.blue1,
              ),
              SizedBox(height: 25),
              row("Total", "₦50,750"),
              SizedBox(height: 23),
              Divider(
                thickness: 0.5,
                color: ColorResources.blue1,
              ),
              SizedBox(height: 25),
              Text(
                "Please note this investment can only be claimed after the expect yield date is due which is 9 months",
                style: TextStyle(
                  fontFamily: TextFontFamily.helveticaNeueCyrLight,
                  fontSize: 15,
                  color: ColorResources.grey2,
                ),
              ),
              SizedBox(height: size.height >= 876 ? 150 : 70),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => AlertDialog(
                      // title: "",
                      titlePadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.zero,
                      backgroundColor: ColorResources.blue2,
                      content: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "Please Confirm",
                              style: TextStyle(
                                  fontFamily:
                                      TextFontFamily.helveticaNeueCyrRoman,
                                  fontSize: 17,
                                  color: ColorResources.white),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "We are about to complete your request and credit your account. Please confirm this transaction.",
                              style: TextStyle(
                                  fontFamily:
                                      TextFontFamily.helveticaNeueCyrLight,
                                  fontSize: 17,
                                  color: ColorResources.white),
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Text(
                                    "CANCEL",
                                    style: TextStyle(
                                        fontFamily: TextFontFamily
                                            .helveticaNeueCyrRoman,
                                        fontSize: 17,
                                        color: ColorResources.grey2),
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () => context.goNamed(
                                      RouteName.investCongratulationsScreen),
                                  child: Text(
                                    "CONFIRM",
                                    style: TextStyle(
                                        fontFamily: TextFontFamily
                                            .helveticaNeueCyrRoman,
                                        fontSize: 17,
                                        color: ColorResources.red2),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: ColorResources.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticNeueCyrBold,
                          fontSize: 15,
                          color: ColorResources.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
