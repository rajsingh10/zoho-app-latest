import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/introducersFindOutMore/introducersTodayPageScreen.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/fontFamily.dart';
import '../../../../../utils/images.dart';

class IntroducersFindOutMorePageScreen extends StatefulWidget {
  const IntroducersFindOutMorePageScreen({super.key});

  @override
  State<IntroducersFindOutMorePageScreen> createState() =>
      _IntroducersFindOutMorePageScreenState();
}

class _IntroducersFindOutMorePageScreenState
    extends State<IntroducersFindOutMorePageScreen> {
  int type = 1;
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = -1;
  final List<Map<String, dynamic>> plans = [
    {
      "title": "The Advice Centre Introducers (Level 1 - Monthly)",
      "price": "£50",
      "billing": "Billed Monthly",
      "features": [
        "The Advice Centre Introducers. One Membership: Pay Yearly (Level 1 of 3)",
        "Increase your Monthly Income for you & your family",
        "You'll earn 10% Commission on All Successful Pay Monthly & Pay Yearly Plans you Introduce (AMZ Advice Centre & Marketing Advice Centre)",
        "Introduce 25 members successfully: Move to Level 2 (12% commissions). Earn an additional 3% commission on successful sales of every member you introduce.",
        "Introduce 50 members successfully: Move to Level 1 (15% commissions). Earn an additional 3% commission on successful sales of every member you introduce.",
        "Introduce 50 members successfully: Gain 12 months of access to The Advice Centre VIP Membership Plan to help grow your own business.",
        "Sales Training from The Advice Centre Ltd to help you Sell The Advice Centre Membership Programmes.",
        "Sales Support via email whenever you need it! We aim to respond within 24hrs (Mon-Fri)",
        "Please Note: If you cancel your membership, you will forfeit all future commissions.",
        "Read our Terms & Conditions before signing up!",
      ]
    },
  ];
  final List<Map<String, dynamic>> plans1 = [
    {
      "title": "The Advice Centre Introducers (Level 1 - Yearly)",
      "price": "£500",
      "billing": "Billed Yearly",
      "features": [
        "The Advice Centre Introducers. One Membership: Pay Yearly (Level 1 of 3)",
        "Increase your Monthly Income for you & your family",
        "You'll earn 10% Commission on All Successful Pay Monthly & Pay Yearly Plans you Introduce (AMZ Advice Centre & Marketing Advice Centre)",
        "Introduce 25 members successfully: Move to Level 2 (12% commissions). Earn an additional 3% commission on successful sales of every member you introduce.",
        "Introduce 50 members successfully: Move to Level 1 (15% commissions). Earn an additional 3% commission on successful sales of every member you introduce.",
        "Introduce 50 members successfully: Gain 12 months of access to The Advice Centre VIP Membership Plan to help grow your own business.",
        "Sales Training from The Advice Centre Ltd to help you Sell The Advice Centre Membership Programmes.",
        "Sales Support via email whenever you need it! We aim to respond within 24hrs (Mon-Fri)",
        "Please Note: If you cancel your membership, you will forfeit all future commissions.",
        "Read our Terms & Conditions before signing up!",
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
                        // Container(
                        //   margin: EdgeInsets.symmetric(
                        //       horizontal: 2.w, vertical: 2.h),
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 2.w, vertical: 0.h),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: Color(0xff232f3f)),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       Column(
                        //         children: [
                        //           Image.asset(
                        //             Imgs.intro1Image,
                        //             scale: 5,
                        //           ),
                        //         ],
                        //       ),
                        //       SizedBox(
                        //         width: 40.w,
                        //         child: Column(
                        //           children: [
                        //             SizedBox(
                        //               height: 2.h,
                        //             ),
                        //             Text(
                        //               "Giving you Financial Freedom & Savings for your Business!",
                        //               textAlign: TextAlign.center,
                        //               style: TextStyle(
                        //                   fontSize: 17.5.sp,
                        //                   color: AppColors.whiteColor,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontFamily: FontFamily.extraBold),
                        //             ),
                        //             SizedBox(
                        //               height: 10.h,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Image.asset(
                            Imgs.makeymoneyone,
                            scale: 1,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          width: 96.w,
                          decoration: BoxDecoration(
                            color: Color(0xffE7E6E6),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  Imgs.intro2Image,
                                  width: 40.w,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                width: 50.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        'How do I make money?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: AppColors.orangeColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold),
                                      ),
                                    ),
                                    Text(
                                      'Simply INTRODUCE the AMZ Advice Centre or Marketing Advice Centre to Friends, Family Members, Business Owners or anyone who wants to start a Business and we\'ll pay you for every member you introduce that signs up!',
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
                              SizedBox(
                                width: 43.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        'How much will I MAKE & SAVE?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.orangeColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold),
                                      ),
                                    ),
                                    Text(
                                      'Earn 10–15% commission for every customer you refer! Plus, get a 3% bonus on referrals made by your team. \n\nReach Level 3 with 50 introductions to our Advice Centres and unlock 12 months of VIP Membership — worth over £5,000!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: FontFamily.regular),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  Imgs.intro3Image,
                                  width: 50.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 70.h,
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
                                            SizedBox(
                                              width: 80.w,
                                              child: Text(
                                                "Reach Level 3 with 50 introductions to our Advice Centres and unlock 12 months of VIP Membership — worth over £5,000!",
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: FontFamily.light,
                                                  fontStyle: FontStyle.italic,
                                                ),
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
                                            "Increase your monthly income for you & your family whilst growing your own Business!",
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
                                                  "Pay Yearly (SAVE 15%)",
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
                                    height: 12.h,
                                  ),
                                  Container(
                                    height: 18.h,
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
                              //             padding: EdgeInsets.symmetric(
                              //                 vertical: 1.h),
                              //             decoration: BoxDecoration(
                              //               borderRadius:
                              //                   BorderRadius.circular(10),
                              //               color: AppColors.whiteColor,
                              //             ),
                              //             child: Column(
                              //               mainAxisSize: MainAxisSize.min,
                              //               children: [
                              //                 Text(
                              //                   "THE ADVICE CENTRE INTRODUCERS\n(LEVEL 3 - MONTHLY)",
                              //                   textAlign: TextAlign.center,
                              //                   style: TextStyle(
                              //                     fontSize: 17.sp,
                              //                     color: AppColors.blackColor,
                              //                     fontWeight: FontWeight.normal,
                              //                     fontFamily:
                              //                         FontFamily.regular,
                              //                   ),
                              //                 ),
                              //                 SizedBox(height: 3.h),
                              //                 Text(
                              //                   "£50",
                              //                   style: TextStyle(
                              //                     fontSize: 22.sp,
                              //                     color: AppColors.blackColor,
                              //                     fontWeight: FontWeight.bold,
                              //                     fontFamily:
                              //                         FontFamily.extraBold,
                              //                   ),
                              //                 ),
                              //                 SizedBox(height: 1.h),
                              //                 Text(
                              //                   "Billed Monthly",
                              //                   style: TextStyle(
                              //                     fontSize: 15.sp,
                              //                     color: AppColors.blackColor,
                              //                     fontWeight: FontWeight.bold,
                              //                     fontFamily: FontFamily.bold,
                              //                   ),
                              //                 ),
                              //                 SizedBox(height: 2.h),
                              //                 InkWell(
                              //                   onTap: () {
                              //                     Get.to(
                              //                       IntroducersJoinTodayPageScreen(),
                              //                       transition:
                              //                           Transition.rightToLeft,
                              //                       duration: Duration(
                              //                           milliseconds: 250),
                              //                     );
                              //                   },
                              //                   child: Container(
                              //                     padding: EdgeInsets.symmetric(
                              //                         horizontal: 18.w,
                              //                         vertical: 1.2.h),
                              //                     decoration: BoxDecoration(
                              //                       borderRadius:
                              //                           BorderRadius.circular(
                              //                               10),
                              //                       color: Color(
                              //                           0xfffdd835), // Yellow button
                              //                     ),
                              //                     child: Text(
                              //                       "JOIN TODAY",
                              //                       style: TextStyle(
                              //                         fontSize: 15.sp,
                              //                         color:
                              //                             AppColors.blackColor,
                              //                         fontWeight:
                              //                             FontWeight.bold,
                              //                         fontFamily:
                              //                             FontFamily.bold,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 SizedBox(height: 2.h),
                              //                 buildBulletPoint(
                              //                     "The Advice Centre Introducers. One Membership: Pay Yearly (Level 3 of 3)"),
                              //                 buildBulletPoint(
                              //                     "Increase your Monthly Income for you & your family"),
                              //                 buildBulletPoint(
                              //                     "You'll earn 10% Commission on All Successful Pay Monthly & Pay Yearly Plans you Introduce (AMZ Advice Centre & Marketing Advice Centre)"),
                              //                 buildBulletPoint(
                              //                     "Introduce 25 members successfully: Move to Level 2 (12% commissions). Earn an additional 3% commission on successful sales of every member you introduce."),
                              //               ],
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
                                top: MediaQuery.of(context).size.height * 0.23,
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
                                            MediaQuery.of(context).size.height *
                                                .40,
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
                                                                    IntroducersJoinTodayPageScreen(),
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
                                                                          15.w,
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
                                                                    "Join Today",
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
                                                                    IntroducersJoinTodayPageScreen(),
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
                                                                          15.w,
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
                                                                    "Join Today",
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
                    // Positioned(
                    //     top: 16.h,
                    //     right: 5.w,
                    //     child: Container(
                    //       height: 25.w,
                    //       width: 25.w,
                    //       decoration: BoxDecoration(
                    //           color: AppColors.whiteColor,
                    //           borderRadius: BorderRadius.circular(90),
                    //           border: Border.all(
                    //               width: 1,
                    //               color: AppColors.blackColor) // round corners
                    //           ),
                    //       child: Padding(
                    //         padding: EdgeInsets.symmetric(
                    //             vertical: 1.h, horizontal: 2.w),
                    //         child: Image.asset(
                    //           Imgs.makemoneysavemoney,
                    //           scale: 2.5,
                    //         ),
                    //       ),
                    //     )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, color: AppColors.gray, size: 15.sp),
          SizedBox(width: 2.w),
          SizedBox(
            width: 60.w,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.5.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.normal,
                fontFamily: FontFamily.regular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
