import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// import 'package:get/get.dart';
import '../../colors/colors.dart';
import '../../images/images.dart';
import '../../routes/route_names.dart';
import '../../textfontfamily/textfontfamily.dart';

// ignore: must_be_immutable
class InvestMoneyScreen extends StatelessWidget {
  InvestMoneyScreen({Key? key}) : super(key: key);

  List<Map> listViewList = [
    {"Text": "Real Estate"},
    {"Text": "Agriculture"},
    {"Text": "Gold"},
    {"Text": "Transportation"},
    {"Text": "Real Estate"},
  ];

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

  Container container1(String text) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: ColorResources.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                fontSize: 15,
                color: ColorResources.white),
          ),
        ),
      ),
    );
  }

  Builder container() {
    return Builder(builder: (context) {
      final Size size = MediaQuery.of(context).size;
      return Container(
        height: 200,
        width: size.width,
        decoration: BoxDecoration(
          color: ColorResources.backGroundColor,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorResources.white,
                              child: Icon(Icons.close,
                                  color: ColorResources.backGroundColor),
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
                              padding: const EdgeInsets.only(
                                  top: 20, left: 15, right: 15),
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
                                  SizedBox(
                                      height: size.height >= 876 ? 30 : 15),
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: Image.asset(Images.gridimage),
                                    trailing: Column(
                                      children: [
                                        SizedBox(height: 5),
                                        Text(
                                          "20%",
                                          style: TextStyle(
                                              fontFamily: TextFontFamily
                                                  .helveticaNeueCyrRoman,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: ColorResources.green),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Returns in 9 months",
                                          style: TextStyle(
                                              fontFamily: TextFontFamily
                                                  .helveticaNeueCyrRoman,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: ColorResources.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      height: size.height >= 876 ? 30 : 15),
                                  Text(
                                    "Propertyvest Estate Investment",
                                    style: TextStyle(
                                        fontFamily: TextFontFamily
                                            .helveticaNeueCyrRoman,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: ColorResources.white),
                                  ),
                                  SizedBox(height: size.height >= 876 ? 15 : 8),
                                  Text(
                                    "by PropertyVest",
                                    style: TextStyle(
                                        fontFamily: TextFontFamily
                                            .helveticaNeueCyrRoman,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13,
                                        color: ColorResources.white2),
                                  ),
                                  SizedBox(
                                      height: size.height >= 876 ? 40 : 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      container1("₦5,000"),
                                      container1("₦10,000"),
                                      container1("₦20,000"),
                                    ],
                                  ),
                                  SizedBox(
                                      height: size.height >= 876 ? 20 : 10),
                                  Row(
                                    children: [
                                      container1("₦50,000"),
                                      SizedBox(width: 20),
                                      Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: ColorResources.blue,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: Text(
                                              "Enter other amount",
                                              style: TextStyle(
                                                  fontFamily: TextFontFamily
                                                      .helveticaNeueCyrRoman,
                                                  fontSize: 15,
                                                  color: ColorResources.grey2),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: size.height >= 876 ? 45 : 20),
                                  text("Phone Number"),
                                  SizedBox(height: 10),
                                  textFormField("+234 806 123 8970"),
                                  SizedBox(height: 20),
                                  text("Customer Name"),
                                  SizedBox(height: 10),
                                  textFormField("John Doe"),
                                  SizedBox(height: 20),
                                  text("Pin"),
                                  SizedBox(height: 10),
                                  textFormField("****"),
                                  SizedBox(height: 20),
                                  InkWell(
                                    onTap: () => context
                                        .goNamed(RouteName.investReviewScreen),
                                    child: Container(
                                      height: 50,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                        color: ColorResources.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "CONTINUE",
                                          style: TextStyle(
                                              fontFamily: TextFontFamily
                                                  .helveticNeueCyrBold,
                                              fontSize: 15,
                                              color: ColorResources.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Learn more aboout the investment",
                                        style: TextStyle(
                                            fontFamily: TextFontFamily
                                                .helveticaNeueCyrRoman,
                                            fontSize: 17,
                                            color: ColorResources.red),
                                      ),
                                      SizedBox(width: 20),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorResources.red,
                                        size: 20,
                                      ),
                                    ],
                                  ),
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
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  width: 275,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorResources.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(Images.gridimage),
                          trailing: Column(
                            children: [
                              SizedBox(height: 5),
                              Text(
                                "20%",
                                style: TextStyle(
                                    fontFamily:
                                        TextFontFamily.helveticaNeueCyrMedium,
                                    fontSize: 15,
                                    color: ColorResources.green),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Returns in 9 months",
                                style: TextStyle(
                                    fontFamily:
                                        TextFontFamily.helveticaNeueCyrRoman,
                                    fontSize: 15,
                                    color: ColorResources.blue3),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Propertyvest Estate",
                              style: TextStyle(
                                  fontFamily:
                                      TextFontFamily.helveticaNeueCyrMedium,
                                  fontSize: 18,
                                  color: ColorResources.blue3),
                            ),
                            SizedBox(height: 10),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Column(
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    "₦5,000",
                                    style: TextStyle(
                                        fontFamily: TextFontFamily
                                            .helveticaNeueCyrRoman,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: ColorResources.blue3),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "per unit",
                                    style: TextStyle(
                                        fontFamily: TextFontFamily
                                            .helveticaNeueCyrRoman,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: ColorResources.blue3),
                                  ),
                                ],
                              ),
                              trailing: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: ColorResources.white5,
                                ),
                                child: Center(
                                  child: Text(
                                    "Still selling",
                                    style: TextStyle(
                                        fontFamily: TextFontFamily
                                            .helveticaNeueCyrMedium,
                                        fontSize: 13,
                                        color: ColorResources.green),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, bottom: 20, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    // selectedIndex = 0;
                    context.goNamed(RouteName.homeScreen);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: ColorResources.white,
                    size: 18,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Text(
                "Choose an\ninvestment platform",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 30,
                    color: ColorResources.white),
              ),
              SizedBox(height: 15),
              Text(
                "Not sure what you want to invest in?",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 17,
                    color: ColorResources.white),
              ),
              SizedBox(height: 5),
              Text(
                "See recommendations.",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 17,
                    color: ColorResources.green),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorResources.blue,
                ),
                child: TextFormField(
                  style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 13,
                    color: ColorResources.grey2,
                  ),
                  cursorColor: ColorResources.white,
                  decoration: InputDecoration(
                    fillColor: ColorResources.blue,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    prefixIcon: Icon(Icons.search, color: ColorResources.white),
                    hintText: "Search for investment",
                    hintStyle: TextStyle(
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                      color: ColorResources.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                        color: ColorResources.blue,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                        color: ColorResources.blue,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                        color: ColorResources.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                        color: ColorResources.blue,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 34,
                width: size.width,
                decoration: BoxDecoration(
                  color: ColorResources.backGroundColor,
                ),
                child: ListView.builder(
                  itemCount: listViewList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Container(
                        height: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorResources.blue,
                          border:
                              Border.all(color: ColorResources.blue1, width: 1),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              listViewList[index]["Text"],
                              style: TextStyle(
                                  fontFamily:
                                      TextFontFamily.helveticaNeueCyrRoman,
                                  fontSize: 15,
                                  color: ColorResources.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              container(),
              SizedBox(height: 30),
              container(),
              SizedBox(height: 30),
              container(),
            ],
          ),
        ),
      ),
    );
  }
}
