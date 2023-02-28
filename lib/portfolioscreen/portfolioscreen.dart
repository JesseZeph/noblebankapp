import 'dart:math' as math show pi;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../colors/colors.dart';
import '../extensions/on_num.dart';
import '../extensions/on_string.dart';
import '../models/account_model.dart';
import '../services/account_service.dart';
import '../textfontfamily/textfontfamily.dart';

class PortFolioScreen extends ConsumerWidget {
  const PortFolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountDetails = ref.watch(accountDetailsProvider);
    // final accountbal = accountDetails.value;
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
              // Center(
              //   child: SvgPicture.asset(
              //     Images.portfolioImage,
              //     height: 200,
              //     width: 200,
              //   ),
              // ),
              SizedBox(height: 10),
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CustomPaint(
                    size: MediaQuery.of(context).size,
                    painter: AccountPie(
                      radius: 90,
                      savingsPercentage: 60,
                      investmentsPercentage: 25,
                      emergencyPercentage: 15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        accountDetails.when(
                          loading: () {
                            return Text(
                              '...',
                              style: TextStyle(
                                color: ColorResources.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),
                            );
                          },
                          data: (AccountModel data) {
                            return Text(
                              data.totalAmount.addComma.addNairaSymbol,
                              style: TextStyle(
                                color: ColorResources.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),
                            );
                          },
                          error: (Object error, StackTrace stackTrace) {
                            return Text(
                              '....',
                              style: TextStyle(
                                color: ColorResources.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Net Worth',
                          style: TextStyle(
                            color: ColorResources.grey2,
                          ),
                        ),
                      ],
                    ),
                  ),
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
              accountDetails.when(
                loading: () => row("Savings balance", '...'),
                data: (AccountModel data) => row(
                  "Savings balance",
                  data.savings.addComma.addNairaSymbol,
                ),
                error: (Object error, StackTrace stackTrace) =>
                    row("Savings balance", '....'),
              ),

              SizedBox(height: 40),
              text1("Investments"),
              SizedBox(height: 20),
              Divider(
                thickness: 0.5,
                color: ColorResources.blue1.withOpacity(0.6),
              ),
              SizedBox(height: 20),
              accountDetails.when(
                loading: () => row("Investment balance", '...'),
                data: (AccountModel data) => row(
                  "Investment balance",
                  data.totalInvestment.addComma.addNairaSymbol,
                ),
                error: (Object error, StackTrace stackTrace) =>
                    row("Investment balance", '....'),
              ),
              SizedBox(height: 8),
              accountDetails.when(
                loading: () => SizedBox.shrink(),
                data: (AccountModel data) {
                  if (data.investment.isNotEmpty) {
                    return ListView.separated(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.investment.length,
                      itemBuilder: (_, index) {
                        final key = data.investment.keys.toList()[index];
                        final value = data.investment.values.toList()[index];
                        return row(
                          key,
                          value.addComma.addNairaSymbol,
                        );
                      },
                      separatorBuilder: (_, index) {
                        if (index == data.investment.length) {
                          return SizedBox.shrink();
                        }
                        return SizedBox(height: 8);
                      },
                    );
                  }
                  return SizedBox.shrink();
                },
                error: (Object error, StackTrace stackTrace) =>
                    SizedBox.shrink(),
              ),
              // SizedBox(height: 20),
              // row("Agriculture", "₦6,000"),
              // SizedBox(height: 8),
              // row("Real Estate", "₦2,000"),
              // SizedBox(height: 20),
              // text1("Emergency funds"),
              SizedBox(height: 20),
              Divider(
                thickness: 0.5,
                color: ColorResources.blue1.withOpacity(0.6),
              ),
              SizedBox(height: 20),
              accountDetails.when(
                loading: () => row("Total balance", "..."),
                data: (AccountModel data) => row(
                  "Total balance",
                  data.totalAmount.addComma.addNairaSymbol,
                ),
                error: (Object error, StackTrace stackTrace) =>
                    row("Total balance", "...."),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
            color: ColorResources.white,
          ),
        ),
      ],
    );
  }
}

class AccountPie extends CustomPainter {
  final double radius;
  final double savingsPercentage;
  final double investmentsPercentage;
  final double emergencyPercentage;
  AccountPie({
    required this.radius,
    required this.savingsPercentage,
    required this.investmentsPercentage,
    required this.emergencyPercentage,
  });
  // double _degreeToRadians(num degree) {
  //   return (degree * math.pi) / 180.0;
  // }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint savingsPaint = Paint()
      ..color = ColorResources.blue4
      ..strokeWidth = 22
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final investmentPaint = Paint()
      ..color = ColorResources.blue4.withOpacity(.5)
      ..strokeWidth = 22
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final emergencyPaint = Paint()
      ..color = ColorResources.blue4.withOpacity(.2)
      ..strokeWidth = 22
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius);
    canvas.drawArc(
      rect,
      math.pi / 2,
      (math.pi * 2) * ((savingsPercentage - 2.3) / 100),
      // _degreeToRadians(360 * (100 / 90)),
      false,
      savingsPaint,
    );
    canvas.drawArc(
      rect,
      (math.pi * 2) * ((savingsPercentage + 2.3) / 100) + (math.pi / 2),
      (math.pi * 2) * ((investmentsPercentage - 2.3) / 100),
      // _degreeToRadians(360 * (percentage / 90)) + _degreeToRadians(90),
      // _degreeToRadians((360 * (20 / 90))),
      false,
      investmentPaint,
    );
    canvas.drawArc(
      rect,
      (math.pi * 2) * ((savingsPercentage + 2.3) / 100) +
          (math.pi / 2) +
          (math.pi * 2) * ((investmentsPercentage + 2.3) / 100),
      (math.pi * 2) * ((emergencyPercentage - 9) / 100),
      // _degreeToRadians(57),
      // _degreeToRadians(50),
      false,
      emergencyPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
