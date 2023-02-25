import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';
import '../../colors/colors.dart';
import '../../routes/route_names.dart';
import '../../textfontfamily/textfontfamily.dart';

class WithdrawDetailsScreen extends StatelessWidget {
  const WithdrawDetailsScreen({Key? key}) : super(key: key);

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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      appBar: AppBar(
        backgroundColor: ColorResources.backGroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {
              // selectedIndex = 0;
              context.goNamed(RouteName.homeScreen);
              // Navigator.of(context, rootNavigator: true)
              //     .pushReplacement(MaterialPageRoute(
              //   builder: (context) => NavigationBarBottom(),
              // ));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorResources.white,
              size: 18,
            ),
          ),
        ),
        title: Text(
          "Balance: ₦50,000",
          style: TextStyle(
              fontFamily: TextFontFamily.helveticaNeueCyrRoman,
              fontSize: 17,
              color: ColorResources.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 90),
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
                      color: ColorResources.white,
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
              text("Customer Name"),
              SizedBox(height: 10),
              textFormField("John Doe"),
              SizedBox(height: 20),
              text("Pin"),
              SizedBox(height: 10),
              textFormField("****"),
              SizedBox(height: size.height >= 876 ? 250 : 150),
              InkWell(
                onTap: () =>context.goNamed(RouteName.withdrawsFaildScreen),
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: ColorResources.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "WITHDRAW",
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
