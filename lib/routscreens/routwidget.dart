import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../accountscreens/accountscreen.dart';
import '../colors/colors.dart';
import '../homescreen/homescreen.dart';
import '../images/images.dart';
import '../portfolioscreen/portfolioscreen.dart';
import '../rewardsscreen/rewardsscreen.dart';
import '../routes/route_names.dart';
import '../routscreens/rout.dart';
import '../savemoneyscreen/savemoneyscreen.dart';
import '../textfontfamily/textfontfamily.dart';

class NavigationBarBottom extends StatefulWidget {
  @override
  _NavigationBarBottomState createState() => _NavigationBarBottomState();
}

int selectedIndex = 0;

class _NavigationBarBottomState extends State<NavigationBarBottom> {
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
    4: GlobalKey(),
  };

  test(testPage) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => testPage,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return !await Navigator.maybePop(
              navigatorKeys[selectedIndex]!.currentState!.context);
        },
        child: IndexedStack(
          index: selectedIndex,
          children: <Widget>[
            NavigatorPage(
                child: Center(
                  child: HomeScreen(),
                ),
                navigatorKey: navigatorKeys[0]),
            NavigatorPage(
              child: SaveScreen(),
              navigatorKey: navigatorKeys[1],
            ),
            NavigatorPage(
              child: PortFolioScreen(),
              navigatorKey: navigatorKeys[2],
            ),
            NavigatorPage(
              child: RewardsScreen(),
              navigatorKey: navigatorKeys[3],
            ),
            NavigatorPage(
              child: AccountScreen(),
              navigatorKey: navigatorKeys[4],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                Images.home,
                color: selectedIndex == 0
                    ? ColorResources.red
                    : ColorResources.grey3,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                Images.save,
                color: selectedIndex == 1
                    ? ColorResources.red
                    : ColorResources.grey3,
              ),
            ),
            label: "Save",
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  Images.portfolio,
                  color: selectedIndex == 2
                      ? ColorResources.red
                      : ColorResources.grey3,
                ),
              ),
              label: "Portfolio"),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                Images.rewards,
                color: selectedIndex == 3
                    ? ColorResources.red
                    : ColorResources.grey3,
              ),
            ),
            label: "Rewards",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                Images.account,
                color: selectedIndex == 4
                    ? ColorResources.red
                    : ColorResources.grey3,
              ),
            ),
            label: "Account",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        unselectedItemColor: ColorResources.white3,
        selectedItemColor: ColorResources.red,
        onTap: (index) {
          if (index == 1) {
            context.goNamed(RouteName.saveScreen);
          } else if (index == 3) {
            context.goNamed(RouteName.rewardScreen);
          }

          setState(() {
            selectedIndex = index;
          });
        },
        elevation: 30,
        backgroundColor: ColorResources.blue2,
        selectedLabelStyle: TextStyle(
          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
          fontSize: 13,
          color: ColorResources.red,
          fontWeight: FontWeight.w300,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
          fontSize: 13,
          color: ColorResources.grey2,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
