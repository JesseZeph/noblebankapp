import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import './route_names.dart';
import './route_notifier.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final routerNotifier = RouterNotifier(ref);
    return GoRouter(
      initialLocation: '/${RouteName.splashScreen}',
      debugLogDiagnostics: false,
      refreshListenable: routerNotifier,
      redirect: routerNotifier.redirectLogic,
      routes: routerNotifier.routes,
    );
  },
);
