import 'dart:async';

import 'package:flutter/widgets.dart' show BuildContext, ChangeNotifier;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../onboarding/onboarding.dart';
import '../splashscreen/splashscreen.dart';
import 'route_names.dart';

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
  ];
}
