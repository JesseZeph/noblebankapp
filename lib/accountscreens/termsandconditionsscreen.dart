import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';
import '../colors/colors.dart';
import '../routscreens/routwidget.dart';
import '../textfontfamily/textfontfamily.dart';

import '../routes/route_names.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  Text text(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: TextFontFamily.helveticaNeueCyrLight,
          fontSize: 15,
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
            selectedIndex = 4;
            context.goNamed(RouteName.buttombar);
            // Navigator.of(context, rootNavigator: true)
            //     .pushReplacement(MaterialPageRoute(
            //   builder: (context) => NavigationBarBottom(),
            // ));
          },
          child:
              Icon(Icons.arrow_back_ios, color: ColorResources.white, size: 15),
        ),
        title: Text(
          "Terms and conditions",
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
                const EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 10),
            child: Container(
              height: size.height,
              width: size.width,
              color: ColorResources.backGroundColor,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Review Terms & Conditions",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                          fontSize: 17,
                          color: ColorResources.red),
                    ),
                    SizedBox(height: 15),
                    text(
                      "Your privacy is important to us. It is Brainstorming's policy to respect your privacy regarding any information we may collect from you across our website, and other sites we own and operate.",
                    ),
                    SizedBox(height: 20),
                    text(
                      "We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.",
                    ),
                    SizedBox(height: 20),
                    text(
                      "We only retain collected information for as long as necessary to provide you with your requested service. ",
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Terms & Condition",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                          fontSize: 17,
                          color: ColorResources.red),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                          fontSize: 17,
                          color: ColorResources.red),
                    ),
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
                  onTap: ()=> Navigator.of(context).pop(),
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
                  onTap: () =>Navigator.of(context).pop(),
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
