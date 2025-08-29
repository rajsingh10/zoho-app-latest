import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/fontFamily.dart';
import '../../../../../utils/images.dart';
import '../../webviewScreen.dart';
import 'amzAgencyJoinTodayPageScreen.dart';

class amzAgencyFindOutMoreScreen extends StatefulWidget {
  const amzAgencyFindOutMoreScreen({super.key});

  @override
  State<amzAgencyFindOutMoreScreen> createState() =>
      _amzAgencyFindOutMoreScreenState();
}

class _amzAgencyFindOutMoreScreenState
    extends State<amzAgencyFindOutMoreScreen> {
  int type = 1;
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = -1;
  final List<Map<String, dynamic>> plans = [
    {
      "title": "AMZ Agency: Professional Plan (3 Days a Month)",
      "price": "£2500",
      "billing": "Billed Monthly",
      "features": [
        "Amazon Seller Central Account Management: 3 Days a Month (21hrs Consultancy Support)",
        "No Contract (just a 30 Day Cancellation Notice)",
        "Pro-Active Liaison with your Account Manager to keep you on track!"
            "Marketing/Advertising work done for you! Including Product Uploads, Content Optimisation, Image Development, Storefront Development, A+ Content Development & more!"
            "FBA & Logistics Advice where required"
            "UK, EU, USA, Canada, Australia Marketplaces"
            "Time Involvement Tracked by Professional Time Tracking Software"
            "Your Account Manager will contact you within 24 working hours after sign-up to agree the Marketing/Advertising work to be undertaken"
      ]
    },
    {
      "title": "AMZ Agency: Premium Plan (6 Days a Month)",
      "price": "£5000",
      "billing": "Billed Monthly",
      "features": [
        "Amazon Seller Central Account Management: 6 Days a Month (42hrs Consultancy Support)",
        "No Contract (just a 30 Day Cancellation Notice)",
        "Pro-Active Liaison with your Account Manager to keep you on track!",
        "Marketing/Advertising work done for you! Including Product Uploads, Content Optimisation, Image Development, Storefront Development, A+ Content Development & more!"
            "FBA & Logistics Advice where required"
            "UK, EU, USA, Canada, Australia Marketplaces"
            "Time Involvement Tracked by Professional Time Tracking Software"
            "Your Account Manager will contact you within 24 working hours after sign-up to agree the Marketing/Advertising work to be undertaken"
      ]
    },
  ];
  final List<Map<String, dynamic>> plans1 = [
    {
      "title": "AMZ Agency: Professional Plan (3 Days a Month) Yearly Discount",
      "price": "£25000",
      "billing": "Billed Yearly",
      "features": [
        "Amazon Seller Central Account Management: 3 Days a Month (21hrs Consultancy Support)",
        "Pro-Active Liaison with your Account Manager to keep you on track!"
            "Marketing/Advertising work done for you! Including Product Uploads, Content Optimisation, Image Development, Storefront Development, A+ Content Development & more!"
            "FBA & Logistics Advice where required"
            "UK, EU, USA, Canada, Australia Marketplaces"
            "Time Involvement Tracked by Professional Time Tracking Software"
            "Your Account Manager will contact you within 24 working hours after sign-up to agree the Marketing/Advertising work to be undertaken"
            "Sign up for 12 Months: SAVE Over 15%",
      ]
    },
    {
      "title": "AMZ Agency: Premium Plan (6 Days a Month)",
      "price": "£50000",
      "billing": "Billed Yearly",
      "features": [
        "Amazon Seller Central Account Management: 6 Days a Month (42hrs Consultancy Support)",
        "Pro-Active Liaison with your Account Manager to keep you on track!",
        "Marketing/Advertising work done for you! Including Product Uploads, Content Optimisation, Image Development, Storefront Development, A+ Content Development & more!"
            "FBA & Logistics Advice where required"
            "UK, EU, USA, Canada, Australia Marketplaces"
            "Time Involvement Tracked by Professional Time Tracking Software"
            "Your Account Manager will contact you within 24 working hours after sign-up to agree the Marketing/Advertising work to be undertaken"
            "Sign up for 12 Months: SAVE Over 15%"
      ]
    },
  ];

  final double _containerWidth = 320;

  // 👉 Right scroll
  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + _containerWidth,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // 👉 Left scroll
  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - _containerWidth,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            width: Device.width,
            decoration: BoxDecoration(color: AppColors.orangeColor),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        Imgs.backIcon,
                        scale: 30,
                      ),
                    ),
                    Image.asset(
                      Imgs.namedLogo,
                      scale: 5.5,
                      color: AppColors.whiteColor,
                    ),
                    Icon(null),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: Device.width,
              color: AppColors.whiteColor,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 2.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 2.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff232f3f)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    Imgs.amzAgencyManPhoto,
                                    scale: 1.3,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(WebviewScreen(
                                        link:
                                            "https://calendly.com/alexander-shelton/15-minute-call-with-an-amazon-specialist-amzagency",
                                      ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF00B4DB),
                                            Color(0xFF38EF7D)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            10), // round corners
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 3.w),
                                        child: Text(
                                          "Book a FREE Demo",
                                          style: TextStyle(
                                              fontSize: 15.5.sp,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.extraBold),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 47.w,
                                child: Column(
                                  children: [
                                    Text(
                                      "Seller Central Amazon Account Management Services!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.extraBold),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          width: 96.w,
                          decoration: BoxDecoration(
                            color: Color(0xffE7E6E6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.asset(
                                  Imgs.amzAgency1Photo,
                                  width: 38.w,
                                  height: 17.h,
                                ),
                              ),
                              SizedBox(
                                width: 53.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        'We support UK businesses of all sizes...',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: AppColors.orangeColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold),
                                      ),
                                    ),
                                    Text(
                                      'in hundreds of different categories to grow their Amazon Sales & achieve serious sales (up to £350k a month!)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: FontFamily.regular),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 96.w,
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          decoration: BoxDecoration(
                            color: Color(0xffE7E6E6),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 2.w,
                              ),
                              // SizedBox(
                              //   width: 43.w,
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Center(
                              //         child: Text(
                              //           'We’re independent Amazon Consultants',
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //               fontSize: 14.sp,
                              //               color: AppColors.orangeColor,
                              //               fontWeight: FontWeight.bold,
                              //               fontFamily: FontFamily.bold),
                              //         ),
                              //       ),
                              //       SizedBox(height: 1.h,),
                              //       Text(
                              //         'As Amazon Consultants we can take care of Listing Products, Product Optimisation (Amazon SEO), Amazon Sponsored Ads, Image Development, Video Development, A+ Content Development, Storefront Development & so much more.',
                              //         textAlign: TextAlign.center,
                              //         style: TextStyle(
                              //             fontSize: 14.sp,
                              //             color: AppColors.blackColor,
                              //             fontWeight: FontWeight.normal,
                              //             fontFamily: FontFamily.regular),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              SizedBox(
                                width: 43.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: AutoSizeText(
                                        'We’re independent Amazon Consultants',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.orangeColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.bold,
                                        ),
                                        maxLines: 3,
                                        // heading max 2 lines
                                        minFontSize: 12,
                                        // auto shrink
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    AutoSizeText(
                                      'As Amazon Consultants we can take care of Listing Products, Product Optimisation (Amazon SEO), Amazon Sponsored Ads, Image Development, Video Development, A+ Content Development, Storefront Development & so much more.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: FontFamily.regular,
                                      ),
                                      maxLines: 8,
                                      // paragraph multi-line allow
                                      minFontSize: 11,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Image.asset(
                                Imgs.amzAgency2Photo,
                                width: 47.w,
                                height: 14.h,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 60.h,
                          width: Device.width,
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffe9e7e7),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.w, vertical: 1.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "No Contract!",
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: FontFamily.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "from just £47+VAT a month",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: AppColors.blackColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: FontFamily.light,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        SizedBox(
                                          width: 90.w,
                                          child: Text(
                                            "Let our Independent UK Amazon Consultants Manage your Seller Central Account & help grow your Online Sales!",
                                            style: TextStyle(
                                                fontSize: 14.5.sp,
                                                color: AppColors.blackColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: FontFamily.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  type = 1;
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w,
                                                    vertical: 1.h),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: type == 1
                                                      ? AppColors.orangeColor
                                                      : AppColors.whiteColor,
                                                ),
                                                child: Text(
                                                  "Pay Monthly",
                                                  style: TextStyle(
                                                      fontSize: 14.5.sp,
                                                      color:
                                                          AppColors.blackColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          FontFamily.bold),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  type = 2;
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w,
                                                    vertical: 1.h),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: type == 2
                                                      ? AppColors.orangeColor
                                                      : AppColors.whiteColor,
                                                ),
                                                child: Text(
                                                  "Pay Yearly (SAVE Over 15%)",
                                                  style: TextStyle(
                                                      fontSize: 14.5.sp,
                                                      color:
                                                          AppColors.blackColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          FontFamily.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    height: 20.h,
                                    width: Device.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    decoration:
                                        BoxDecoration(color: Color(0xff232f3f)),
                                  ),
                                ],
                              ),
                              // Positioned(
                              //   top: Device.height * 0.18,
                              //   left: 0,
                              //   right: 0,
                              //   child: Center(
                              //     child: SingleChildScrollView(
                              //       scrollDirection: Axis.horizontal,
                              //       child: Row(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.center,
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         mainAxisSize: MainAxisSize.min,
                              //         children: [
                              //           ShaderMask(
                              //             shaderCallback: (bounds) =>
                              //                 LinearGradient(
                              //               colors: [
                              //                 Color(0xff29a99a),
                              //                 Color(0xff73d35f)
                              //               ],
                              //               begin: Alignment.topLeft,
                              //               end: Alignment.bottomRight,
                              //             ).createShader(bounds),
                              //             blendMode: BlendMode.srcIn,
                              //             // This keeps only the gradient where image is visible
                              //             child: Image.asset(
                              //               Imgs.backIcon,
                              //               scale: 30,
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             width: 1.w,
                              //           ),
                              //           Container(
                              //             width: 65.w,
                              //             height: 45.h,
                              //             padding: EdgeInsets.only(bottom: 1.h),
                              //             decoration: BoxDecoration(
                              //               borderRadius:
                              //                   BorderRadius.circular(10),
                              //               color: AppColors.whiteColor,
                              //             ),
                              //             child: SingleChildScrollView(
                              //               child: Column(
                              //                 mainAxisSize: MainAxisSize.min,
                              //                 children: [
                              //                   Container(
                              //                     padding: EdgeInsets.symmetric(
                              //                         vertical: 0.8.h),
                              //                     decoration: BoxDecoration(
                              //                       color: Color(0xFFF78800),
                              //                       // orange color as shown
                              //                       borderRadius:
                              //                           BorderRadius.only(
                              //                         topLeft:
                              //                             Radius.circular(10),
                              //                         topRight:
                              //                             Radius.circular(10),
                              //                       ),
                              //                     ),
                              //                     child: Center(
                              //                       child: Text(
                              //                         "MOST POPULAR",
                              //                         style: TextStyle(
                              //                           fontSize: 16.sp,
                              //                           fontWeight:
                              //                               FontWeight.bold,
                              //                           color: Colors.black,
                              //                           fontFamily: FontFamily
                              //                               .bold, // or remove if you use default bold
                              //                         ),
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   SizedBox(
                              //                     height: 1.h,
                              //                   ),
                              //                   Text(
                              //                     "AMZ AGENCY: PROFESSIONAL PLAN\n(3 DAYS A MONTH)",
                              //                     style: TextStyle(
                              //                       fontSize: 17.sp,
                              //                       color: AppColors.blackColor,
                              //                       fontWeight:
                              //                           FontWeight.normal,
                              //                       fontFamily:
                              //                           FontFamily.regular,
                              //                     ),
                              //                     textAlign: TextAlign.center,
                              //                   ),
                              //                   SizedBox(height: 3.h),
                              //                   Text(
                              //                     "£2500",
                              //                     style: TextStyle(
                              //                       fontSize: 18.sp,
                              //                       color: AppColors.blackColor,
                              //                       fontWeight: FontWeight.bold,
                              //                       fontFamily:
                              //                           FontFamily.extraBold,
                              //                     ),
                              //                   ),
                              //                   SizedBox(height: 1.h),
                              //                   Text(
                              //                     "Billed Monthly",
                              //                     style: TextStyle(
                              //                       fontSize: 15.sp,
                              //                       color: AppColors.blackColor,
                              //                       fontWeight: FontWeight.bold,
                              //                       fontFamily: FontFamily.bold,
                              //                     ),
                              //                   ),
                              //                   SizedBox(height: 1.h),
                              //                   InkWell(
                              //                     onTap: () {
                              //                       Get.to(
                              //                         amzAgencyJoinTodayPageScreen(),
                              //                         transition: Transition
                              //                             .rightToLeft,
                              //                         duration: Duration(
                              //                             milliseconds: 250),
                              //                       );
                              //                     },
                              //                     child: Container(
                              //                       padding:
                              //                           EdgeInsets.symmetric(
                              //                               horizontal: 18.w,
                              //                               vertical: 1.h),
                              //                       decoration: BoxDecoration(
                              //                         borderRadius:
                              //                             BorderRadius.circular(
                              //                                 10),
                              //                         color: Color(0xfff78800),
                              //                       ),
                              //                       child: Text(
                              //                         "SELECT PLAN",
                              //                         style: TextStyle(
                              //                           fontSize: 15.sp,
                              //                           color: AppColors
                              //                               .blackColor,
                              //                           fontWeight:
                              //                               FontWeight.bold,
                              //                           fontFamily:
                              //                               FontFamily.bold,
                              //                         ),
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   SizedBox(height: 1.h),
                              //                   Column(
                              //                     mainAxisAlignment:
                              //                         MainAxisAlignment.start,
                              //                     crossAxisAlignment:
                              //                         CrossAxisAlignment.start,
                              //                     children: [
                              //                       Row(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment
                              //                                 .start,
                              //                         children: [
                              //                           SizedBox(width: 1.w),
                              //                           Icon(Icons.check,
                              //                               color:
                              //                                   AppColors.gray,
                              //                               size: 15.sp),
                              //                           SizedBox(width: 1.w),
                              //                           Text(
                              //                             "Amazon Seller Central Account\nManagement: 3 Days a Month\n(21hrs Consultancy Support)",
                              //                             style: TextStyle(
                              //                               fontSize: 15.sp,
                              //                               color: AppColors
                              //                                   .blackColor,
                              //                               fontWeight:
                              //                                   FontWeight
                              //                                       .normal,
                              //                               fontFamily:
                              //                                   FontFamily
                              //                                       .regular,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                       SizedBox(height: 1.h),
                              //                       Row(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment
                              //                                 .start,
                              //                         children: [
                              //                           SizedBox(width: 1.w),
                              //                           Icon(Icons.check,
                              //                               color:
                              //                                   AppColors.gray,
                              //                               size: 15.sp),
                              //                           SizedBox(width: 1.w),
                              //                           Text(
                              //                             "No Contract (just a 30 Day\nCancellation Notice)",
                              //                             style: TextStyle(
                              //                               fontSize: 15.sp,
                              //                               color: AppColors
                              //                                   .blackColor,
                              //                               fontWeight:
                              //                                   FontWeight
                              //                                       .normal,
                              //                               fontFamily:
                              //                                   FontFamily
                              //                                       .regular,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                       SizedBox(height: 1.h),
                              //                       Row(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment
                              //                                 .start,
                              //                         children: [
                              //                           SizedBox(width: 1.w),
                              //                           Icon(Icons.check,
                              //                               color:
                              //                                   AppColors.gray,
                              //                               size: 15.sp),
                              //                           SizedBox(width: 1.w),
                              //                           Text(
                              //                             "Pro-Active Liaison with your Account\nManager to keep you on track!",
                              //                             style: TextStyle(
                              //                               fontSize: 15.sp,
                              //                               color: AppColors
                              //                                   .blackColor,
                              //                               fontWeight:
                              //                                   FontWeight
                              //                                       .normal,
                              //                               fontFamily:
                              //                                   FontFamily
                              //                                       .regular,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                       SizedBox(height: 1.h),
                              //                       Row(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment
                              //                                 .start,
                              //                         children: [
                              //                           SizedBox(width: 1.w),
                              //                           Icon(Icons.check,
                              //                               color:
                              //                                   AppColors.gray,
                              //                               size: 15.sp),
                              //                           SizedBox(width: 1.w),
                              //                           Text(
                              //                             "Marketing/Advertising work done for\nyou! Including Product Uploads, Content\nOptimisation, Image Development,\nStorefront Development, A+ Content\nDevelopment & more!",
                              //                             style: TextStyle(
                              //                               fontSize: 15.sp,
                              //                               color: AppColors
                              //                                   .blackColor,
                              //                               fontWeight:
                              //                                   FontWeight
                              //                                       .normal,
                              //                               fontFamily:
                              //                                   FontFamily
                              //                                       .regular,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                       SizedBox(height: 1.h),
                              //                       Row(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment
                              //                                 .start,
                              //                         children: [
                              //                           SizedBox(width: 1.w),
                              //                           Icon(Icons.check,
                              //                               color:
                              //                                   AppColors.gray,
                              //                               size: 15.sp),
                              //                           SizedBox(width: 1.w),
                              //                           Text(
                              //                             "FBA & Logistics Advice where required",
                              //                             style: TextStyle(
                              //                               fontSize: 15.sp,
                              //                               color: AppColors
                              //                                   .blackColor,
                              //                               fontWeight:
                              //                                   FontWeight
                              //                                       .normal,
                              //                               fontFamily:
                              //                                   FontFamily
                              //                                       .regular,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                       SizedBox(height: 1.h),
                              //                       Row(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment
                              //                                 .start,
                              //                         children: [
                              //                           SizedBox(width: 1.w),
                              //                           Icon(Icons.check,
                              //                               color:
                              //                                   AppColors.gray,
                              //                               size: 15.sp),
                              //                           SizedBox(width: 1.w),
                              //                           Text(
                              //                             "UK, EU, USA, Canada, Australia",
                              //                             style: TextStyle(
                              //                               fontSize: 15.sp,
                              //                               color: AppColors
                              //                                   .blackColor,
                              //                               fontWeight:
                              //                                   FontWeight
                              //                                       .normal,
                              //                               fontFamily:
                              //                                   FontFamily
                              //                                       .regular,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             width: 1.w,
                              //           ),
                              //           InkWell(
                              //             onTap: () {},
                              //             child: Transform.rotate(
                              //               angle: 3.1416,
                              //               child: ShaderMask(
                              //                 shaderCallback: (bounds) =>
                              //                     LinearGradient(
                              //                   colors: [
                              //                     Color(0xff29a99a),
                              //                     Color(0xff73d35f)
                              //                   ],
                              //                   begin: Alignment.topLeft,
                              //                   end: Alignment.bottomRight,
                              //                 ).createShader(bounds),
                              //                 blendMode: BlendMode.srcIn,
                              //                 // This keeps only the gradient where image is visible
                              //                 child: Image.asset(
                              //                   Imgs.backIcon,
                              //                   scale: 30,
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.21,
                                left: 15,
                                right: 25,
                                child: Row(
                                  children: [
                                    // Left fixed button
                                    InkWell(
                                      onTap: _scrollLeft,
                                      child: ShaderMask(
                                        shaderCallback: (bounds) =>
                                            const LinearGradient(
                                          colors: [
                                            Color(0xff29a99a),
                                            Color(0xff73d35f)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ).createShader(bounds),
                                        blendMode: BlendMode.srcIn,
                                        child: Image.asset(Imgs.backIcon,
                                            scale: 30),
                                      ),
                                    ),
                                    SizedBox(width: 8),

                                    // Horizontal Plans List
                                    Expanded(
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .80,
                                        // fixed height for card list
                                        child: type == 1
                                            ? ListView.builder(
                                                controller: _scrollController,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: plans.length,
                                                itemBuilder: (context, index) {
                                                  final plan = plans[index];
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .65,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                    padding: EdgeInsets.all(16),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            plan["title"],
                                                            style: TextStyle(
                                                                fontSize:
                                                                    14.5.sp,
                                                                color: AppColors
                                                                    .blackColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                plan["price"],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        FontFamily
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                plan["billing"],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        FontFamily
                                                                            .light),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.to(
                                                                    amzAgencyJoinTodayPageScreen(),
                                                                    transition:
                                                                        Transition
                                                                            .rightToLeft,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            250),
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          10.w,
                                                                      vertical:
                                                                          0.5.h),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: AppColors
                                                                          .orangeColor),
                                                                  child: Text(
                                                                    "Select Plan",
                                                                    style: TextStyle(
                                                                        fontSize: 15
                                                                            .sp,
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            FontFamily.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          SizedBox(height: 10),
                                                          ...List.generate(
                                                              (plan["features"]
                                                                      as List)
                                                                  .length,
                                                              (fIndex) {
                                                            return Row(
                                                              children: [
                                                                Icon(
                                                                    Icons.check,
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    size: 16),
                                                                SizedBox(
                                                                    width: 4),
                                                                Expanded(
                                                                  child: Text(
                                                                    plan["features"]
                                                                        [
                                                                        fIndex],
                                                                    style: TextStyle(
                                                                        fontSize: 14
                                                                            .sp,
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            FontFamily.bold),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          }),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            : ListView.builder(
                                                controller: _scrollController,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: plans1.length,
                                                itemBuilder: (context, index) {
                                                  final plan = plans1[index];
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .65,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                    padding: EdgeInsets.all(16),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            plan["title"],
                                                            style: TextStyle(
                                                                fontSize:
                                                                    14.5.sp,
                                                                color: AppColors
                                                                    .blackColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                plan["price"],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        FontFamily
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                plan["billing"],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        FontFamily
                                                                            .light),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.to(
                                                                    amzAgencyJoinTodayPageScreen(),
                                                                    transition:
                                                                        Transition
                                                                            .rightToLeft,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            250),
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          10.w,
                                                                      vertical:
                                                                          0.5.h),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: AppColors
                                                                          .orangeColor),
                                                                  child: Text(
                                                                    "Select Plan",
                                                                    style: TextStyle(
                                                                        fontSize: 15
                                                                            .sp,
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            FontFamily.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          SizedBox(height: 10),
                                                          ...List.generate(
                                                              (plan["features"]
                                                                      as List)
                                                                  .length,
                                                              (fIndex) {
                                                            return Row(
                                                              children: [
                                                                Icon(
                                                                    Icons.check,
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    size: 16),
                                                                SizedBox(
                                                                    width: 4),
                                                                Expanded(
                                                                  child: Text(
                                                                    plan["features"]
                                                                        [
                                                                        fIndex],
                                                                    style: TextStyle(
                                                                        fontSize: 14
                                                                            .sp,
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            FontFamily.bold),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          }),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                      ),
                                    ),

                                    SizedBox(width: 8),

                                    // Right fixed button
                                    InkWell(
                                      onTap: _scrollRight,
                                      child: Transform.rotate(
                                        angle: 3.1416,
                                        child: ShaderMask(
                                          shaderCallback: (bounds) =>
                                              const LinearGradient(
                                            colors: [
                                              Color(0xff29a99a),
                                              Color(0xff73d35f)
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ).createShader(bounds),
                                          blendMode: BlendMode.srcIn,
                                          child: Image.asset(Imgs.backIcon,
                                              scale: 30),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                      ],
                    ),
                    Positioned(
                        top: 19.h,
                        right: 5.w,
                        child: Container(
                          height: 25.w,
                          width: 25.w,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(90),
                              border: Border.all(
                                  width: 1,
                                  color: AppColors.blackColor) // round corners
                              ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 2.w),
                            child: Image.asset(
                              Imgs.amzagency,
                              scale: 2.5,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
