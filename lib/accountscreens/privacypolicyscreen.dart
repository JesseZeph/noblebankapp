import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';
import '../colors/colors.dart';
import '../textfontfamily/textfontfamily.dart';

import '../routes/route_names.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: TextFontFamily.helveticaNeueCyrLight,
          fontSize: 14,
          color: ColorResources.grey2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorResources.backGroundColor,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,
                color: ColorResources.white, size: 15)),
        title: Text(
          "Privacy policy",
          style: TextStyle(
              fontFamily: TextFontFamily.helveticNeueCyrBold,
              fontSize: 17,
              color: ColorResources.white),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 10),
            child: Container(
              height: size.height,
              width: size.width,
              color: ColorResources.backGroundColor,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                          fontSize: 17,
                          color: ColorResources.red),
                    ),
                    SizedBox(height: 15),
                    text(
                      "Contrary to popular belief, Lorem Ipsum is not simply"
                      "random text. It has roots in a piece of classical Latin literature from 45 BC,"
                      "making it over 2000 years old. Richard McClintock, a Latin professor at",
                    ),
                    SizedBox(height: 20),
                    text(
                      "Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered",
                    ),
                    SizedBox(height: 20),
                    text(
                      "the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero,",
                    ),
                    SizedBox(height: 20),
                    text(
                      "written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, ",
                    ),
                    SizedBox(height: 20),
                    text(
                      "Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.",
                    ),
                    SizedBox(height: 20),
                    text(
                      "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, ",
                    ),
                    SizedBox(height: 20),
                    text(
                      "accompanied by English versions from the 1914 translation by H. Rackham.",
                    ),
                    SizedBox(height: 150),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: ColorResources.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "I AGREE",
                        style: TextStyle(
                            fontFamily: TextFontFamily.helveticNeueCyrBold,
                            fontSize: 15,
                            color: ColorResources.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: ColorResources.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "I DISAGREE",
                        style: TextStyle(
                            fontFamily: TextFontFamily.helveticNeueCyrBold,
                            fontSize: 15,
                            color: ColorResources.backGroundColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
