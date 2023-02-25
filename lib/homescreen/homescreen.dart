import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../extensions/on_string.dart';
import 'package:shimmer/shimmer.dart';

import '../colors/colors.dart';
import '../homescreen/bottomsheetwidget/addmonybottomsheetwidget.dart';
import '../homescreen/bottomsheetwidget/emergencysavemoneybottomsheetwidget.dart';
import '../homescreen/bottomsheetwidget/withdrawmoneybottomsheetwidget.dart';
import '../images/images.dart';
import '../models/user_model.dart';
import '../routes/route_names.dart';
import '../services/user_services.dart';
import '../textfontfamily/textfontfamily.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // String number = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userDetailProvider);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      appBar: AppBar(
        backgroundColor: ColorResources.backGroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 15, top: 10),
          child: CircleAvatar(
            backgroundColor: ColorResources.blue,
            radius: 35,
            child: SvgPicture.asset(Images.lineicon),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userDetails.when(
                loading: () => Shimmer.fromColors(
                  baseColor: ColorResources.grey2,
                  highlightColor: Colors.white,
                  child: Container(
                    color: ColorResources.grey,
                    height: 36,
                    width: 110,
                  ),
                ),
                data: (UserModel data) => Text(
                  "Hello ${data.fullname!.first.toTitle},",
                  style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: ColorResources.white,
                  ),
                ),
                error: (Object error, StackTrace stackTrace) => Text(
                  'error',
                  style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: ColorResources.white,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Good morning, remember to save today",
                    style: TextStyle(
                        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                        fontSize: 13,
                        color: ColorResources.white1),
                  ),
                  SizedBox(width: 5),
                  Image.asset(Images.dolarimage),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Total Savings",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 14,
                    color: ColorResources.white1),
              ),
            ),
            //SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "₦ 200,000",
                style: TextStyle(
                    fontFamily: TextFontFamily.helveticNeueCyrBold,
                    fontSize: 40,
                    color: ColorResources.white4),
              ),
            ),
            //SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: inkwell(
                      size,
                      Images.addmonyimage,
                      "Add money",
                      () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => AddMoneyBottomSheetWidget(),
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: inkwell(
                      size,
                      Images.withdrawmonyimage,
                      "Withdraw",
                      () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              WithdrawMoneyBottomSheetWidget(),
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: ColorResources.blue2,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("Get your money working for you"),
                    SizedBox(height: 20),
                    inkwell2(Images.savemonyimage, "Save for an emergency", () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            EmergencySaveAMoneyBottomSheetWidget(),
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                      );
                    }),
                    SizedBox(height: 20),
                    inkwell2(
                      Images.investmonyimage,
                      "Invest your money",
                      () => context.goNamed(RouteName.investMoneyScreen),
                    ),
                    SizedBox(height: 35),
                    text("Ways to earn more money"),
                    SizedBox(height: 20),
                    inkwell2(
                      Images.bonusimage,
                      "Invite your friends and get a bonus",
                      () => context.goNamed(RouteName.rewardScreen),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
          fontWeight: FontWeight.w500,
          fontSize: 17,
          color: ColorResources.white),
    );
  }

  InkWell inkwell(Size size, String image, String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorResources.blue1,
            width: 1,
          ),
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                image,
                height: 25,
                width: 25,
              ),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  fontFamily: TextFontFamily.helveticaNeueCyrMedium,
                  color: ColorResources.blue1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell inkwell2(String image, String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorResources.blue,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: ColorResources.grey4,
            child: SvgPicture.asset(image),
          ),
          title: Text(
            text,
            style: TextStyle(
                fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                fontSize: 15,
                color: ColorResources.white),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: ColorResources.white,
            size: 15,
          ),
        ),
      ),
    );
  }
}
