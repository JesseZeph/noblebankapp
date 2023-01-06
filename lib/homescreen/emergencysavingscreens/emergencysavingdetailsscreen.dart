import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybankapp/colors/colors.dart';
import 'package:mybankapp/homescreen/savemonydetailsscreens/congrationsscreen.dart';
import 'package:mybankapp/routscreens/routwidget.dart';
import 'package:mybankapp/textfontfamily/textfontfamily.dart';

class EmergencySavingDetailScreen extends StatelessWidget {
  const EmergencySavingDetailScreen({Key? key}) : super(key: key);

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
        cursorColor: ColorResources.blue1,
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
      backgroundColor: ColorResources.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    selectedIndex = 0;
                    Navigator.of(context, rootNavigator: true)
                        .pushReplacement(MaterialPageRoute(
                      builder: (context) => NavigationBarBottom(),
                    ));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: ColorResources.white,
                    size: 18,
                  ),
                ),
              ),
              SizedBox(height: 45),
              Container(
                color: ColorResources.grey1.withOpacity(0.05),
                child: TextFormField(
                  style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 13,
                    color: ColorResources.grey2,
                  ),
                  cursorColor: ColorResources.blue1,
                  decoration: InputDecoration(
                    fillColor: ColorResources.grey1.withOpacity(0.05),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelText: "Amount",
                    labelStyle: TextStyle(
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontSize: 15,
                      color: ColorResources.white,
                    ),
                    hintText: "₦1000",
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
              ),
              SizedBox(height: 20),
              text("Phone number"),
              SizedBox(height: 10),
              textFormField("+ 234 808 762 1236"),
              SizedBox(height: 20),
              text("Wallet Name"),
              SizedBox(height: 10),
              textFormField("School Fees"),
              SizedBox(height: 20),
              text("Target amount"),
              SizedBox(height: 10),
              textFormField("Enter the amount you want to reach"),
              SizedBox(height: 20),
              text("Customer Name"),
              SizedBox(height: 10),
              textFormField("John Doe"),
              SizedBox(height: 20),
              text("Pin"),
              SizedBox(height: 10),
              textFormField("****"),
              SizedBox(height: Get.height >= 876 ? 140 : 40),
              InkWell(
                onTap: () {
                  Get.off(CongratulationsScreen());
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
                      "SAVE",
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
    );
  }
}
