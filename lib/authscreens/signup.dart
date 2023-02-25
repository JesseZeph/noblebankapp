import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../colors/colors.dart';
import '../routes/route_names.dart';
import '../services/auth_service.dart';
import '../textfontfamily/textfontfamily.dart';
import '../widgets/textfields.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController,
      _nameController,
      _passwordController,
      __confirmPasswordController;

  // final bool _isLoading = false;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    __confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    __confirmPasswordController.dispose();
    super.dispose();
  }

  void _trySubmit(String name, String email, String password) {
    FocusScope.of(context).unfocus();
    FormState? formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      formState.save();
      ref
          .read(authServiceProvider)
          .signup(name: name, email: email, password: password);
    }
  }

  // TextFormField textFormField(String? hint, String? Function(String?) validator,
  //     void Function(String?) onSaved,
  //     {bool obscureText = false}) {
  //   return TextFormField(
  //     // controller: controller,
  //     style: TextStyle(
  //       fontFamily: TextFontFamily.helveticaNeueCyrRoman,
  //       fontSize: 13,
  //       color: ColorResources.grey2,
  //     ),
  //     obscureText: obscureText,
  //     cursorColor: ColorResources.blue1,
  //     decoration: InputDecoration(
  //       filled: true,
  //       fillColor: ColorResources.grey1.withOpacity(0.05),
  //       hintText: hint,
  //       isDense: true,
  //       hintStyle: TextStyle(
  //         fontFamily: TextFontFamily.helveticaNeueCyrRoman,
  //         fontSize: 13,
  //         color: ColorResources.grey2,
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(
  //           width: 1,
  //           color: ColorResources.blue1.withOpacity(0.6),
  //         ),
  //       ),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(
  //           width: 1,
  //           color: ColorResources.blue1.withOpacity(0.6),
  //         ),
  //       ),
  //       errorBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(
  //           width: 1,
  //           color: ColorResources.blue1.withOpacity(0.6),
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(
  //           width: 1,
  //           color: ColorResources.blue1.withOpacity(0.6),
  //         ),
  //       ),
  //       focusedErrorBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(
  //           width: 1,
  //           color: ColorResources.blue1.withOpacity(0.6),
  //         ),
  //       ),
  //     ),
  //     validator: validator,
  //     onSaved: onSaved,
  //   );
  // }

  final _emailAddressRegExp =
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                      AppTextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      // textFormField("", (value) {
                      //   if (value!.isEmpty) {
                      //     return "Please enter your name";
                      //   }
                      //   return null;
                      // }, (value) {
                      //   _name = value!;
                      // }),
                      SizedBox(height: 20),
                      text("Email Address"),
                      SizedBox(height: 10),
                      AppTextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (!_emailAddressRegExp.hasMatch(value!)) {
                            return "Please enter your email address";
                          }
                          return null;
                        },
                      ),
                      // textFormField("", (value) {
                      //   if (!_emailAddressRegExp.hasMatch(value!)) {
                      //     return "Please enter your email address";
                      //   }
                      //   return null;
                      // }, (value) {
                      //   _emailAddress = value!;
                      // }),
                      SizedBox(height: 20),
                      text("Password"),
                      SizedBox(height: 10),
                      AppTextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 characters long";
                          }
                          return null;
                        },
                      ),
                      // textFormField("", (value) {
                      //   if (value!.isEmpty) {
                      //     return "Please enter your password";
                      //   } else if (value.length < 8) {
                      //     return "Password must be at least 8 characters long";
                      //   }
                      //   return null;
                      // }, (value) {
                      //   _password = value!;
                      // }, obscureText: true),
                      SizedBox(height: 20),
                      text("Repeat password"),
                      SizedBox(height: 10),
                      AppTextFormField(
                        controller: __confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          } else if (value != _passwordController.text) {
                            return "Password doesn't match";
                          }
                          return null;
                        },
                      ),
                      // textFormField("", (value) {
                      //   if (value!.isEmpty) {
                      //     return "Please enter your password";
                      //   } else if (value != _password) {
                      //     return "Password doesn't match";
                      //   }
                      //   return null;
                      // }, (value) {
                      //   _confirmPassword = value!;
                      // }, obscureText: true),
                    ],
                  ),
                ),
                SizedBox(height: size.height >= 876 ? 150 : 50),
                ref.watch(authStateProvider).isLoading
                    ? CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          onTap: () => _trySubmit(
                            _nameController.text.trim(),
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
                            ..onTap =
                                () => context.pushNamed(RouteName.logInScreen),
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
      ),
    );
  }

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
}
