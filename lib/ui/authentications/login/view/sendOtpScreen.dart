import 'dart:convert';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/ui/authentications/login/modal/sendOtpModal.dart';
import 'package:zohosystem/ui/authentications/login/provider/loginProvider.dart';
import 'package:zohosystem/ui/authentications/login/view/verifyOtpScreen.dart';
import 'package:zohosystem/ui/authentications/signup/view/registerScreen.dart';
import 'package:zohosystem/utils/colors.dart';
import 'package:zohosystem/utils/fontFamily.dart';
import 'package:zohosystem/utils/images.dart';
import 'package:zohosystem/utils/snackBars.dart';
import 'package:zohosystem/utils/textFields.dart';

import '../../../../apiCalling/Loader.dart';
import '../../../../apiCalling/buildErrorDialog.dart';
import '../../../../apiCalling/checkInternetModule.dart';

class SendOtpScreen extends StatefulWidget {
  const SendOtpScreen({super.key});

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneCnotroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String _countryCode = '';

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
                DefaultTabController(
                  length: 2,
                  child: Positioned(
                    top: MediaQuery.of(context).viewInsets.bottom > 0
                        ? 15.h
                        : 27.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: Device.height,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.h),
                              Text(
                                'Access The Advice Centre: Members Hub',
                                style: TextStyle(
                                  fontFamily: FontFamily.extraBold,
                                  color: AppColors.blackColor,
                                  fontSize: 20.sp,
                                ),
                              ),
                              SizedBox(height: 0.h),
                              const Center(
                                child: TabBar(
                                  labelColor: AppColors.blackColor,
                                  unselectedLabelColor: AppColors.border,
                                  indicatorColor: AppColors.orangeColor,
                                  labelStyle: TextStyle(
                                      fontFamily: FontFamily.regular,
                                      fontWeight: FontWeight.w600),
                                  tabs: [
                                    Tab(text: 'Email'),
                                    Tab(text: 'Phone Number'),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3.h),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Column(
                                      children: [
                                        AppTextField(
                                          controller: _emailController,
                                          hintText: 'Enter Your Email Address',
                                          text: 'Email Address',
                                          isTextavailable: true,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter email';
                                            }
                                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                                .hasMatch(value)) {
                                              return 'Enter valid email';
                                            }
                                            return null;
                                          },
                                          textInputType:
                                              TextInputType.emailAddress,
                                          prefix:
                                              const Icon(Icons.email_outlined),
                                        ),
                                        SizedBox(height: 3.h),
                                        InkWell(
                                          onTap: () => sendEmailOtpApi(),
                                          child: Container(
                                            height: 5.5.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.bgColor,
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
                                            ),
                                            child: Text(
                                              'Send OTP',
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: FontFamily.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 3.h),
                                        Center(
                                          child: Text(
                                            'New To The Advice Centre?',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.bold,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: FontFamily.regular,
                                              ),
                                              children: [
                                                const TextSpan(
                                                  text:
                                                      'Start your 7 Day Free Trial ',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                                TextSpan(
                                                  text: 'here ',
                                                  style: const TextStyle(
                                                      color: AppColors
                                                          .orangeColor),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () => Get.to(
                                                              const Registerscreen(),
                                                              transition:
                                                                  Transition
                                                                      .rightToLeft,
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          250),
                                                            ),
                                                ),
                                                const TextSpan(
                                                  text:
                                                      'to Transform You & Your Business.',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 1.h),
                                        Center(
                                          child: Text(
                                            'Existing or Past Member?',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.bold,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: FontFamily.regular,
                                              ),
                                              children: [
                                                const TextSpan(
                                                  text:
                                                      'Just sign in above using the',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                                TextSpan(
                                                  text: ' email address ',
                                                  style: const TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        FontFamily.regular,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () => Get.to(
                                                              const Registerscreen(),
                                                              transition:
                                                                  Transition
                                                                      .rightToLeft,
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          250),
                                                            ),
                                                ),
                                                const TextSpan(
                                                  text:
                                                      'you used to sign up. We’ll send you a ',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                                TextSpan(
                                                  text: 'One-Time Passcode ',
                                                  style: const TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        FontFamily.regular,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () => Get.to(
                                                              const Registerscreen(),
                                                              transition:
                                                                  Transition
                                                                      .rightToLeft,
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          250),
                                                            ),
                                                ),
                                                const TextSpan(
                                                  text:
                                                      'to confirm your identity, you’ll then be able to access your membership information.',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        AppTextField(
                                          controller: _phoneCnotroller,
                                          hintText: 'Enter Your Phone Number',
                                          text: 'Phone Number',
                                          isTextavailable: true,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Phone Number is required';
                                            }
                                            return null;
                                          },
                                          textInputType: TextInputType.phone,
                                          prefix: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Icon(
                                                Icons.phone,
                                                size: 19.sp,
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Expanded(
                                                child: IntlPhoneField(
                                                  controller: _phoneCnotroller,
                                                  decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    disabledBorder:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    errorBorder:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    hintText:
                                                        'Enter Your Phone Number',
                                                    hintStyle: TextStyle(
                                                      color: AppColors.border,
                                                      fontFamily:
                                                          FontFamily.regular,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15.sp,
                                                    ),
                                                  ),
                                                  initialCountryCode: 'GB',
                                                  onChanged: (phone) {
                                                    if (_countryCode == '') {
                                                      setState(() {
                                                        _countryCode =
                                                            phone.countryCode;
                                                      });
                                                      log(_countryCode);
                                                    }
                                                  },
                                                  disableLengthCheck: true,
                                                  showDropdownIcon: true,
                                                  showCountryFlag: false,
                                                  dropdownIconPosition:
                                                      IconPosition.trailing,
                                                  dropdownTextStyle:
                                                      const TextStyle(
                                                          color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 3.h),
                                        InkWell(
                                          onTap: () => sendPhoneOtpApi(),
                                          child: Container(
                                            height: 5.5.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.bgColor,
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
                                            ),
                                            child: Text(
                                              'Send OTP',
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: FontFamily.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 3.h),
                                        Center(
                                          child: Text(
                                            'New To The Advice Centre?',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.bold,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: FontFamily.regular,
                                              ),
                                              children: [
                                                const TextSpan(
                                                  text:
                                                      'Start your 7 Day Free Trial ',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                                TextSpan(
                                                  text: 'here ',
                                                  style: const TextStyle(
                                                      color: AppColors
                                                          .orangeColor),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () => Get.to(
                                                              const Registerscreen(),
                                                              transition:
                                                                  Transition
                                                                      .rightToLeft,
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          250),
                                                            ),
                                                ),
                                                const TextSpan(
                                                  text:
                                                      'to Transform You & Your Business.',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 1.h),
                                        Center(
                                          child: Text(
                                            'Existing or Past Member?',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.bold,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: FontFamily.regular,
                                              ),
                                              children: [
                                                const TextSpan(
                                                  text:
                                                      'Just sign in above using the',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                                TextSpan(
                                                  text: ' phone number ',
                                                  style: const TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        FontFamily.regular,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () => Get.to(
                                                              const Registerscreen(),
                                                              transition:
                                                                  Transition
                                                                      .rightToLeft,
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          250),
                                                            ),
                                                ),
                                                const TextSpan(
                                                  text:
                                                      'you used to sign up. We’ll send you a ',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                                TextSpan(
                                                  text: 'One-Time Passcode ',
                                                  style: const TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        FontFamily.regular,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () => Get.to(
                                                              const Registerscreen(),
                                                              transition:
                                                                  Transition
                                                                      .rightToLeft,
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          250),
                                                            ),
                                                ),
                                                const TextSpan(
                                                  text:
                                                      'to confirm your identity, you’ll then be able to access your membership information.',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top:
                      MediaQuery.of(context).viewInsets.bottom > 0 ? 5.h : 17.h,
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

  sendEmailOtpApi() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      final Map<String, String> data = {
        'type': "1",
        'email': _emailController.text.trim().toString(),
      };
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          LoginProvider().senOtpApi(data).then((response) async {
            sendOtp = SendOtpModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && sendOtp?.status == true) {
              setState(() {
                isLoading = false;
              });
              Get.to(
                VerifyOtpScreen(
                  emailAddress: _emailController.text,
                  type: "1",
                  phoneNumber: "",
                  countryCode: "",
                  customerid: sendOtp?.customerId,
                ),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 250),
              );
              showCustomSuccessSnackbar(
                title: 'OTP Sent',
                message:
                    'A one-time password has been sent to your registered email address. Please check your inbox.',
              );
              setState(() {
                _emailController.clear();
              });
            } else if (response.statusCode == 200 && sendOtp?.status == false) {
              showCustomErrorSnackbar(
                title: 'Email Not Found',
                message:
                    'The email address you entered is not registered. Please check and try again.',
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
              title: 'Otp Error',
              message: error.toString(),
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
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  sendPhoneOtpApi() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      final Map<String, String> data = {
        'type': "2",
        'mobile_no': _phoneCnotroller.text,
        "country_code": _countryCode,
      };
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          LoginProvider().senOtpApi(data).then((response) async {
            sendOtp = SendOtpModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && sendOtp?.status == true) {
              setState(() {
                isLoading = false;
              });
              Get.to(
                VerifyOtpScreen(
                  emailAddress: "",
                  type: "2",
                  phoneNumber: _phoneCnotroller.text,
                  countryCode: _countryCode,
                  customerid: sendOtp?.customerId,
                ),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 250),
              );
              showCustomSuccessSnackbar(
                title: 'OTP Sent',
                message:
                    'A one-time password has been sent to your registered phone number. Please check your messages.',
              );
              setState(() {
                _phoneCnotroller.clear();
              });
            } else if (response.statusCode == 200 && sendOtp?.status == false) {
              showCustomErrorSnackbar(
                title: 'Phone Number Not Found',
                message:
                    'The phone number you entered is not registered. Please check and try again.',
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
              title: 'Otp Error',
              message: error.toString(),
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
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
}
