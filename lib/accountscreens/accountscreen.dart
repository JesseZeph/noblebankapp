import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../colors/colors.dart';
import '../extensions/on_string.dart';
import '../images/images.dart';
import '../models/user_model.dart';
import '../routes/route_names.dart';
import '../services/auth_service.dart';
import '../services/user_services.dart';
import '../textfontfamily/textfontfamily.dart';
import '../widgets/profile_avatar.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  InkWell inkWell(String image, String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(image, color: ColorResources.red),
        title: Text(
          text,
          style: TextStyle(
            fontFamily: TextFontFamily.helveticaNeueCyrRoman,
            fontSize: 17,
            color: ColorResources.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userDetailProvider);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 90, bottom: 5),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                userDetails.when(
                  loading: () => Shimmer.fromColors(
                    baseColor: ColorResources.grey2,
                    highlightColor: Colors.white,
                    child: ProfileAvatar(),
                  ),
                  data: (UserModel data) =>
                      ProfileAvatar(child: Image.asset(Images.personicon)),
                  error: (Object error, StackTrace stackTrace) =>
                      ProfileAvatar(child: Image.asset(Images.personicon)),
                ),
                SizedBox(height: 20),
                userDetails.when(
                  loading: () => Shimmer.fromColors(
                    baseColor: ColorResources.grey2,
                    highlightColor: Colors.white,
                    child: Container(
                      color: ColorResources.grey,
                      height: 38,
                      width: 110,
                    ),
                  ),
                  data: (UserModel data) => Text(
                    data.fullname.toTitle,
                    style: TextStyle(
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontSize: 29,
                      fontWeight: FontWeight.w500,
                      color: ColorResources.white,
                    ),
                  ),
                  error: (Object error, StackTrace stackTrace) =>
                      Text('... ...'),
                ),
                SizedBox(height: 10),
                userDetails.when(
                  loading: () {
                    log('loading');
                    return Shimmer.fromColors(
                      baseColor: ColorResources.grey2,
                      highlightColor: Colors.white,
                      child: Container(
                        color: ColorResources.white,
                        width: 120,
                        height: 18,
                      ),
                    );
                  },
                  data: (UserModel data) {
                    log('done');
                    return Text(
                      '${data.accNo}',
                      style: TextStyle(
                        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                        fontSize: 14,
                        color: ColorResources.grey2,
                      ),
                    );
                  },
                  error: (Object error, StackTrace stackTrace) {
                    log('err');
                    return Text(
                      'err $error',
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
                SizedBox(height: 40),
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                    color: ColorResources.blue2,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          inkWell(
                            Images.notificationicon,
                            "Notification",
                            () => context.pushNamed(RouteName.notificationScreen),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: ColorResources.blue1.withOpacity(0.6),
                          ),
                          inkWell(
                            Images.privacypolicyicon,
                            "Privacy policy",
                            () =>
                                context.pushNamed(RouteName.privacyPolicyScreen),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: ColorResources.blue1.withOpacity(0.6),
                          ),
                          inkWell(
                            Images.termsandconditionsicon,
                            "Terms and conditions",
                            () => context.pushNamed(RouteName.termsAndConditions),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: ColorResources.blue1.withOpacity(0.6),
                          ),
                          inkWell(
                            Images.logouticon,
                            "Logout",
                            () => ref.read(authServiceProvider).logout(),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: ColorResources.blue1.withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
