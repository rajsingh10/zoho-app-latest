import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/authentications/login/view/sendOtpScreen.dart';
import 'package:zohosystem/ui/authentications/signup/modal/allPlansModal.dart';
import 'package:zohosystem/ui/authentications/signup/modal/allProductsModal.dart';
import 'package:zohosystem/ui/authentications/signup/modal/countriesModal.dart';
import 'package:zohosystem/ui/authentications/signup/modal/createContractModal.dart';
import 'package:zohosystem/ui/authentications/signup/modal/createSubscriptionModal.dart';
import 'package:zohosystem/ui/authentications/signup/provider/signupProvider.dart';
import 'package:zohosystem/ui/authentications/signup/view/verifyPaymentWebview.dart';

import '../../../../apiCalling/Loader.dart';
import '../../../../apiCalling/apiConfig.dart';
import '../../../../apiCalling/buildErrorDialog.dart';
import '../../../../apiCalling/checkInternetModule.dart';
import '../../../../apiCalling/saveUserToken.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fontFamily.dart';
import '../../../../utils/images.dart';
import '../../../../utils/snackBars.dart';
import '../../../../utils/textFields.dart';
import '../../login/modal/authTokenModal.dart';
import '../../login/provider/loginProvider.dart';
import '../../login/view/policyWebview.dart';
import '../modal/checkEmailModal.dart';
import '../modal/signInModal.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _companyname = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _zipCode = TextEditingController();
  TextEditingController searchController = TextEditingController();

  String? selectedMembershipProduct;
  String? selectedMembership;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isChecked = false;
  int step = 1;
  List<Products> productsList = [];
  List<Data> countriesList = [];
  List<Plans> plansList = [];

  String _countryCode = '+44';
  String? selectedCountry;
  List<String> cityList = [];
  List<String> allCountries = [];
  List<String> filteredCountries = [];
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final GlobalKey _textFieldKey = GlobalKey();
  final LayerLink _cityLayerLink = LayerLink();
  OverlayEntry? _cityOverlayEntry;
  final GlobalKey _cityFieldKey = GlobalKey();
  final TextEditingController _citySearchController = TextEditingController();
  List<String> filteredCities = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
    getPlansApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.bgColor,
      body: InkWell(
        onTap: () {
          if (_overlayEntry != null) _removeOverlay();
          if (_cityOverlayEntry != null) _removeCityOverlay();
          FocusScope.of(context).unfocus();
        },
        child: Stack(
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
                      height: Device.height * 0.8,
                      width: Device.width * 0.9,
                      padding: EdgeInsets.symmetric(vertical: 3.h),
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
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                step == 1
                                    ? firstStep(context)
                                    : secondStep(context),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).viewInsets.bottom >
                                              0
                                          ? 35.h
                                          : 0.h,
                                ),
                                // Ensure button is above keyboard
                              ],
                            ),
                          ),
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
      ),
    );
  }

  Widget firstStep(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.h),
        SizedBox(
          width: 60.w,
          child: Text(
            'Sign Up for Your 7-Day Free Trial',
            style: TextStyle(
                fontFamily: FontFamily.extraBold,
                color: AppColors.blackColor,
                fontSize: 21.sp),
          ),
        ),
        SizedBox(height: 2.h),
        InkWell(
          onTap: () {
            showAdviceDialog(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.5.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(0xffffde59),
                  Color(0xfff1811b),
                  Color(0xfff1811b),
                ]),
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              'A MESSAGE TO YOU FROM OUR FOUNDER CLICK HERE',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.5.sp,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.bold),
            ),
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Membership Plan",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: FontFamily.light,
                      color: AppColors.blackColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  // shows red * if validator is present
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: AppColors.redColor,
                      fontSize: 16.sp,
                      fontFamily: FontFamily.light,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            DropdownButtonFormField(
              hint: Text(
                "Select Membership Plan",
                style: TextStyle(
                  color: AppColors.border,
                  fontFamily: FontFamily.regular,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
              icon: Icon(
                CupertinoIcons.chevron_down,
                size: 16.sp,
                color: AppColors.border,
              ).paddingOnly(right: 2.w),
              value: selectedMembership,
              items: plansList.map((item) {
                return DropdownMenuItem(
                  value: item.planCode,
                  child: SizedBox(
                    width: 50.w,
                    child: Text(
                      item.name ?? '',
                      style: TextStyle(
                        fontFamily: FontFamily.regular,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (mounted) {
                  setState(() {
                    selectedMembership = value;
                  });
                }
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select a Membership Plan';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                fillColor: AppColors.whiteColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide:
                      const BorderSide(width: 1.5, color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide:
                      const BorderSide(width: 1.5, color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide:
                      const BorderSide(width: 1.5, color: AppColors.blackColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide:
                      const BorderSide(width: 1.5, color: AppColors.redColor),
                ),
                errorStyle: TextStyle(
                  color: AppColors.redColor,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        AppTextField(
          controller: _firstname,
          hintText: 'Enter Your First Name',
          text: 'First Name',
          isTextavailable: true,
          textInputType: TextInputType.text,
          prefix: const Icon(Icons.person),
          validator: (value) => value == null || value.isEmpty
              ? 'Please enter your first name'
              : null,
        ),
        SizedBox(height: 2.h),
        AppTextField(
          controller: _lastname,
          hintText: 'Enter Your Last Name',
          text: 'Last Name',
          isTextavailable: true,
          textInputType: TextInputType.text,
          prefix: const Icon(Icons.person),
          validator: (value) => value == null || value.isEmpty
              ? 'Please enter your last name'
              : null,
        ),
        SizedBox(height: 2.h),
        AppTextField(
          controller: _companyname,
          hintText: 'Enter Your Company Name',
          text: 'Company Name (If Applicable)',
          isTextavailable: true,
          textInputType: TextInputType.text,
          prefix: const Icon(Icons.business),
        ),
        SizedBox(height: 2.h),
        AppTextField(
          controller: _emailController,
          hintText: 'Enter Your Email Address',
          text: 'Email',
          isTextavailable: true,
          textInputType: TextInputType.emailAddress,
          prefix: const Icon(Icons.email_outlined),
          validator: (value) {
            if (value == null || value.isEmpty) return 'Please enter email';
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Enter valid email';
            }
            return null;
          },
        ),
        SizedBox(height: 2.h),
        AppTextField(
          controller: _phoneNumber,
          hintText: 'Enter Your Phone Number',
          text: 'Phone Number',
          isTextavailable: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
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
                  controller: _phoneNumber,
                  decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    disabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    errorBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Enter Your Phone Number',
                    hintStyle: TextStyle(
                      color: AppColors.border,
                      fontFamily: FontFamily.regular,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                  initialCountryCode: 'GB',
                  onCountryChanged: (value) {
                    if (mounted) {
                      setState(() {
                        _countryCode = value.displayCC;
                      });
                    }
                    log(_countryCode);
                  },
                  disableLengthCheck: true,
                  // optional: disable length restrictions
                  showDropdownIcon: true,
                  showCountryFlag: false,
                  dropdownIconPosition: IconPosition.trailing,
                  dropdownTextStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        Text.rich(
          TextSpan(
            text:
                'Whichever service you select above, you are entitled to up to 30 mins of Professional Advice Time in your trial period. Payment details are required for your trial.\n',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.blackColor,
            ),
            children: [
              TextSpan(
                text:
                    'Important: Your membership will auto-renew after your 7 day free trial period and you will be charged according to the membership plan you select above, unless you choose to cancel before the end of your trial period.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: AppColors.blackColor,
                ),
              ),
              TextSpan(
                text:
                    ' Please contact accounts@theadvicecentre.ltd for any billing queries or contact our team on the live chat. ',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        InkWell(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              if (mounted) {
                setState(() {
                  step++;
                });
              }
            }
          },
          child: Container(
            height: 5.5.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 17.sp,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: FontFamily.regular,
              ),
              children: [
                const TextSpan(
                  text: 'Already a member? Log-in ',
                  style: TextStyle(color: AppColors.blackColor),
                ),
                TextSpan(
                  text: 'here.',
                  style: const TextStyle(color: AppColors.orangeColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(
                        const SendOtpScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 250),
                      );
                    },
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        // Container(
        //
        //   padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     border: Border.all(
        //       color: Colors.orange, // border color
        //       width: 1.5,
        //     ),
        //     borderRadius: BorderRadius.circular(12),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.black12,
        //         blurRadius: 6,
        //         offset: const Offset(0, 2),
        //       ),
        //     ],
        //   ),
        //
        //   // Make text scrollable
        //   child: SizedBox(
        //     height: 25.h, // 🔹 scroll area height (adjust as needed)
        //     child: SingleChildScrollView(
        //       child: RichText(
        //         text: TextSpan(
        //           style: TextStyle(
        //             fontSize: 14.sp,
        //             color: Colors.black,
        //             fontFamily: 'Poppins',
        //             height: 1.5,
        //           ),
        //           children: [
        //
        //             TextSpan(
        //               text:
        //               "Important: Please make sure to use the email address and mobile phone number you intend to use when contacting our support team. If you use different contact details, we may not be able to provide support through those channels.\n\n",
        //               style: TextStyle(
        //                   fontFamily: FontFamily.bold,
        //                   color: AppColors.blackColor,
        //                   fontSize: 16.sp),
        //             ),
        //             TextSpan(
        //               text: "Important Information to read before Signing up\n\n",
        //               style: TextStyle(
        //                   fontFamily: FontFamily.bold,
        //                   color: AppColors.blackColor,
        //                   fontSize: 16.sp),
        //             ),
        //             const TextSpan(
        //               text:
        //               "Please note: You or your Business is entitled to ONE 7-Day Free Trial on one Advice Centre Membership Service only (e.g. Marketing Advice Centre Pro –Monthly, AMZ Advice Centre Pro – Monthly). Multiple free trials are not permitted. If we feel that any of our services are being abused or taken advantage of in any way, we reserve the right to terminate your 7 day membership at any time. "
        //                   "If you require any additional services after a 7-day free trial on any plan, this would be chargeable and you would not be eligible for a 7 day free trial on any additional service.\n\n",
        //             ),
        //             TextSpan(
        //               text: "Important: ",
        //               style: TextStyle(
        //                 color: Colors.orange,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             const TextSpan(
        //               text:
        //               "Payment details are required for a free trial on the membership plan you select and you will be charged either monthly or yearly, again depending on the membership you select, the first payment will be taken after your 7 day Free Trial.\n\n"
        //                   "Please ensure you read & agree to our Terms and Conditions & Privacy Policy before signing up to any membership plan - by using our service, you are deemed to have accepted our Terms & Conditions & Privacy Policy.\n\n"
        //                   "All of our Services are available for UK Businesses & Individuals Only. Please note that our Advice and support services are only available to Businesses and Individuals who are based in the United Kingdom. We charge VAT on all services.\n\n"
        //                   "If you are based outside of the UK, please speak to our team on the live chat or email info@theadvicecentre.ltd. Please do not sign up.",
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.orange,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),

          // Scrollable text
          child: SizedBox(
            height: 25.h,
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "Important: Please make sure to use the email address and mobile phone number you intend to use when contacting our support team. If you use different contact details, we may not be able to provide support through those channels.\n\n",
                        style: TextStyle(
                          fontFamily: FontFamily.bold,
                          color: AppColors.blackColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Important Information to read before Signing up\n\n",
                        style: TextStyle(
                          fontFamily: FontFamily.bold,
                          color: AppColors.blackColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Please note: You or your Business is entitled to ONE 7-Day Free Trial on one Advice Centre Membership Service only (e.g. Marketing Advice Centre Pro –Monthly, AMZ Advice Centre Pro – Monthly). ",
                      ),
                      // 🔸 Underlined "Multiple free trials..." line
                      TextSpan(
                        text: "Multiple free trials are not permitted.",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.blackColor,
                          decorationThickness: 1.5,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text:
                            " If we feel that any of our services are being abused or taken advantage of in any way, we reserve the right to terminate your 7 day membership at any time. "
                            "If you require any additional services after a 7-day free trial on any plan, this would be chargeable and you would not be eligible for a 7 day free trial on any additional service.\n\n",
                      ),
                      TextSpan(
                        text: "Important: ",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Payment details are required for a free trial on the membership plan you select and you will be charged either monthly or yearly, again depending on the membership you select, the first payment will be taken after your 7 day Free Trial.\n\n",
                      ),
                      // 🔹 Blue + Underlined Terms & Privacy section
                      TextSpan(
                        text:
                            "Please ensure you read & agree to our Terms and Conditions & Privacy Policy ",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text:
                            "before signing up to any membership plan - by using our service, you are deemed to have accepted our Terms & Conditions & Privacy Policy.\n\n"
                            "All of our Services are available for UK Businesses & Individuals Only. Please note that our Advice and support services are only available to Businesses and Individuals who are based in the United Kingdom. We charge VAT on all services.\n\n"
                            "If you are based outside of the UK, please speak to our team on the live chat or email ",
                      ),
                      // 🔹 Blue + Underlined email link
                      TextSpan(
                        text: "info@theadvicecentre.ltd",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(
                        text: ". Please do not sign up.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 10.h),
      ],
    );
  }

  Widget secondStep(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.h),
        SizedBox(
          width: 60.w,
          child: Text(
            'Sign Up for Your 7-Day Free Trial',
            style: TextStyle(
                fontFamily: FontFamily.extraBold,
                color: AppColors.blackColor,
                fontSize: 21.sp),
          ),
        ),
        SizedBox(height: 2.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Country/Region",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontFamily: FontFamily.light,
                  color: AppColors.blackColor,
                  fontSize: 16.sp,
                ),
              ),
              // shows red * if validator is present
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: AppColors.redColor,
                  fontSize: 16.sp,
                  fontFamily: FontFamily.light,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 1.h),
        CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: () {
              if (_overlayEntry == null) {
                _showSearchableDropdown();
              } else {
                _removeOverlay();
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                key: _textFieldKey,
                controller: TextEditingController(text: selectedCountry),
                decoration: InputDecoration(
                  hintText: "Select Country/Region",
                  prefixIcon: const Icon(Icons.flag),
                  suffixIcon: const Icon(CupertinoIcons.chevron_down),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: AppColors.whiteColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.w),
                    borderSide:
                        const BorderSide(width: 1.5, color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.w),
                    borderSide:
                        const BorderSide(width: 1.5, color: AppColors.border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.w),
                    borderSide: const BorderSide(
                        width: 1.5, color: AppColors.blackColor),
                  ),
                ),
                validator: (value) {
                  if (selectedCountry == null || selectedCountry!.isEmpty) {
                    return 'Please select a country/region';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        AppTextField(
          controller: _address,
          hintText: 'Enter Billing Address',
          text: 'Billing Address',
          isTextavailable: true,
          textInputType: TextInputType.text,
          prefix: const Icon(Icons.location_history),
          validator: (value) => value == null || value.isEmpty
              ? 'Please enter your billing address'
              : null,
        ),
        SizedBox(height: 2.h),
        AppTextField(
          controller: _state,
          hintText: 'Enter Your Country/State',
          text: 'Country/State',
          isTextavailable: true,
          textInputType: TextInputType.text,
          prefix: const Icon(Icons.location_pin),
          validator: (value) => value == null || value.isEmpty
              ? 'Please enter your country/state'
              : null,
        ),
        SizedBox(height: 2.h),
        CompositedTransformTarget(
          link: _cityLayerLink,
          child: GestureDetector(
            onTap: () {
              if (cityList.isEmpty) {
                showCustomErrorSnackbar(
                    title: 'Country Require',
                    message: 'Please Select Country Before Selecting City');
              } else {
                if (_cityOverlayEntry == null) {
                  _showCityDropdown();
                } else {
                  _removeCityOverlay();
                }
              }
            },
            child: AbsorbPointer(
              child: AppTextField(
                key: _cityFieldKey,
                controller: _city,
                hintText: 'Enter Your City',
                text: 'City',
                isTextavailable: true,
                textInputType: TextInputType.text,
                prefix: const Icon(Icons.business),
                suffix: const Icon(CupertinoIcons.chevron_down),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter city' : null,
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        AppTextField(
          controller: _zipCode,
          hintText: 'Enter Your Postal/Zip Code',
          text: 'Postal/Zip Code',
          isTextavailable: true,
          textInputType: TextInputType.text,
          prefix: const Icon(Icons.my_location_rounded),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter postal/zip code';
            }

            return null;
          },
        ),
        SizedBox(height: 2.h),
        Text.rich(
          TextSpan(
            text:
                'Whichever service you select you are entitled up to 30 mins of Professional Advice Time in your trial period. ',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.blackColor,
            ),
            children: [
              TextSpan(
                text:
                    'If you choose to cancel within 7 days you will not be charged.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: AppColors.blackColor,
                ),
              ),
              TextSpan(
                text:
                    ' Your membership will auto-renew unless you choose to cancel.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 1.5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 0.9,
              child: Theme(
                data: Theme.of(context).copyWith(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
                child: Checkbox(
                  value: isChecked,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text:
                      'By signing-up you are agreeing to The Advice Centre Ltd ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: AppColors
                            .primary, // Optional: highlight clickable text
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(policyWebviewScreen(
                            link:
                                "https://www.theadvicecentre.ltd/terms-and-conditions",
                            fileName: 'Terms & Conditions',
                          ));
                        },
                    ),
                    const TextSpan(
                      text: ' and ',
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(policyWebviewScreen(
                            link:
                                "https://www.theadvicecentre.ltd/privacy-policy",
                            fileName: 'Privacy Policy',
                          ));
                        },
                    ),
                    const TextSpan(
                      text: '.',
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                if (mounted) {
                  setState(() {
                    step--;
                  });
                }
              },
              child: Container(
                width: 38.w,
                height: 5.5.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.circular(3.w),
                ),
                child: Text(
                  'Previous',
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (!isChecked) {
                  showCustomErrorSnackbar(
                    title: 'Agreement Required',
                    message:
                        'Please agree to the Terms & Conditions and Privacy Policy before proceeding.',
                  );

                  return;
                }
                checkEmailApi();
              },
              child: Container(
                height: 5.5.h,
                width: 38.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.circular(3.w),
                ),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 1.5.h),
        Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: FontFamily.regular,
              ),
              children: [
                const TextSpan(
                  text: 'Already a member? Log-in ',
                  style: TextStyle(color: AppColors.blackColor),
                ),
                TextSpan(
                  text: 'here.',
                  style: const TextStyle(color: AppColors.orangeColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(
                        const SendOtpScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 250),
                      );
                    },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }

  checkEmailApi() {
    if (_formKey.currentState!.validate()) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }

      checkInternet().then((internet) async {
        if (internet) {
          Signupprovider()
              .checkEmailApi(_emailController.text.trim().toString())
              .then((response) async {
            checkEmail = checkEmailModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200) {
              if (checkEmail?.customers?.length == 0) {
                checkPhoneApi();
              } else {
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
                showCustomErrorSnackbar(
                  title: 'Email Address',
                  message:
                      'This email address is already registered. Please use a different one.',
                );
              }
            } else if (response.statusCode == 422) {
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            } else {
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            }
          }).catchError((error) {
            showCustomErrorSnackbar(
              title: 'Login Error',
              message: error.toString(),
            );
            log("error=====>>>>${error.toString()}");
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    } else {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  checkPhoneApi() {
    if (_formKey.currentState!.validate()) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }

      checkInternet().then((internet) async {
        if (internet) {
          Signupprovider()
              .checkPhoneApi(_phoneNumber.text.trim().toString())
              .then((response) async {
            checkEmail = checkEmailModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200) {
              if (checkEmail?.customers?.length == 0) {
                signUpApi();
              } else {
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
                showCustomErrorSnackbar(
                  title: 'Mobile Number',
                  message:
                      'This phone number is already in use. Please try a different number.',
                );
              }
            } else if (response.statusCode == 422) {
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            } else {
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            }
          }).catchError((error) {
            showCustomErrorSnackbar(
              title: 'Login Error',
              message: error.toString(),
            );
            log("error=====>>>>${error.toString()}");
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    } else {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  createContractApi() {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> data = {
        'firstName': _firstname.text.trim(),
        'lastName': _lastname.text.trim(),
        'email': _emailController.text.trim(),
        'phone': _phoneNumber.text.trim(),
        'mobile': _phoneNumber.text.trim()
      };

      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          Signupprovider().createCustomerApi(data).then((response) async {
            createContract =
                CreateContractModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200) {
              createSubscriptionApi();
            } else if (response.statusCode == 422) {
              showCustomErrorSnackbar(
                  title: "Register Error", message: register?.message ?? '');
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            } else {
              showCustomErrorSnackbar(
                title: 'Register Error',
                message: register?.message ?? '',
              );
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            }
          }).catchError((error) {
            showCustomErrorSnackbar(
              title: 'Register Error',
              message: error.toString(),
            );
            log("Error ========>>>>>>>>${error.toString()}");
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    } else {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  signUpApi() {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> data = {
        'display_name': _firstname.text.trim(),
        'first_name': _firstname.text.trim(),
        'last_name': _lastname.text.trim(),
        'email': _emailController.text.trim(),
        'company_name': _companyname.text.trim(),
        'phone': _phoneNumber.text.trim(),
        'mobile': _phoneNumber.text.trim(),
        "shipping_address": {
          "attention": "${_firstname.text.trim()} ${_lastname.text.trim()}",
          "street": _address.text.trim(),
          "city": _city.text.trim(),
          "state": _state.text.trim(),
          "zip": _zipCode.text.trim(),
          "country": selectedCountry!.length > 30
              ? selectedCountry!.substring(0, 30)
              : selectedCountry,
          "state_code": _state.text.trim().length >= 2
              ? _state.text.trim().substring(0, 2)
              : _state.text.trim(),
        },
        "billing_address": {
          "attention": "${_firstname.text.trim()} ${_lastname.text.trim()}",
          "street": _address.text.trim(),
          "city": _city.text.trim(),
          "state": _state.text.trim(),
          "zip": _zipCode.text.trim(),
          "country": selectedCountry!.length > 30
              ? selectedCountry!.substring(0, 30)
              : selectedCountry,
          "state_code": _state.text.trim().length >= 2
              ? _state.text.trim().substring(0, 2)
              : _state.text.trim(),
        },
        "custom_fields": [
          {
            "api_name": "cf_email_address",
            "value": _emailController.text.trim(),
          },
          {
            "api_name": "cf_country_code",
            "value": '+$_countryCode',
          }
        ]
      };

      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          Signupprovider().signInApi(data).then((response) async {
            register = signInModal.fromJson(json.decode(response.body));
            if (response.statusCode == 201 || register?.code == 0) {
              createContractApi();
            } else if (response.statusCode == 422) {
              showCustomErrorSnackbar(
                  title: "Register Error", message: register?.message ?? '');
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            } else {
              showCustomErrorSnackbar(
                title: 'Register Error',
                message: register?.message ?? '',
              );
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            }
          }).catchError((error) {
            showCustomErrorSnackbar(
              title: 'Register Error',
              message: error.toString(),
            );
            log("Error ========>>>>>>>>${error.toString()}");
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    } else {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  createSubscriptionApi() {
    final Map<String, dynamic> data = {
      'customer_id': register?.customer?.customerId,
      'plan': {
        "plan_code": selectedMembership,
      },
      "starts_at": DateFormat('yyyy-MM-dd').format(DateTime.now()),
      "can_charge_setup_fee_immediately": true,
      "custom_fields": [
        {
          "label": "Start Date/Time",
          "value": DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())
        }
      ]
    };

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Signupprovider().createSubscriptionApi(data).then((response) async {
          createSubscription =
              CreateSubscriptionModal.fromJson(json.decode(response.body));
          if (response.statusCode == 201) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
            Get.to(
              VerifyPaymentScreen(
                paymentLink: createSubscription?.hostedpage?.url ?? '',
              ),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 250),
            );
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Register Error", message: register?.message ?? '');
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          } else {
            showCustomErrorSnackbar(
              title: 'Register Error',
              message: register?.message ?? '',
            );
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Register Error',
            message: error.toString(),
          );
          log("Error ========>>>>>>>>${error.toString()}");
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  getCountriesApi() {
    checkInternet().then((internet) async {
      if (internet) {
        Signupprovider().fetchCountriesApi().then((response) async {
          countries = CountriesModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            if (mounted) {
              setState(() {
                countriesList = countries?.data ?? [];
                allCountries =
                    countriesList.map((item) => item.country ?? '').toList();

                allCountries.removeWhere(
                    (element) => element.toLowerCase() == 'united kingdom');
                allCountries.insert(0, 'United Kingdom');

                filteredCountries = List.from(allCountries);
              });
            }
          } else if (response.statusCode == 422) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          } else {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Error',
            message: error.toString(),
          );
          log("error=====>>>>${error.toString()}");
          if (mounted) if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  void getCitiesFromSelectedCountry(String selectedCountryName) {
    final selectedCountry = countriesList.firstWhere(
      (country) => country.country == selectedCountryName,
      orElse: () => Data(),
    );

    if (selectedCountry.cities != null) {
      cityList = List<String>.from(selectedCountry.cities!);
      print("Cities: $cityList");
      if (mounted) setState(() {});
    } else {
      cityList = [];
      print("No cities found for selected country");
    }
  }

  void _showCityDropdown() {
    final renderBox =
        _cityFieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    filteredCities = List.from(cityList); // use current cityList

    _cityOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height - 6.h,
        width: size.width,
        child: CompositedTransformFollower(
          link: _cityLayerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height - 6.h),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.border, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _citySearchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search City',
                      fillColor: AppColors.whiteColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.border,
                        ),
                      ),
                      errorStyle:
                          TextStyle(color: AppColors.redColor, fontSize: 15.sp),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.redColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.border,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.blackColor,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                        color: AppColors.border,
                        fontFamily: FontFamily.regular,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    onChanged: (value) {
                      filteredCities = cityList
                          .where((city) =>
                              city.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                      _cityOverlayEntry!.markNeedsBuild();
                    },
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: filteredCities.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredCities[index]),
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                _city.text = filteredCities[index];
                              });
                            }
                            _removeCityOverlay();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_cityOverlayEntry!);
  }

  void _showSearchableDropdown() {
    final renderBox =
        _textFieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    filteredCountries = List.from(allCountries);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height - 6.h,
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height - 6.h),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 400),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.border, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      fillColor: AppColors.whiteColor,
                      hintText: 'Search Country',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.border,
                        ),
                      ),
                      errorStyle:
                          TextStyle(color: AppColors.redColor, fontSize: 15.sp),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.redColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.border,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.blackColor,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                        color: AppColors.border,
                        fontFamily: FontFamily.regular,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    onChanged: (value) {
                      filteredCountries = allCountries
                          .where((country) => country
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                      _overlayEntry!.markNeedsBuild(); // Refresh the overlay
                    },
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: filteredCountries.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredCountries[index]),
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                selectedCountry = filteredCountries[index];
                                getCitiesFromSelectedCountry(
                                    selectedCountry ?? '');
                              });
                            }
                            _removeOverlay();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  fetchAuthtokenApi() {
    SaveAuthtokenData.removeAuthToken();
    checkInternet().then((internet) async {
      if (internet) {
        LoginProvider().refreshTokenApi().then((response) async {
          authtoken = AuthtokenModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
            SaveAuthtokenData.saveAuthData(authtoken!);
            getPlansApi();
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Token Error", message: sendOtp?.message ?? '');
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          } else {
            showCustomErrorSnackbar(
              title: 'Token Error',
              message: 'Internal Server Error',
            );
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Token Error',
            message: 'Internal Server Error',
          );
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  void _removeOverlay() {
    searchController.clear();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _removeCityOverlay() {
    _citySearchController.clear();
    _cityOverlayEntry?.remove();
    _cityOverlayEntry = null;
  }

  getPlansApi() {
    checkInternet().then((internet) async {
      if (internet) {
        Signupprovider().fetchPlansApi().then((response) async {
          allPlans = AllPlansModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            if (mounted) {
              setState(() {
                plansList = allPlans?.plans ?? [];
                isLoading = false;
                getCountriesApi();
              });
            }
          } else if (response.statusCode == 422) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
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
            log("User not authorized, retaking token...");
            fetchAuthtokenApi();

            return;
          }

          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  void showAdviceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 20.sp,
                  )),
            ],
          ),
          content: SizedBox(
            height: 350, // scrollable area height
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // RichText(
                  //   text: TextSpan(
                  //     style: TextStyle(
                  //       fontSize: 15.sp,
                  //       color: AppColors.blackColor,
                  //       fontFamily: FontFamily.regular,
                  //     ),
                  //     children: [
                  //       const TextSpan(
                  //         text:
                  //         "Hi, thanks for downloading The Advice Centre App! We’re looking forward to working with you.\n\n",
                  //       ),
                  //       TextSpan(
                  //         text:
                  //         "Are you looking for Personal Advice from leading UK Experts, whenever you need it? ",
                  //         style: TextStyle(
                  //           color: AppColors.blackColor, // 🔸 highlight color
                  //           fontWeight: FontWeight.bold,
                  //           fontFamily: FontFamily.bold,
                  //         ),
                  //       ),
                  //       const TextSpan(
                  //         text:
                  //         "Select a ‘Pro’ Membership Plan below which includes up to 120mins Professional Advice time a month "
                  //             "alongside access to On-Demand Training & AI Tools (depending on the plan you select).\n\n"
                  //             "You’ll be eligible for up to 30 minutes of Professional Advice/Guidance during your 7-day free trial – please note, "
                  //             "payment details are required. After the trial, you’ll be automatically charged monthly or annually depending on the plan you select, "
                  //             "unless you choose to cancel your membership within the 7-day trial period.\n\n"
                  //             "We aim to respond to all queries within 24 hours, Monday–Friday, though complex issues may take longer. "
                  //             "If you wish to cancel your membership after the trial period, we just require a 7-working-day notice before your monthly/annual renewal date. "
                  //             "Once signed up, you can reach us anytime via the ‘Chat with us’ option for any questions.\n\n"
                  //             "We look forward to supporting you and helping you build a very successful business.\n\n",
                  //         style: TextStyle(
                  //           color: AppColors.blackColor, // 🔸 highlight color
                  //           fontWeight: FontWeight.normal,
                  //           fontFamily: FontFamily.regular,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.blackColor,
                        fontFamily: FontFamily.regular,
                      ),
                      children: [
                        TextSpan(
                          text:
                              "Hi, thanks for downloading The Advice Centre App! We’re looking forward to working with you.\n\n",
                        ),
                        TextSpan(
                          text:
                              "Are you looking for Personal Advice from leading UK Experts, whenever you need it? ",
                          style: TextStyle(
                            color: AppColors.blackColor, // 🔸 highlight color
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              "Select a ‘Pro’ Membership Plan below which includes up to 120mins Professional Advice time a month "
                              "alongside access to On-Demand Training & AI Tools (depending on the plan you select).\n\n"
                              "You’ll be eligible for up to 30 minutes of Professional Advice/Guidance during your 7-day free trial – please note, "
                              "payment details are required. After the trial, you’ll be automatically charged monthly or annually depending on the plan you select, ",
                        ),
                        TextSpan(
                          text:
                              "unless you choose to cancel your membership within the 7-day trial period.\n\n",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            // 🔸 underline this line
                            decorationColor: AppColors.blackColor,
                            decorationThickness: 1.5,
                            fontWeight: FontWeight.normal,
                            fontFamily: FontFamily.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              "We aim to respond to all queries within 24 hours, Monday–Friday, though complex issues may take longer. "
                              "If you wish to cancel your membership after the trial period, we just require a 7-working-day notice before your monthly/annual renewal date. "
                              "Once signed up, you can reach us anytime via the ‘Chat with us’ option for any questions.\n\n"
                              "We look forward to supporting you and helping you build a very successful business.\n\n",
                        ),
                      ],
                    ),
                  ),

                  // Founder section side-by-side
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Many thanks,\nAlex Shelton\nFounder, The Advice Centre Ltd",
                          // style: TextStyle(
                          //   fontSize: 14,
                          //   height: 1.4,
                          //   fontWeight: FontWeight.w500,
                          // ),
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.regular),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(Imgs.askAlex1Image),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
