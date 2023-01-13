import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybankapp/authscreens/loginscreen.dart';
import 'package:mybankapp/colors/colors.dart';
import 'package:mybankapp/routscreens/routwidget.dart';
import 'package:mybankapp/textfontfamily/textfontfamily.dart';
import 'package:mybankapp/welcomescreen/welcomescreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _emailAddress = '';
  late String _password;
  late String _confirmPassword;
  final bool _isLoading = false;

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
        color: ColorResources.white,
      ),
    );
  }

  TextFormField textFormField(String hint, String? Function(String?) validator,
      void Function(String?) onSaved,
      {bool obscureText = false}) {
    return TextFormField(
      style: TextStyle(
        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
        fontSize: 13,
        color: ColorResources.grey2,
      ),
      obscureText: obscureText,
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
      validator: validator,
      onSaved: onSaved,
    );
  }

  // phone emailAddress validation
  // ignore: valid_regexps
  final _emailAddressRegExp = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

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
                "Open a Noble Bank account with a few details.",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 15,
                    color: ColorResources.white1),
              ),
              SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("Full name"),
                    SizedBox(height: 10),
                    textFormField("", (value) {
                      if (value!.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    }, (value) {
                      _name = value!;
                    }),
                    SizedBox(height: 20),
                    text("Email Address"),
                    SizedBox(height: 10),
                    textFormField("", (value) {
                      if (!_emailAddressRegExp.hasMatch(value!)) {
                        return "Please enter your email address";
                      }
                      return null;
                    }, (value) {
                      _emailAddress = value!;
                    }),
                    SizedBox(height: 20),
                    text("Password"),
                    SizedBox(height: 10),
                    textFormField("", (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters long";
                      }
                      return null;
                    }, (value) {
                      _password = value!;
                    }, obscureText: true),
                    SizedBox(height: 20),
                    text("Repeat password"),
                    SizedBox(height: 10),
                    textFormField("", (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      } else if (value != _password) {
                        return "Password doesn't match";
                      }
                      return null;
                    }, (value) {
                      _confirmPassword = value!;
                    }, obscureText: true),
                  ],
                ),
              ),
              SizedBox(height: Get.height >= 876 ? 150 : 50),
              _isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: InkWell(
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
                                  fontFamily:
                                      TextFontFamily.helveticaNeueCyrRoman,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13.5,
                                  color: ColorResources.white),
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Do you already have a Noble Bank account?",
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
