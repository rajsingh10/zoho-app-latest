import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/justAskAlexFindOutMore/joinTodayPageScreen.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/fontFamily.dart';
import '../../../../../utils/images.dart';

class JustAskAlexFindOutMorePageScreen extends StatefulWidget {
  const JustAskAlexFindOutMorePageScreen({super.key});

  @override
  State<JustAskAlexFindOutMorePageScreen> createState() =>
      _JustAskAlexFindOutMorePageScreenState();
}

class Testimonials {
  final String name;
  final String position;

  final String description;

  Testimonials({
    required this.name,
    required this.position,
    required this.description,
  });
}

class _JustAskAlexFindOutMorePageScreenState
    extends State<JustAskAlexFindOutMorePageScreen> {
  List<Testimonials> testimonialList = [
    Testimonials(
      name: 'Darrell Price',
      position: 'Amazon UK Private Seller',
      description:
          '“Alex’s depth of knowledge of the Amazon platform & what it takes to successfully sell on Amazon is exceptional.”',
    ),
    Testimonials(
      name: 'Richard Abdy',
      position: 'Wentworth Pewter',
      description:
          '“Alex has an extensive knowledge of all aspects of all the major shopping channels and social media that we use as a company and we have no hesitation in recommending him to others.”',
    ),
    Testimonials(
      name: 'Mayur Patel',
      position: 'NM Favours',
      description:
          '“So far I have generated over £100k of sales in just a few short months with lot’s more potential for further growth! Many thanks Alex”',
    ),
    Testimonials(
      name: 'Mark Prince',
      position: 'Nurcroft',
      description:
          '“Alex is a great example of someone who is a true expert in their field. I would highly recommend him to any business wishing to succeed in driving sales on Amazon.”',
    ),
  ];
  int type = 1;
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = -1;
  final List<Map<String, dynamic>> plans = [
    {
      "title": "Just Ask Alex: Gold (Monthly)",
      "price": "£2500",
      "billing": "Billed Monthly",
      "features": ["Up to 7hrs a Month Advice & Support from Alex"]
    },
    {
      "title": "Just Ask Alex: Platinum (Monthly)",
      "price": "£247",
      "billing": "Billed Monthly",
      "features": ["Up to 14hrs a Month Advice & Support from Alex"]
    },
  ];
  final List<Map<String, dynamic>> plans1 = [
    {
      "title": "Just Ask Alex: Gold (Yearly)",
      "price": "£25000",
      "billing": "Billed Yearly",
      "features": [
        "Up to 7hrs a Month Advice & Support from Alex",
        "Pay Yearly SAVE Over 15%"
      ]
    },
    {
      "title": "Just Ask Alex: Platinum (Yearly)",
      "price": "£50000",
      "billing": "Billed Yearly",
      "features": [
        "Up to 14hrs a Month Advice & Support from Alex",
        "Pay Yearly SAVE Over 15%"
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
            decoration: const BoxDecoration(color: AppColors.orangeColor),
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
                    const Icon(null),
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
                              color: const Color(0xff232f3f)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    Imgs.askAlex1Image,
                                    scale: 5,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 40.w,
                                child: Column(
                                  children: [
                                    Text(
                                      "Meet Alex...",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.extraBold),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      "Your new Digital Marketing and Amazon Consultant!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: FontFamily.regular),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ),
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
                            color: const Color(0xffE7E6E6),
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
                                        'Just Ask Alex',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: AppColors.bgColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'Need Digital Marketing & Amazon Advice?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.orangeColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold),
                                      ),
                                    ),
                                    Text(
                                      'Alex is committed to helping your business thrive online. \n\nWhether that be through social media advertising, optimising product listings, expanding internationally or content creation.',
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
                                  Imgs.homeImage,
                                  width: 50.w,
                                  height: 15.h,
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
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          width: 96.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffE7E6E6),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  Imgs.askAlex2Image,
                                  width: 30.w,
                                  height: 15.h,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                width: 62.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Access to Alex’s Personal WhatsApp number',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: AppColors.orangeColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold),
                                      ),
                                    ),
                                    Text(
                                      'Immediate access to Alex’s personal WhatsApp number, the most direct way to contact Alex for Digital Marketing & Amazon assistance!',
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
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 20.h,
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  height: 10.h,
                                  color: AppColors.orangeColor,
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (int i = 0;
                                        i < testimonialList.length;
                                        i++)
                                      Center(
                                        child: Container(
                                          height: 15.h,
                                          width: 42.w,
                                          margin: EdgeInsets.all(10.sp),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffe9e7e7),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.h, horizontal: 4.w),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                testimonialList[i].name,
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: AppColors.bgColor,
                                                    fontFamily:
                                                        FontFamily.extraBold,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 0.h,
                                              ),
                                              Text(
                                                testimonialList[i].position,
                                                style: TextStyle(
                                                    fontSize: 13.5.sp,
                                                    color: AppColors.bgColor,
                                                    fontFamily:
                                                        FontFamily.regular,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Expanded(
                                                // <--- key fix here
                                                child: SingleChildScrollView(
                                                  child: Text(
                                                    testimonialList[i]
                                                        .description,
                                                    style: TextStyle(
                                                      fontSize: 12.5.sp,
                                                      color: AppColors.bgColor,
                                                      fontFamily:
                                                          FontFamily.regular,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 50.h,
                          width: Device.width,
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffe9e7e7),
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
                                              "from just £2500+VAT a month",
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
                                            "Your 'go to' Amazon & Digital Marketing consultant. Anytime, anywhere.",
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
                                    height: 8.h,
                                  ),
                                  Container(
                                    height: 22.h,
                                    width: Device.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    decoration: const BoxDecoration(
                                        color: Color(0xff232f3f)),
                                  ),
                                ],
                              ),
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
                                    const SizedBox(width: 8),

                                    // Horizontal Plans List
                                    Expanded(
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .60,
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
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16),
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
                                                                    const JustAskAlexJoinTodayPageScreen(),
                                                                    transition:
                                                                        Transition
                                                                            .rightToLeft,
                                                                    duration: const Duration(
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
                                                                    "Work With Alex",
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
                                                          const SizedBox(
                                                              height: 10),
                                                          ...List.generate(
                                                              (plan["features"]
                                                                      as List)
                                                                  .length,
                                                              (fIndex) {
                                                            return Row(
                                                              children: [
                                                                const Icon(
                                                                    Icons.check,
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    size: 16),
                                                                const SizedBox(
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
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16),
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
                                                                    const JustAskAlexJoinTodayPageScreen(),
                                                                    transition:
                                                                        Transition
                                                                            .rightToLeft,
                                                                    duration: const Duration(
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
                                                                    "Work With Alex",
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
                                                          const SizedBox(
                                                              height: 10),
                                                          ...List.generate(
                                                              (plan["features"]
                                                                      as List)
                                                                  .length,
                                                              (fIndex) {
                                                            return Row(
                                                              children: [
                                                                const Icon(
                                                                    Icons.check,
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    size: 16),
                                                                const SizedBox(
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

                                    const SizedBox(width: 8),

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
                      top: 21.h,
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
                            Imgs.justaskalex,
                            scale: 2.5,
                          ),
                        ),
                      ),
                    ),
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
