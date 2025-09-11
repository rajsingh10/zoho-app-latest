import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/ui/homeScreen/view/homeScreen.dart';
import 'package:zohosystem/ui/landingScreen/view/landingScreen.dart';
import 'package:zohosystem/utils/colors.dart';

import '../../../apiCalling/buildErrorDialog.dart';
import '../../../apiCalling/checkInternetModule.dart';
import '../../../apiCalling/saveUserData.dart';
import '../../../apiCalling/saveUserToken.dart';
import '../../../utils/images.dart';
import '../../../utils/snackBars.dart';
import '../../authentications/login/modal/authTokenModal.dart';
import '../../authentications/login/provider/loginProvider.dart';

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
      const Duration(seconds: 2),
      () async {
        if (userData == null) {
          await Get.offAll(const LandingScreen(), transition: Transition.fade);
        } else {
          fetchAuthtokenApi();
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

  fetchAuthtokenApi() {
    SaveAuthtokenData.removeAuthToken();
    checkInternet().then((internet) async {
      if (internet) {
        LoginProvider().refreshTokenApi().then((response) async {
          authtoken = AuthtokenModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            await Get.offAll(
              const Homescreen(),
              transition: Transition.fade,
            );
            SaveAuthtokenData.saveAuthData(authtoken!);
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Token Error", message: sendOtp?.message ?? '');
            setState(() {
              // isLoading = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Token Error',
              message: 'Internal Server Error',
            );
            setState(() {
              // isLoading = false;
            });
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Token Error',
            message: 'Internal Server Error',
          );
          setState(() {
            // isLoading = false;
          });
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
