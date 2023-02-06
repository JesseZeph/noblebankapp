import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../colors/colors.dart';
import '../images/images.dart';
import '../routes/route_names.dart';
import '../textfontfamily/textfontfamily.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int index = 0;
  List pageviewlist = [
    {
      "image": Images.onBoarding1,
      "text1": "Save money",
      "text2":
          "We help you meet your savings target monthly and our emergency plans enable you save for multiple purposes",
    },
    {
      "image": Images.onBoarding2,
      "text1": "Withdraw your money",
      "text2":
          "With just your phone number, you can withdraw your funds at any point in time from any NobleBank agent close to you.",
    },
    {
      "image": Images.onBoarding3,
      "text1": "Invest your money",
      "text2":
          "Get access to risk free investments that will multiply your income and pay high returns in few months",
    }
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ColorResources.backGroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: InkWell(
              onTap: () => context.goNamed(RouteName.welcomeScreen),
              child: Container(
                height: 35,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38),
                  color: ColorResources.blue,
                ),
                child: Center(
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      color: ColorResources.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: pageviewlist.length,
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (i) {
              setState(
                () {
                  index = i;
                },
              );
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height / 82.1),
                    // SizedBox(height:10),
                    Center(
                      child: Padding(
                        padding:
                            index == 0 ? EdgeInsets.all(30) : EdgeInsets.zero,
                        child: Image.asset(pageviewlist[index]["image"]),
                      ),
                    ),
                    Text(
                      pageviewlist[index]["text1"],
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: TextFontFamily.helveticNeueCyrBold,
                        color: ColorResources.white,
                      ),
                    ),
                    //SizedBox(height: 20),
                    SizedBox(height: size.height / 40.55),
                    Text(
                      pageviewlist[index]["text2"],
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                        color: ColorResources.white,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 40,
            left: 15,
            child: Row(
              children: List.generate(
                pageviewlist.length,
                (position) => Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Container(
                    width: position == index ? 34 : 12,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(index == position ? 32 : 12),
                      color: index == position
                          ? ColorResources.red
                          : ColorResources.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 15,
            child: InkWell(
              onTap: () {
                index == 2
                    ? context.goNamed(RouteName.welcomeScreen)
                    : _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
              },
              child: Container(
                height: 50,
                width: 140,
                decoration: BoxDecoration(
                  color: ColorResources.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                        fontFamily: TextFontFamily.helveticNeueCyrBold,
                        fontSize: 15,
                        color: ColorResources.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
