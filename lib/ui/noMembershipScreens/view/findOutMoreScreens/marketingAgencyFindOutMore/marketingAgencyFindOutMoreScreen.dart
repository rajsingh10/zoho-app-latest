import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/fontFamily.dart';
import '../../../../../utils/images.dart';
import '../../webviewScreen.dart';
import 'marketingAgencyJoinTodayPageScreen.dart';

class marketingAgencyFindOutMorePageScreen extends StatefulWidget {
  const marketingAgencyFindOutMorePageScreen({super.key});

  @override
  State<marketingAgencyFindOutMorePageScreen> createState() =>
      _marketingAgencyFindOutMorePageScreenState();
}

class _marketingAgencyFindOutMorePageScreenState
    extends State<marketingAgencyFindOutMorePageScreen> {
  int type = 1;
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = -1;
  final List<Map<String, dynamic>> plans = [
    {
      "title": "Marketing Agency: Professional Plan (2.5 Days a Month)",
      "price": "£2500",
      "billing": "Billed Monthly",
      "features": [
        "Your Marketing... Done for you. 2.5 Days a Month (15hrs Consultancy Support)",
        "No Contract (just a 30 Day Cancellation Notice)",
        "Social Media Management, Social Media Ads, Google Ads, SEO, Blogging, Landing Pages & so much more!",
        "Pro-Active Liaison with your Marketing Account Manager to keep you on track!",
        "Time Involvement Tracked by Professional Time Tracking Software",
        "Your Account Manager will contact you within 24 working hours after sign-up to agree the Marketing/Advertising work to be undertaken",
        "Ideal for Businesses promoting their Products/Services in the UK"
      ]
    },
    {
      "title": "Marketing Agency: Premium Plan (5 Days a Month)",
      "price": "£5000",
      "billing": "Billed Monthly",
      "features": [
        "Your Marketing... Done for you. 5 Days a Month (30hrs Consultancy Support)",
        "No Contract (just a 30 Day Cancellation Notice)",
        "Social Media Management, Social Media Ads, Google Ads, SEO, Blogging, Landing Pages & so much more!",
        "Pro-Active Liaison with your Marketing Account Manager to keep you on track!",
        "Time Involvement Tracked by Professional Time Tracking Software",
        "Your Account Manager will contact you within 24 working hours after sign-up to agree the Marketing/Advertising work to be undertaken",
        "Ideal for Businesses promoting their Products/Services Globally or need more Intensive Support!"
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
            child: InkWell(
              onTap: () {
                Get.to(WebviewScreen(
                  link:
                      "https://calendly.com/alexander-shelton/15-minute-call-with-a-marketing-specialist-agency",
                ));
              },
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
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Container(
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
                                            vertical: 1.h, horizontal: 2.w),
                                        child: Text(
                                          "Book a FREE Demo",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.extraBold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 52.w,
                                      child: Text(
                                        "Your Marketing... ‘Done For You’",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.extraBold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                            padding: EdgeInsets.symmetric(
                                vertical: 3.h, horizontal: 1.w),
                            decoration: BoxDecoration(
                              color: Color(0xffE7E6E6),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: Image.asset(
                                    Imgs.amzAgency1Photo,
                                    width: 40.w,
                                    height: 17.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 55.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          'We support UK businesses of all sizes...',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 17.sp,
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
                                SizedBox(
                                  width: 43.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          'We’re independent Amazon Consultants',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.orangeColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.bold),
                                        ),
                                      ),
                                      Text(
                                        'As Amazon Consultants we can take care of Listing Products, Product Optimisation (Amazon SEO), Amazon Sponsored Ads, Image Development, Video Development, A+ Content Development, Storefront Development & so much more.',
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
                                                    fontFamily:
                                                        FontFamily.bold),
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
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Container(
                                      height: 21.h,
                                      width: Device.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      decoration: BoxDecoration(
                                          color: Color(0xff232f3f)),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top:
                                      MediaQuery.of(context).size.height * 0.18,
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .80,
                                            // fixed height for card list
                                            child: ListView.builder(
                                              controller: _scrollController,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: plans.length,
                                              itemBuilder: (context, index) {
                                                final plan = plans[index];
                                                return Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .65,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 8),
                                                  padding: EdgeInsets.all(16),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          plan["title"],
                                                          style: TextStyle(
                                                              fontSize: 14.5.sp,
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
                                                                  marketingAgencyJoinTodayPageScreen(),
                                                                  transition:
                                                                      Transition
                                                                          .rightToLeft,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          250),
                                                                );
                                                              },
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal: 10
                                                                            .w,
                                                                        vertical:
                                                                            0.5.h),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: AppColors
                                                                        .orangeColor),
                                                                child: Text(
                                                                  "Select Plan",
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
                                                              Icon(Icons.check,
                                                                  color: AppColors
                                                                      .blackColor,
                                                                  size: 16),
                                                              SizedBox(
                                                                  width: 4),
                                                              Expanded(
                                                                child: Text(
                                                                  plan["features"]
                                                                      [fIndex],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.sp,
                                                                      color: AppColors
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .bold),
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
                                            )),
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
                          top: 22.h,
                          right: 5.w,
                          child: Container(
                            height: 25.w,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(90),
                                border: Border.all(
                                    width: 1,
                                    color:
                                        AppColors.blackColor) // round corners
                                ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 2.w),
                              child: Image.asset(
                                Imgs.theagency,
                                scale: 2.5,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
