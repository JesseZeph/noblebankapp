import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './route_imports.dart';
import '../services/auth_service.dart';
import '../services/pref_service.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  ProviderSubscription? subscription;
  final _prefs = SharedPreferences.getInstance();
  RouterNotifier(this._ref) {
    subscription = _ref.listen(
      authStateProvider,
      (_, __) => notifyListeners(),
    );
    _ref.onDispose(() {
      subscription?.close();
    });
  }
  @override
  void dispose() {
    subscription?.close();
    super.dispose();
  }

  FutureOr<String?> redirectLogic(
      BuildContext context, GoRouterState state) async {
    final SharedPreferences pref = await _prefs;
    final authState = _ref.read(authStateProvider);
    if (authState.isLoading || authState.hasError) return null;
    final isAuth = authState.valueOrNull != null;
    final isOnboard = state.location == '/${RouteName.onboardingScreen}';
    final bool onboard = pref.containsKey(PrefService.onboarding);
    if (isOnboard) {
      return onboard ? '/${RouteName.welcomeScreen}' : null;
    }
    final isSignup = state.location == '/${RouteName.signUpScreen}';
    if (isSignup) {
      return isAuth ? '/' : null;
    }
    final isLogin = state.location == '/${RouteName.logInScreen}';
    if (isLogin) {
      return isAuth ? '/' : null;
    }
    final isWelcome = state.location == '/${RouteName.welcomeScreen}';
    if (isWelcome) {
      return isAuth ? '/' : null;
    }
    final isSplash = state.location == '/${RouteName.splashScreen}';
    if (!isAuth && (isSplash || isOnboard)) {
      return null;
    }
    if (!isAuth && !(isSplash || isOnboard)) {
      return '/${RouteName.welcomeScreen}';
    }
    // return (isAuth || isSplash) ? null : '/${RouteName.welcomeScreen}';
    return null;
  }

  List<RouteBase> routes = <RouteBase>[
    GoRoute(
      name: RouteName.mainScreen,
      path:
          '/${RouteName.mainScreen}/:tab(home|save|portfolio|rewards|account)',
      builder: (context, state) {
        final tab = state.params['tab']!;
        return MainScreen(tab: tab);
      },
    ),
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
    // GoRoute(
    //   name: RouteName.buttombar,
    //   path: '/${RouteName.buttombar}',
    //   builder: (context, state) => NavigationBarBottom(),
    // ),
    GoRoute(
      name: RouteName.saveScreen,
      path: '/${RouteName.saveScreen}',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        transitionDuration: Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
        child: SaveScreen(),
      ),
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
      builder: (context, state) {
        final number = state.queryParams['amount']!;
        return EmergencySavingDetailScreen(amount: number);
      },
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
    GoRoute(
      path: '/',
      name: RouteName.homeScreen,
      redirect: (_, __) => '/${RouteName.mainScreen}/${RouteName.homeScreen}',
    ),
    // GoRoute(
    //   path: '/${RouteName.saveScreen}',
    //   name: RouteName.saveScreen,
    //   redirect: (_, __) => '/${RouteName.mainScreen}/${RouteName.saveScreen}',
    // ),
    GoRoute(
      path: '/${RouteName.portfolioScreen}',
      name: RouteName.portfolioScreen,
      redirect: (_, __) =>
          '/${RouteName.mainScreen}/${RouteName.portfolioScreen}',
    ),
    GoRoute(
      path: '/${RouteName.accountScreen}',
      name: RouteName.accountScreen,
      redirect: (_, __) =>
          '/${RouteName.mainScreen}/${RouteName.accountScreen}',
    ),
  ];
}
