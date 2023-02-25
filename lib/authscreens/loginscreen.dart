import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../colors/colors.dart';
import '../routes/route_names.dart';
import '../services/auth_service.dart';
import '../textfontfamily/textfontfamily.dart';
import '../widgets/textfields.dart';

class LogInScreen extends ConsumerStatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  // late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController,
      _passwordController,
      _pinPutController;

  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  void initState() {
    // _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _pinPutController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _pinPutController.dispose();
    super.dispose();
  }

  void _trySubmit(String email, String password) {
    FocusScope.of(context).unfocus();
    ref.read(authServiceProvider).login(email, password);
  }

  // Container textFormField(String hint) {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorResources.backGroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => context.goNamed(RouteName.welcomeScreen),
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
                text("Email Address"),
                SizedBox(height: 10),
                AppTextFormField(
                  controller: _emailController,
                  hintText: "johndoe@mail.com",
                ),
                // textFormField("johndoe@mail.com"),
                SizedBox(height: 20),
                text("Password"),
                SizedBox(height: 10),
                AppTextFormField(
                  controller: _passwordController,
                  hintText: "*********",
                ),
                // textFormField("*********"),
                SizedBox(height: 20),
                Text(
                  "Have you forgotten your password?,",
                  style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 15,
                    color: ColorResources.white1,
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    recoverBottomSheet(context, size);
                  },
                  child: Text(
                    "click here to recover it",
                    style: TextStyle(
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontSize: 15,
                      color: ColorResources.red,
                    ),
                  ),
                ),
                SizedBox(height: size.height >= 876 ? 220 : 120),
                InkWell(
                  onTap: () => _trySubmit(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  ),
                  child: Container(
                    height: 50,
                    width: size.width,
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
                            ..onTap =
                                () => context.pushNamed(RouteName.signUpScreen),
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
      ),
    );
  }

  Future<dynamic> recoverBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: ColorResources.white,
                child: Icon(
                  Icons.close,
                  color: ColorResources.backGroundColor,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: ColorResources.blue2,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                          fontFamily: TextFontFamily.helveticNeueCyrBold,
                          fontSize: 35,
                          color: ColorResources.red),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Please enter your email address to recover your password.",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                          fontSize: 15,
                          color: ColorResources.white1),
                    ),
                    SizedBox(height: 30),
                    text("Email Address"),
                    SizedBox(height: 10),
                    AppTextFormField(
                      controller: _emailController,
                      hintText: "johndoe@gmail,com",
                    ),
                    // textFormField("johndoe@gmail,com"),
                    SizedBox(height: size.height >= 876 ? 100 : 40),
                    InkWell(
                      onTap: () {
                        recoverPasswordBottomSheet(context, size);
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
                            "RECOVER PASSWORD",
                            style: TextStyle(
                                fontFamily: TextFontFamily.helveticNeueCyrBold,
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
  }

  Future<dynamic> recoverPasswordBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: ColorResources.white,
                child: Icon(Icons.close, color: ColorResources.backGroundColor),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: ColorResources.blue2,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                      "Verify account",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticNeueCyrBold,
                          fontSize: 35,
                          color: ColorResources.red),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Please enter the CODE sent to your email address in the boxes below.",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                          fontSize: 15,
                          color: ColorResources.white1),
                    ),
                    SizedBox(height: size.height >= 876 ? 70 : 50),
                    Builder(
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45),
                          child: PinPut(
                            fieldsCount: 4,
                            textStyle: TextStyle(
                              fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                              fontSize: 30,
                              color: ColorResources.grey2,
                            ),
                            cursorColor: ColorResources.blue1.withOpacity(0.6),
                            eachFieldHeight: 50,
                            eachFieldWidth: 50,
                            focusNode: _pinPutFocusNode,
                            controller: _pinPutController,
                            submittedFieldDecoration:
                                _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: ColorResources.blue1.withOpacity(0.6),
                              ),
                              color: ColorResources.grey1.withOpacity(0.05),
                            ),
                            selectedFieldDecoration: _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: ColorResources.blue1.withOpacity(0.6),
                              ),
                              color: ColorResources.grey1.withOpacity(0.05),
                            ),
                            followingFieldDecoration:
                                _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: ColorResources.blue1.withOpacity(0.6),
                              ),
                              color: ColorResources.grey1.withOpacity(0.05),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: size.height >= 876 ? 80 : 30),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.only(top: 170),
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () => context.pop(),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: ColorResources.white,
                                      child: Icon(Icons.close,
                                          color:
                                              ColorResources.backGroundColor),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Container(
                                    height: size.height,
                                    width: size.width,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Container(
                                              height: 6,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: ColorResources.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 30),
                                          Text(
                                            "Recover password",
                                            style: TextStyle(
                                                fontFamily: TextFontFamily
                                                    .helveticNeueCyrBold,
                                                fontSize: 35,
                                                color: ColorResources.red),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Please enter your new password to continue",
                                            style: TextStyle(
                                                fontFamily: TextFontFamily
                                                    .helveticaNeueCyrRoman,
                                                fontSize: 15,
                                                color: ColorResources.white1),
                                          ),
                                          // SizedBox(
                                          //     height: Get.height >= 876 ? 70 : 50),
                                          SizedBox(height: 55),
                                          text("New Password"),
                                          SizedBox(height: 9),
                                          AppTextFormField(
                                            controller: _passwordController,
                                            hintText: "*********",
                                          ),
                                          // textFormField("*********"),
                                          SizedBox(height: 22),
                                          text("Confirm Password"),
                                          SizedBox(height: 9),
                                          AppTextFormField(
                                            controller: _passwordController,
                                            hintText: "*********",
                                          ),
                                          // textFormField("*********"),
                                          // SizedBox(
                                          //     height: Get.height >= 876 ? 40 : 20),
                                          SizedBox(height: 85),
                                          InkWell(
                                            onTap: () => context
                                                .goNamed(RouteName.buttombar),
                                            child: Container(
                                              height: 50,
                                              width: size.width,
                                              decoration: BoxDecoration(
                                                color: ColorResources.red,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "CHANGE PASSWORD",
                                                  style: TextStyle(
                                                      fontFamily: TextFontFamily
                                                          .helveticNeueCyrBold,
                                                      fontSize: 15,
                                                      color:
                                                          ColorResources.white),
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
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
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
                            "VERIFY PHONE",
                            style: TextStyle(
                                fontFamily: TextFontFamily.helveticNeueCyrBold,
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

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4),
    );
  }
}
