import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../colors/colors.dart';
import '../textfontfamily/textfontfamily.dart';

class AppTextFormField extends ConsumerWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool isLogin;
  AppTextFormField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.hintText,
    this.validator,
    this.isLogin = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: isLogin ? ColorResources.grey1.withOpacity(0.05) : null,
      child: TextFormField(
        controller: controller,
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
          hintText: hintText,
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
      ),
    );
  }
}
