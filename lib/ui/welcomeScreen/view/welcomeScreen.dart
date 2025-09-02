import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/ui/homeScreen/view/homeScreen.dart';
import 'package:zohosystem/ui/landingScreen/view/landingScreen.dart';
import 'package:zohosystem/utils/colors.dart';

import '../../../apiCalling/saveUserData.dart';
import '../../../utils/images.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handleNavigation();
  }

  Future<void> getdata() async {
    print('userData : $userData');
    userData = await SaveDataLocal.getDataFromLocal();
  }

  Future<void> handleNavigation() async {
    await getdata();
    print('userData : $userData');
    Timer(
      const Duration(seconds: 3),
      () async {
        if (userData == null) {
          await Get.offAll(const LandingScreen(), transition: Transition.fade);
        } else {
          await Get.offAll(
            const Homescreen(),
            transition: Transition.fade,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
              width: 80.w,
              child: Image.asset(
                Imgs.namedLogo,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
