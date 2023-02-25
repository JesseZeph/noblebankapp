import 'package:flutter/material.dart';

import '../colors/colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ColorResources.white, width: 2),
        color: ColorResources.grey5,
      ),
      child: child,
    );
  }
}
