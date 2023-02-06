import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  final dynamic navigatorKey;
  final Widget child;

  @override
  _NavigatorPageState createState() => _NavigatorPageState();

  NavigatorPage({required this.navigatorKey, required this.child});
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalKey<NavigatorState>(
        debugLabel: 'nested key: ${widget.navigatorKey.toString()}',
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          maintainState: false,
          fullscreenDialog: false,
          builder: (context) {
            return Scaffold(
              body: widget.child,
            );
          },
        );
      }, //
    );
  }
}
