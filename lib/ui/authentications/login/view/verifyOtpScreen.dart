import 'dart:convert';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/main.dart';
import 'package:zohosystem/ui/authentications/login/modal/checkIdModal.dart';
import 'package:zohosystem/ui/authentications/login/modal/userDataModal.dart';
import 'package:zohosystem/utils/colors.dart';
import 'package:zohosystem/utils/fontFamily.dart';
import 'package:zohosystem/utils/images.dart';
import 'package:zohosystem/utils/snackBars.dart';

import '../../../../apiCalling/Loader.dart';
import '../../../../apiCalling/apiConfig.dart';
import '../../../../apiCalling/buildErrorDialog.dart';
import '../../../../apiCalling/checkInternetModule.dart';
import '../../../../apiCalling/saveUserData.dart';
import '../../../homeScreen/view/homeScreen.dart';
import '../modal/sendOtpModal.dart';
import '../provider/loginProvider.dart';

// ignore: must_be_immutable
class VerifyOtpScreen extends StatefulWidget {
  String? emailAddress, phoneNumber, type, countryCode, customerid;

  VerifyOtpScreen(
      {super.key,
      required this.emailAddress,
      required this.countryCode,
      required this.phoneNumber,
      required this.customerid,
      required this.type});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _pinController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          SizedBox(
            height: Device.height,
            width: Device.width,
            child: Stack(
              children: [
                Positioned(
                  top: 7.h,
                  right: -18.w,
                  child: Image.asset(
                    Imgs.onlyLogoIcon,
                    scale: 1.15,
                    color: AppColors.whiteColor,
                  ),
                ),
                Positioned(
                    top: 55.h,
                    left: -22.w,
                    child: Transform.flip(
                      flipX: true,
                      child: Image.asset(
                        Imgs.onlyLogoIcon,
                        color: AppColors.whiteColor,
                        scale: 0.85,
                      ),
                    )),
                Positioned(
                  top: 14.h,
                  left: 3.w,
                  child: Image.asset(
                    Imgs.namedLogo,
                    scale: 4,
                    color: AppColors.whiteColor,
                  ),
                ),
                Positioned(
                  top: 27.h,
                  left: 5.w,
                  child: Container(
                    height: Device.height,
                    width: Device.width * 0.9,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(
                        color: AppColors.blackColor,
                        width: 7,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: PagePadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Verify OTP',
                            style: TextStyle(
                                fontFamily: FontFamily.extraBold,
                                color: AppColors.blackColor,
                                fontSize: 22.sp),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            widget.type == '1'
                                ? 'Please check your email inbox for the one-time password (OTP).'
                                : 'Please check your phone messages for the one-time password (OTP).',
                            style: TextStyle(
                                fontFamily: FontFamily.bold,
                                color: AppColors.blackColor,
                                fontSize: 17.sp),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Center(
                            child: Pinput(
                              controller: _pinController,
                              length: 6,
                              showCursor: true,
                              closeKeyboardWhenCompleted: true,
                              forceErrorState: false,
                              cursor: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 2,
                                    height: 20,
                                    color: AppColors.blackColor,
                                  ),
                                ],
                              ),
                              defaultPinTheme: PinTheme(
                                width: 50,
                                height: 60,
                                textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.blackColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              focusedPinTheme: PinTheme(
                                width: 50,
                                height: 60,
                                textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.bgColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              submittedPinTheme: PinTheme(
                                width: 50,
                                height: 60,
                                textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.bgColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColors.bgColor),
                                ),
                              ),
                              onCompleted: (pin) {
                                debugPrint('OTP Entered: $pin');
                              },
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          InkWell(
                            onTap: () {
                              if (_pinController.text.length == 6) {
                                print('Entered Pin is ${_pinController.text}');
                                widget.type == '1'
                                    ? verifyEmailOtpApi()
                                    : verifyPhoneOtpApi();
                              } else {
                                showCustomErrorSnackbar(
                                  title: 'OTP Incomplete',
                                  message:
                                      'Please fill in all the OTP fields before proceeding.',
                                );
                              }
                            },
                            child: Container(
                              height: 5.5.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.bgColor,
                                  borderRadius: BorderRadius.circular(3.w)),
                              child: Text(
                                'Verify OTP',
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontFamily.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontFamily.bold),
                                children: [
                                  const TextSpan(
                                    text: 'Not Received?  ',
                                    style:
                                        TextStyle(color: AppColors.blackColor),
                                  ),
                                  TextSpan(
                                    text: 'Resend here.',
                                    style: const TextStyle(
                                        color: AppColors.orangeColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        widget.type == "1"
                                            ? resendEmailOtpApi()
                                            : resendPhoneOtpApi();
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 17.h,
                  right: 5.w,
                  child: Image.asset(
                    Imgs.starIcon,
                    scale: 3.5,
                  ),
                ),
                Positioned(
                  top: 6.h,
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Image.asset(
                        Imgs.leftIcon,
                        scale: 5,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: Center(child: Loader()),
            ),
        ],
      ),
    );
  }

  resendEmailOtpApi() {
    setState(() {
      isLoading = true;
    });
    final Map<String, String> data = {
      'type': widget.type.toString(),
      'email': widget.emailAddress.toString(),
    };
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        LoginProvider().senOtpApi(data).then((response) async {
          sendOtp = SendOtpModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            setState(() {
              isLoading = false;
            });
            showCustomSuccessSnackbar(
              title: 'OTP Resent',
              message:
                  'We’ve sent a new one-time password to your registered email. Please check your inbox.',
            );

            setState(() {});
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Otp Error", message: sendOtp?.message ?? '');
            setState(() {
              isLoading = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Otp Error',
              message: 'Internal Server Error',
            );
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Login Error',
            message: 'Internal Server Error',
          );
          setState(() {
            isLoading = false;
          });
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  resendPhoneOtpApi() {
    setState(() {
      isLoading = true;
    });
    final Map<String, String> data = {
      'type': widget.type.toString(),
      'mobile_no': widget.phoneNumber.toString(),
      "country_code": widget.countryCode.toString(),
    };
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        LoginProvider().senOtpApi(data).then((response) async {
          sendOtp = SendOtpModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            setState(() {
              isLoading = false;
            });
            showCustomSuccessSnackbar(
              title: 'OTP Resent',
              message:
                  'We’ve sent a new one-time password to your registered phone number. Please check your messages.',
            );

            setState(() {});
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Otp Error", message: sendOtp?.message ?? '');
            setState(() {
              isLoading = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Otp Error',
              message: 'Internal Server Error',
            );
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Login Error',
            message: 'Internal Server Error',
          );
          setState(() {
            isLoading = false;
          });
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  verifyEmailOtpApi() {
    setState(() {
      isLoading = true;
    });
    final Map<String, String> data = {
      "type": widget.type ?? '',
      'email': widget.emailAddress.toString(),
      'otp': _pinController.text.trim().toString(),
      "customer_id": widget.customerid.toString(),
      "fcm_token": myDeviceToken ?? '',
    };
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        LoginProvider().verifyOtpApi(data).then((response) async {
          userData = UserDataModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && userData?.status == true) {
            showCustomSuccessSnackbar(
              title: 'OTP Verified',
              message: 'Your OTP has been successfully verified.',
            );

            SaveDataLocal.saveLogInData(userData!);
            contectid(userData?.data?[0].email);
            // Get.offAll(
            //   Homescreen(),
            //   transition: Transition.rightToLeft,
            //   duration: Duration(milliseconds: 250),
            // );
          } else if (response.statusCode == 200 && userData?.status == false) {
            showCustomErrorSnackbar(
              title: 'OTP Verification Error',
              message:
                  'The One-Time Password entered is incorrect. Please verify and try again.',
            );
            setState(() {
              isLoading = false;
            });
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Otp Error", message: sendOtp?.message ?? '');
            setState(() {
              isLoading = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Otp Error',
              message: 'Internal Server Error',
            );
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Login Error',
            message: 'Internal Server Error',
          );
          setState(() {
            isLoading = false;
          });
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  verifyPhoneOtpApi() {
    setState(() {
      isLoading = true;
    });
    final Map<String, String> data = {
      "type": widget.type.toString(),
      'mobile_no': widget.phoneNumber.toString(),
      'otp': _pinController.text.trim().toString(),
      'country_code': widget.countryCode.toString(),
      "customer_id": widget.customerid.toString(),
      "fcm_token": myDeviceToken ?? '',
      // "fcm_token":  'xyz',
    };
    print("=====>>>>>$data");
    checkInternet().then((internet) async {
      if (internet) {
        LoginProvider().verifyOtpApi(data).then((response) async {
          userData = UserDataModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && userData?.status == true) {
            setState(() {
              isLoading = false;
            });

            SaveDataLocal.saveLogInData(userData!);
            contectid(userData?.data?[0].email);
            showCustomSuccessSnackbar(
              title: 'OTP Verified',
              message: 'Your OTP has been successfully verified.',
            );
          } else if (response.statusCode == 200 &&
              userData?.message == 'User not found.') {
            showCustomErrorSnackbar(
              title: 'User Not Found',
              message:
                  'No account was found with the provided details. Please verify your information and try again.',
            );
            setState(() {
              isLoading = false;
            });
          } else if (response.statusCode == 200 && userData?.status == false) {
            showCustomErrorSnackbar(
              title: 'OTP Verification Error',
              message:
                  'The One-Time Password entered is incorrect. Please verify and try again.',
            );
            setState(() {
              isLoading = false;
            });
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Otp Error", message: sendOtp?.message ?? '');
            setState(() {
              isLoading = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Otp Error',
              message: 'Internal Server Error',
            );
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Login Error',
            message: 'Internal Server Error',
          );
          setState(() {
            isLoading = false;
          });
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  contectid(email) {
    checkInternet().then((internet) async {
      if (internet) {
        LoginProvider().contackid(email).then((response) async {
          checkidmodal = CheckIdModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            print("==========>>>>>>>>${checkidmodal?.data?.length}");
            String? id = checkidmodal?.data?[0].id.toString();
            if (id != null) {
              await saveId(id);
            }
            setState(() {
              isLoading = false;
            });
            Get.offAll(
              const Homescreen(),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 250),
            );
          } else if (response.statusCode == 422) {
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, straceTrace) {
          final errorMessage = error.toString();
          log("error=====>>>>$errorMessage  $straceTrace");

          if (errorMessage
              .contains("You are not authorized to perform this operation")) {
            return;
          }

          setState(() {
            isLoading = false;
          });
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  Future<void> saveId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('my_id', id);
  }
}
