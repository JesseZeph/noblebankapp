import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mybankapp/colors/colors.dart';
import 'package:mybankapp/homescreen/savemonydetailsscreens/saveaddmoneydetailsscreen.dart';
import 'package:mybankapp/images/images.dart';
import 'package:mybankapp/textfontfamily/textfontfamily.dart';

class AddMoneyBottomSheetWidget extends StatefulWidget {
  AddMoneyBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<AddMoneyBottomSheetWidget> createState() =>
      _AddMoneyBottomSheetWidgetState();
}

class _AddMoneyBottomSheetWidgetState extends State<AddMoneyBottomSheetWidget> {
  String number = "";

  InkWell inkwell1(String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: TextFontFamily.helveticaNeueCyrMedium,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: ColorResources.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: ColorResources.white,
                child: Icon(Icons.close, color: ColorResources.backGroundColor),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: ColorResources.blue2,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 35),
                child: Column(
                  children: [
                    Text(
                      "Let’s help you save",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                          fontSize: 30,
                          color: ColorResources.white),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Enter the amount you want to save",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticaNeueCyrLight,
                          fontSize: 16,
                          color: ColorResources.white),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "₦$number",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticNeueCyrBold,
                          fontSize: 54,
                          color: ColorResources.white4),
                    ),
                    SizedBox(height: Get.height >= 876 ? 85 : 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        inkwell1("1", () {
                          setState(() {
                            number = number + "1";
                          });
                        }),
                        inkwell1("2", () {
                          setState(() {
                            number = number + "2";
                          });
                        }),
                        inkwell1("3", () {
                          setState(() {
                            number = number + "3";
                          });
                        }),
                      ],
                    ),
                    SizedBox(height: Get.height >= 876 ? 60 : 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        inkwell1("4", () {
                          setState(() {
                            number = number + "4";
                          });
                        }),
                        inkwell1("5", () {
                          setState(() {
                            number = number + "5";
                          });
                        }),
                        inkwell1("6", () {
                          setState(() {
                            number = number + "6";
                          });
                        }),
                      ],
                    ),
                    SizedBox(height: Get.height >= 876 ? 60 : 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        inkwell1("7", () {
                          setState(() {
                            number = number + "7";
                          });
                        }),
                        inkwell1("8", () {
                          setState(() {
                            number = number + "8";
                          });
                        }),
                        inkwell1("9", () {
                          setState(() {
                            number = number + "9";
                          });
                        }),
                      ],
                    ),
                    SizedBox(height: Get.height >= 876 ? 60 : 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        inkwell1(".", () {
                          setState(() {
                            number = number + ".";
                          });
                        }),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: inkwell1("0", () {
                            setState(() {
                              number = number + "0";
                            });
                          }),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              number = "";
                            });
                          },
                          child: SvgPicture.asset(Images.backimage),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height >= 876 ? 60 : 45),
                    InkWell(
                      onTap: () {
                        Get.off(SaveAddMoneyDetailsScreen());
                      },
                      child: Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                          color: ColorResources.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                                fontFamily:
                                    TextFontFamily.helveticaNeueCyrRoman,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: ColorResources.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
