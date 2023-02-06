import 'dart:async';

import 'package:flutter/widgets.dart' show BuildContext, ChangeNotifier;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../accountscreens/notificationscreen.dart';
import '../accountscreens/privacypolicyscreen.dart';
import '../accountscreens/termsandconditionsscreen.dart';
import '../homescreen/emergencysavingscreens/emergencysavingdetailsscreen.dart';
import '../homescreen/investmoneyscreens/investcongratulationsscreen.dart';
import '../homescreen/investmoneyscreens/investmoneyscreen.dart';
import '../homescreen/investmoneyscreens/investreviewscreen.dart';
import '../homescreen/savemonydetailsscreens/congrationsscreen.dart';
import '../homescreen/withdrawmonydetailsscreens/withdrawdetailsscreen.dart';
import '../homescreen/withdrawmonydetailsscreens/withdrawfaildscreen.dart';
import './route_names.dart';
import '../authscreens/loginscreen.dart';
import '../authscreens/signup.dart';
import '../homescreen/savemonydetailsscreens/saveaddmoneydetailsscreen.dart';
import '../onboarding/onboarding.dart';
import '../rewardsscreen/rewardsscreen.dart';
import '../routscreens/routwidget.dart';
import '../savemoneyscreen/savemoneyscreen.dart';
import '../splashscreen/splashscreen.dart';
import '../welcomescreen/welcomescreen.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  ProviderSubscription? subscription;
  RouterNotifier(this._ref) {
    // subscription = _ref.listen(
    //   authControllerProvider,
    //   (_, __) => notifyListeners(),
    // );
    // _ref.onDispose(() {
    //   subscription?.close();
    // });
  }
  @override
  void dispose() {
    subscription?.close();
    super.dispose();
  }

  FutureOr<String?> redirectLogic(BuildContext context, GoRouterState state) {
    return null;
  }

  List<RouteBase> routes = <RouteBase>[
    GoRoute(
      name: RouteName.splashScreen,
      path: '/${RouteName.splashScreen}',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      name: RouteName.onboardingScreen,
      path: '/${RouteName.onboardingScreen}',
      builder: (context, state) => OnBoardingScreen(),
    ),
    GoRoute(
      name: RouteName.welcomeScreen,
      path: '/${RouteName.welcomeScreen}',
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      name: RouteName.signUpScreen,
      path: '/${RouteName.signUpScreen}',
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      name: RouteName.logInScreen,
      path: '/${RouteName.logInScreen}',
      builder: (context, state) => LogInScreen(),
    ),
    GoRoute(
      name: RouteName.buttombar,
      path: '/${RouteName.buttombar}',
      builder: (context, state) => NavigationBarBottom(),
    ),
    GoRoute(
      name: RouteName.saveScreen,
      path: '/${RouteName.saveScreen}',
      builder: (context, state) => SaveScreen(),
    ),
    GoRoute(
      name: RouteName.rewardScreen,
      path: '/${RouteName.rewardScreen}',
      builder: (context, state) => RewardsScreen(),
    ),
    GoRoute(
      name: RouteName.saveDetailScreen,
      path: '/${RouteName.saveDetailScreen}',
      builder: (context, state) => SaveAddMoneyDetailsScreen(),
    ),
    GoRoute(
      name: RouteName.investMoneyScreen,
      path: '/${RouteName.investMoneyScreen}',
      builder: (context, state) => InvestMoneyScreen(),
    ),
    GoRoute(
      name: RouteName.emergencySavingDetailScreen,
      path: '/${RouteName.emergencySavingDetailScreen}',
      builder: (context, state) => EmergencySavingDetailScreen(),
    ),
    GoRoute(
      name: RouteName.withdrawDetailsScreen,
      path: '/${RouteName.withdrawDetailsScreen}',
      builder: (context, state) => WithdrawDetailsScreen(),
    ),
    GoRoute(
      name: RouteName.investReviewScreen,
      path: '/${RouteName.investReviewScreen}',
      builder: (context, state) => InvestReviewScreen(),
    ),
    GoRoute(
      name: RouteName.notificationScreen,
      path: '/${RouteName.notificationScreen}',
      builder: (context, state) => NotificationScreen(),
    ),
    GoRoute(
      name: RouteName.privacyPolicyScreen,
      path: '/${RouteName.privacyPolicyScreen}',
      builder: (context, state) => PrivacyPolicyScreen(),
    ),
    GoRoute(
      name: RouteName.termsAndConditions,
      path: '/${RouteName.termsAndConditions}',
      builder: (context, state) => TermsAndConditions(),
    ),
    GoRoute(
      name: RouteName.congratulationsScreen,
      path: '/${RouteName.congratulationsScreen}',
      builder: (context, state) => CongratulationsScreen(),
    ),
    GoRoute(
      name: RouteName.investCongratulationsScreen,
      path: '/${RouteName.investCongratulationsScreen}',
      builder: (context, state) => InvestCongratulationsScreen(),
    ),
    GoRoute(
      name: RouteName.withdrawsFaildScreen,
      path: '/${RouteName.withdrawsFaildScreen}',
      builder: (context, state) => WithdrawsFaildScreen(),
    ),
  ];
}
