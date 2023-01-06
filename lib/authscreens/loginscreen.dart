import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybankapp/authscreens/signup.dart';
import 'package:mybankapp/colors/colors.dart';
import 'package:mybankapp/routscreens/routwidget.dart';
import 'package:mybankapp/textfontfamily/textfontfamily.dart';
import 'package:mybankapp/welcomescreen/welcomescreen.dart';
import 'package:pinput/pin_put/pin_put.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4),
    );
  }

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
        color: ColorResources.white,
      ),
    );
  }

  Container textFormField(String hint) {
    return Container(
      color: ColorResources.grey1.withOpacity(0.05),
      child: TextFormField(
        style: TextStyle(
          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
          fontSize: 13,
          color: ColorResources.grey2,
        ),
        cursorColor: ColorResources.blue1.withOpacity(0.6),
        decoration: InputDecoration(
          fillColor: ColorResources.grey1.withOpacity(0.05),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: TextFontFamily.helveticaNeueCyrRoman,
            fontSize: 13,
            color: ColorResources.grey2,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 1,
              color: ColorResources.blue1.withOpacity(0.6),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 1,
              color: ColorResources.blue1.withOpacity(0.6),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 1,
              color: ColorResources.blue1.withOpacity(0.6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 1,
              color: ColorResources.blue1.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorResources.backGroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.off(WelcomeScreen());
                },
                child: Icon(
                  Icons.close,
                  color: ColorResources.white,
                ),
              ),
              SizedBox(height: 70),
              Text(
                "Sign into your\nAccount",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticNeueCyrBold,
                    fontSize: 35,
                    color: ColorResources.red),
              ),
              SizedBox(height: 15),
              Text(
                "Log into your MyBank account",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 15,
                    color: ColorResources.white1),
              ),
              SizedBox(height: 50),
              text("Phone number"),
              SizedBox(height: 10),
              textFormField("+ 234 808 762 1236"),
              SizedBox(height: 20),
              text("Password"),
              SizedBox(height: 10),
              textFormField("*********"),
              SizedBox(height: 20),
              Text(
                "Have you forgotten your password?,",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 15,
                    color: ColorResources.white1),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                    SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorResources.white,
                              child: Icon(Icons.close,
                                  color: ColorResources.backGroundColor),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 6,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: ColorResources.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                        fontFamily:
                                            TextFontFamily.helveticNeueCyrBold,
                                        fontSize: 35,
                                        color: ColorResources.red),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "Please enter your phone number to recover your password.",
                                    style: TextStyle(
                                        fontFamily: TextFontFamily
                                            .helveticaNeueCyrRoman,
                                        fontSize: 15,
                                        color: ColorResources.white1),
                                  ),
                                  SizedBox(height: 30),
                                  text("Phone number"),
                                  SizedBox(height: 10),
                                  textFormField("+ 234 808 762 1236"),
                                  SizedBox(
                                      height: Get.height >= 876 ? 100 : 40),
                                  InkWell(
                                    onTap: () {
                                      Get.bottomSheet(
                                        SingleChildScrollView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                      ColorResources.white,
                                                  child: Icon(Icons.close,
                                                      color: ColorResources
                                                          .backGroundColor),
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              Container(
                                                height: Get.height,
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40),
                                                  ),
                                                  color: ColorResources.blue2,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15,
                                                      vertical: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Center(
                                                        child: Container(
                                                          height: 6,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color:
                                                                ColorResources
                                                                    .white,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 30),
                                                      Text(
                                                        "Verify account",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                TextFontFamily
                                                                    .helveticNeueCyrBold,
                                                            fontSize: 35,
                                                            color:
                                                                ColorResources
                                                                    .red),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(
                                                        "Please enter the CODE sent to your phone number in the boxes below.",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                TextFontFamily
                                                                    .helveticaNeueCyrRoman,
                                                            fontSize: 15,
                                                            color:
                                                                ColorResources
                                                                    .white1),
                                                      ),
                                                      SizedBox(
                                                          height:
                                                              Get.height >= 876
                                                                  ? 70
                                                                  : 50),
                                                      Builder(
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                 EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        45),
                                                            child: PinPut(
                                                              fieldsCount: 4,
                                                              textStyle:
                                                                  TextStyle(
                                                                fontFamily:
                                                                    TextFontFamily
                                                                        .helveticaNeueCyrRoman,
                                                                fontSize: 30,
                                                                color:
                                                                    ColorResources
                                                                        .grey2,
                                                              ),
                                                              cursorColor:
                                                                  ColorResources
                                                                      .blue1
                                                                      .withOpacity(
                                                                          0.6),
                                                              eachFieldHeight:
                                                                  50,
                                                              eachFieldWidth:
                                                                  50,
                                                              focusNode:
                                                                  _pinPutFocusNode,
                                                              controller:
                                                                  _pinPutController,
                                                              submittedFieldDecoration:
                                                                  _pinPutDecoration
                                                                      .copyWith(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                border:
                                                                    Border.all(
                                                                  color: ColorResources
                                                                      .blue1
                                                                      .withOpacity(
                                                                          0.6),
                                                                ),
                                                                color: ColorResources
                                                                    .grey1
                                                                    .withOpacity(
                                                                        0.05),
                                                              ),
                                                              selectedFieldDecoration:
                                                                  _pinPutDecoration
                                                                      .copyWith(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                border:
                                                                    Border.all(
                                                                  color: ColorResources
                                                                      .blue1
                                                                      .withOpacity(
                                                                          0.6),
                                                                ),
                                                                color: ColorResources
                                                                    .grey1
                                                                    .withOpacity(
                                                                        0.05),
                                                              ),
                                                              followingFieldDecoration:
                                                                  _pinPutDecoration
                                                                      .copyWith(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                border:
                                                                    Border.all(
                                                                  color: ColorResources
                                                                      .blue1
                                                                      .withOpacity(
                                                                          0.6),
                                                                ),
                                                                color: ColorResources
                                                                    .grey1
                                                                    .withOpacity(
                                                                        0.05),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      SizedBox(
                                                          height:
                                                              Get.height >= 876
                                                                  ? 80
                                                                  : 30),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.bottomSheet(
                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 170),
                                                              child: SingleChildScrollView(
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                child: Column(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap: () {
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          CircleAvatar(
                                                                        radius:
                                                                            20,
                                                                        backgroundColor:
                                                                            ColorResources
                                                                                .white,
                                                                        child: Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                ColorResources.backGroundColor),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            15),
                                                                    Container(
                                                                      height: Get.height,
                                                                      width: Get.width,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(40),
                                                                          topRight:
                                                                              Radius.circular(40),
                                                                        ),
                                                                        color: ColorResources
                                                                            .blue2,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                                .symmetric(
                                                                            horizontal:
                                                                                15,
                                                                            vertical:
                                                                                20),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Center(
                                                                              child:
                                                                                  Container(
                                                                                height: 6,
                                                                                width: 60,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(3),
                                                                                  color: ColorResources.white,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                                height: 30),
                                                                            Text(
                                                                              "Recover password",
                                                                              style: TextStyle(
                                                                                  fontFamily: TextFontFamily.helveticNeueCyrBold,
                                                                                  fontSize: 35,
                                                                                  color: ColorResources.red),
                                                                            ),
                                                                            SizedBox(
                                                                                height: 8),
                                                                            Text(
                                                                              "Please enter your new password to continue",
                                                                              style: TextStyle(
                                                                                  fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                                                                                  fontSize: 15,
                                                                                  color: ColorResources.white1),
                                                                            ),
                                                                            // SizedBox(
                                                                            //     height: Get.height >= 876 ? 70 : 50),
                                                                            SizedBox(height: 55),
                                                                            text(
                                                                                "New Password"),
                                                                            SizedBox(
                                                                                height: 9),
                                                                            textFormField(
                                                                                "*********"),
                                                                            SizedBox(
                                                                                height: 22),
                                                                            text(
                                                                                "Confirm Password"),
                                                                            SizedBox(
                                                                                height: 9),
                                                                            textFormField(
                                                                                "*********"),
                                                                            // SizedBox(
                                                                            //     height: Get.height >= 876 ? 40 : 20),
                                                                            SizedBox(height:85),
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                Get.off(NavigationBarBottom());
                                                                              },
                                                                              child:
                                                                                  Container(
                                                                                height: 50,
                                                                                width: Get.width,
                                                                                decoration: BoxDecoration(
                                                                                  color: ColorResources.red,
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    "CHANGE PASSWORD",
                                                                                    style: TextStyle(fontFamily: TextFontFamily.helveticNeueCyrBold, fontSize: 15, color: ColorResources.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 30),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            isScrollControlled: true,
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 50,
                                                          width: Get.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                ColorResources
                                                                    .red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "VERIFY PHONE",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      TextFontFamily
                                                                          .helveticNeueCyrBold,
                                                                  fontSize: 15,
                                                                  color:
                                                                      ColorResources
                                                                          .white),
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
                                        backgroundColor: Colors.transparent,
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: ColorResources.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "RECOVER PASSWORD",
                                          style: TextStyle(
                                              fontFamily: TextFontFamily
                                                  .helveticNeueCyrBold,
                                              fontSize: 15,
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
                    backgroundColor: Colors.transparent,
                  );
                },
                child: Text(
                  "click here to recover it",
                  style: TextStyle(
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontSize: 15,
                      color: ColorResources.red),
                ),
              ),
              SizedBox(height: Get.height >= 876 ? 220 : 120),
              InkWell(
                onTap: () {
                  Get.off(NavigationBarBottom());
                },
                child: Container(
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: ColorResources.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                          fontWeight: FontWeight.w700,
                          fontSize: 13.5,
                          color: ColorResources.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Do you not have a MyBank account?",
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w300,
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      color: ColorResources.white2,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(SignUpScreen()),
                        text: " Sign up here",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                          fontWeight: FontWeight.w300,
                          color: ColorResources.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
