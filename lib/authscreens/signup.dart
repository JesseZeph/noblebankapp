import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybankapp/authscreens/loginscreen.dart';
import 'package:mybankapp/colors/colors.dart';
import 'package:mybankapp/routscreens/routwidget.dart';
import 'package:mybankapp/textfontfamily/textfontfamily.dart';
import 'package:mybankapp/welcomescreen/welcomescreen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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

  TextFormField textFormField(String hint) {
    return TextFormField(
      style: TextStyle(
        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
        fontSize: 13,
        color: ColorResources.grey2,
      ),
      cursorColor: ColorResources.blue1,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorResources.grey1.withOpacity(0.05),
        hintText: hint,
        isDense: true,
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
        border: OutlineInputBorder(
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
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1,
            color: ColorResources.blue1.withOpacity(0.6),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Create Account",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticNeueCyrBold,
                    fontSize: 35,
                    color: ColorResources.red),
              ),
              SizedBox(height: 7),
              Text(
                "Open a MyBank account with a few details.",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 15,
                    color: ColorResources.white1),
              ),
              SizedBox(height: 45),
              text("Full name"),
              SizedBox(height: 10),
              textFormField("John Doe"),
              SizedBox(height: 20),
              text("Phone number"),
              SizedBox(height: 10),
              textFormField("+ 234 808 762 1236"),
              SizedBox(height: 20),
              text("Password"),
              SizedBox(height: 10),
              textFormField("*********"),
              SizedBox(height: 20),
              text("Repeat password"),
              SizedBox(height: 10),
              textFormField("*********"),
              SizedBox(height: Get.height >= 876 ? 150 : 50),
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
                      "CREATE YOUR FREE ACCOUNT",
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
                    text: "Do you already have a MyBank account?",
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w300,
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      color: ColorResources.white2,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(LogInScreen()),
                        text: "  Sign in here",
                        style: TextStyle(
                          fontSize: 14,
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
