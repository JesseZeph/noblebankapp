import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybankapp/colors/colors.dart';
import 'package:mybankapp/images/images.dart';
import 'package:mybankapp/textfontfamily/textfontfamily.dart';

class PortFolioScreen extends StatelessWidget {
  const PortFolioScreen({Key? key}) : super(key: key);

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: ColorResources.white),
    );
  }

  Text text1(String text) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
          fontSize: 23,
          fontWeight: FontWeight.w500,
          color: ColorResources.white),
    );
  }

  Row row(String text, text1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontFamily: TextFontFamily.helveticaNeueCyrRoman,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: ColorResources.white),
        ),
        Text(
          text1,
          style: TextStyle(
              fontFamily: TextFontFamily.helveticaNeueCyrRoman,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: ColorResources.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: ColorResources.backGroundColor,
        elevation: 0,
        title: Text(
          "My Portfolio",
          style: TextStyle(
              fontFamily: TextFontFamily.helveticNeueCyrBold,
              fontSize: 17,
              color: ColorResources.white),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  Images.portfolioImage,
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: ColorResources.blue4,
                      ),
                      SizedBox(width: 5),
                      text("Savings"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: ColorResources.blue5,
                      ),
                      SizedBox(width: 5),
                      text("Investments"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: ColorResources.blue5,
                      ),
                      SizedBox(width: 5),
                      text("Emergency funds"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              text1("Savings"),
              SizedBox(height: 20),
              Divider(
                thickness: 0.5,
                color: ColorResources.blue1.withOpacity(0.6),
              ),
              SizedBox(height: 20),
              row("Savings balance", "\₦10,000.21"),
              SizedBox(height: 40),
              text1("Investments"),
              SizedBox(height: 20),
              Divider(
                thickness: 0.5,
                color: ColorResources.blue1.withOpacity(0.6),
              ),
              SizedBox(height: 20),
              row("Investment balance", "\₦16,000"),
              SizedBox(height: 8),
              row("Gold", "\₦8,000"),
              SizedBox(height: 8),
              row("Agriculture", "\₦6,000"),
              SizedBox(height: 8),
              row("Real Estate", "\₦2,000"),
              SizedBox(height: 20),
              // text1("Emergency funds"),
              // SizedBox(height: 20),
              // Divider(
              //   thickness: 0.5,
              //   color: ColorResources.blue1.withOpacity(0.6),
              // ),
              // SizedBox(height: 20),
              // row("Total balance", ₦5,000"),
            ],
          ),
        ),
      ),
    );
  }
}
