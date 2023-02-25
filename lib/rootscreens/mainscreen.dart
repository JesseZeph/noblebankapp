import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../accountscreens/accountscreen.dart';
import '../colors/colors.dart';
import '../homescreen/homescreen.dart';
import '../images/images.dart';
import '../portfolioscreen/portfolioscreen.dart';
import '../rewardsscreen/rewardsscreen.dart';
import '../routes/route_names.dart';
import '../savemoneyscreen/savemoneyscreen.dart';
import '../textfontfamily/textfontfamily.dart';

class MainScreen extends ConsumerStatefulWidget {
  MainScreen({required String tab, Key? key})
      : index = indexFrom(tab),
        super(key: key);
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
  static int indexFrom(String tab) {
    switch (tab) {
      case 'home':
        return 0;
      case 'save':
        return 1;
      case 'portfolio':
        return 2;
      case 'rewards':
        return 3;
      case 'account':
        return 4;
      default:
        return 0;
    }
  }
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: HomeScreen()),
          SaveScreen(),
          PortFolioScreen(),
          RewardsScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                Images.home,
                color: _selectedIndex == 0
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
                color: _selectedIndex == 1
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
                color: _selectedIndex == 2
                    ? ColorResources.red
                    : ColorResources.grey3,
              ),
            ),
            label: "Portfolio",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                Images.rewards,
                color: _selectedIndex == 3
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
                color: _selectedIndex == 4
                    ? ColorResources.red
                    : ColorResources.grey3,
              ),
            ),
            label: "Account",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        unselectedItemColor: ColorResources.white3,
        selectedItemColor: ColorResources.red,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          switch (index) {
            case 0:
              context.goNamed(RouteName.homeScreen);
              break;
            case 1:
              context.goNamed(RouteName.saveScreen);
              break;
            case 2:
              context.goNamed(RouteName.portfolioScreen);
              break;
            case 3:
              context.goNamed(RouteName.rewardScreen);
              break;
            case 4:
              context.goNamed(RouteName.accountScreen);
              break;
            default:
          }
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
