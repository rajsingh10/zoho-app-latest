import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/landingScreen/view/landingScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/joinTodayButtonPage.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/webviewScreen.dart';
import 'package:zohosystem/utils/colors.dart';
import 'package:zohosystem/utils/fontFamily.dart';
import 'package:zohosystem/utils/orangeBottomBar.dart';

import '../../../utils/images.dart';
import '../../landingScreen/view/webViewAssociates.dart';
import 'findOutMoreScreens/amzAdviceFindOutMore/amzAdviceFindOutMoreScreen.dart';
import 'findOutMoreScreens/amzAgencyFindOutMore/amzAgencyFindOutMoreScreen.dart';
import 'findOutMoreScreens/introducersFindOutMore/introducersFindOutMorePageScreen.dart';
import 'findOutMoreScreens/justAskAlexFindOutMore/justAskAlexFindOutMorePageScreen.dart';
import 'findOutMoreScreens/marketingAgencyFindOutMore/marketingAgencyFindOutMoreScreen.dart';
import 'findOutMoreScreens/membershipFindOutMore/membershipFindOutMorePageScreen.dart';

class Nomembershomescreen extends StatefulWidget {
  const Nomembershomescreen({super.key});

  @override
  State<Nomembershomescreen> createState() => _NomembershomescreenState();
}

class Testimonials {
  final String name;
  final String position;
  final String photo;
  final String description;

  Testimonials({
    required this.name,
    required this.position,
    required this.photo,
    required this.description,
  });
}

class _NomembershomescreenState extends State<Nomembershomescreen> {
  final ScrollController _scrollController = ScrollController();
  bool isClick = false;
  List<Testimonials> testimonialList = [
    Testimonials(
      name: 'Phil Carter',
      position: 'Carters of Chapeltown',
      photo: Imgs.testi1Image,
      description:
          '"We have benefited from their professional marketing advice provided for many years. Great guys to deal with and they really know their stuff. Couldn’t recommend the Marketing Advice Centre highly enough!"',
    ),
    Testimonials(
      name: 'Mark Prince',
      position: 'Nucroft',
      photo: Imgs.testi2Image,
      description:
          '“Alex Shelton is a great example of someone who is a true expert in their field, he invests time and effort in keeping up with the latest developments and runs his own sales programme so that his advice is strengthened by the reality of day to day management of the Amazon platform...”',
    ),
    Testimonials(
      name: 'Joyce Matthews',
      position: 'Safety Surfaces',
      photo: Imgs.testi3Image,
      description:
          '"We don’t have our own ‘in house’ marketing department, so having a marketing team to go to for specific advice about our marketing such as Facebook, getting sales from LinkedIn, Google Shopping, using Adwords to generate leads has been invaluable."',
    ),
    Testimonials(
      name: 'Richard Abdy',
      position: 'Wentworth Pewter',
      photo: Imgs.testi4Image,
      description:
          '“Alex has an extensive knowledge of all aspects of all the major shopping channels and social media that we use as a company and we have no hesitation in recommending him to others. He understands our particular needs and provides training and ongoing management services that ensure we are aware of all opportunities that are open to us.”',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isClick = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          Column(
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
                            Get.offAll(const LandingScreen());
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: Device.width,
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 4.w),
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.cardBgColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Book a FREE Demo',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontFamily: FontFamily.bold,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 0.8.h,
                                  ),
                                  Text(
                                    'Ready to learn more? Book a quick call or demo with our founder to see how our services can support your goals.',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: FontFamily.regular,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    'Just tap one of the links below to choose a time that works for you!',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: FontFamily.bold,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.5.w, vertical: 1.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.whiteColor),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          Imgs.marketingadv,
                                          scale: 4.5,
                                          // color: AppColors.yellowColor1,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(WebviewScreen(
                                              link:
                                                  "https://calendly.com/alexander-shelton/marketing-advice-centre-demo?preview_source=et_card",
                                            ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.5.w,
                                                vertical: 0.8.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: const Color(0xff22a34d)),
                                            child: Text(
                                              "Book now",
                                              style: TextStyle(
                                                fontFamily: FontFamily.bold,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.whiteColor,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.8.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.5.w, vertical: 1.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.whiteColor),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          Imgs.amzserviceagency,
                                          scale: 2.6,
                                          // color: AppColors.yellowColor1,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(WebviewScreen(
                                              link:
                                                  "https://calendly.com/alexander-shelton/amz-advice-centre-demo?preview_source=et_card&month=2025-07",
                                            ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.5.w,
                                                vertical: 0.8.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: AppColors.orangeColor),
                                            child: Text(
                                              "Book now",
                                              style: TextStyle(
                                                fontFamily: FontFamily.bold,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.whiteColor,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.8.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.5.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.whiteColor),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              Imgs.makemoneysavemoney,
                                              scale: 3,
                                              // color: AppColors.yellowColor1,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(WebviewScreen(
                                                  link:
                                                      "https://calendly.com/alexander-shelton/the-advice-centre-introducers-demo",
                                                ));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.5.w,
                                                    vertical: 0.8.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color:
                                                        AppColors.yellowColor),
                                                child: Text(
                                                  "Book now",
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.bold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.whiteColor),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              Imgs.justaskalex,
                                              scale: 3.5,
                                              // color: AppColors.yellowColor1,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(WebviewScreen(
                                                  link:
                                                      "https://calendly.com/alexander-shelton/just-ask-alex-demo",
                                                ));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.5.w,
                                                    vertical: 0.8.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: AppColors.blueColor),
                                                child: Text(
                                                  "Book now",
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.bold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.8.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.5.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.whiteColor),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              Imgs.aicenterphoto,
                                              scale: 4.5,
                                              // color: AppColors.yellowColor1,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(WebviewScreen(
                                                  link:
                                                      "https://calendly.com/alexander-shelton/ai-advice-centre-demo",
                                                ));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.5.w,
                                                    vertical: 0.8.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: AppColors.perpl),
                                                child: Text(
                                                  "Book now",
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.bold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.whiteColor),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              Imgs.univercity,
                                              scale: 2.2,
                                              // color: AppColors.yellowColor1,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(WebviewScreen(
                                                  link:
                                                      "https://calendly.com/alexander-shelton/university-of-experts-demo",
                                                ));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.5.w,
                                                    vertical: 0.8.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color:
                                                        AppColors.orangeColor),
                                                child: Text(
                                                  "Book now",
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.bold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 10.w,
                              top: 19.h,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                height: 40.w,
                                width: 40.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: Image.asset(Imgs.alexImage),
                                ),
                              ),
                            ),
                            Positioned(
                              right: -0.5.w,
                              top: 14.h,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                height: 23.w,
                                width: 23.w,
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                decoration: const BoxDecoration(
                                    color: AppColors.bgColor,
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  'with Our Founder: Alex Shelton',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.whiteColor,
                                      fontFamily: FontFamily.regular,
                                      fontWeight: FontWeight.normal),
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Any Questions? \nWe’re available on the live chat!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.bgColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.bold,
                              fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: Device.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 2.h),
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          decoration: BoxDecoration(
                            color: AppColors.bgColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                Imgs.noHomeImg,
                                scale: 3.2,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 40.w,
                                    child: Text(
                                      'Join Alex’s FREE Online Amazon Training',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: AppColors.whiteColor,
                                          fontFamily: FontFamily.bold,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.8.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(WebviewScreen(
                                        link:
                                            "https://my.demio.com/ref/gpZNXaUdyUgOA2uU",
                                      ));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.w, vertical: 1.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff0097b2),
                                            Color(0xff7ed957),
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        'BOOK YOUR SPOT',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.5.sp,
                                            color: AppColors.whiteColor,
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Memberships to Transform Your Business:',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: AppColors.bgColor,
                                fontFamily: FontFamily.extraBold,
                                fontWeight: FontWeight.bold),
                          ),
                        ).marginSymmetric(horizontal: 3.w),
                        SizedBox(
                          height: 1.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.5.w, vertical: 1.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: const Color(0xff22a34d)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.marketingadv,
                                      scale: 5.5,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                            const membershipFindOutMorePageScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xff22a34d)),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.5.w, vertical: 1.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: AppColors.orangeColor),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.amzserviceagency,
                                      scale: 3.5,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                            const amzAdviceFindOutMoreScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.orangeColor),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.5.w, vertical: 1.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: AppColors.orangeColor),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.amzzaagencycenter,
                                      scale: 2.3,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                            const amzAgencyFindOutMoreScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.orangeColor),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.5.w, vertical: 1.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: const Color(0xff2274bb)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.theagency,
                                      scale: 2.6,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                            const marketingAgencyFindOutMorePageScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xff2274bb)),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.w, vertical: 0.5.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: const Color(0xff2274bb)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.alexmarkingphoto,
                                      scale: 4,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                            const JustAskAlexFindOutMorePageScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xff2274bb)),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(
                                      const IntroducersFindOutMorePageScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 0.5.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5.w,
                                          color: const Color(0xff2274bb)),
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.whiteColor),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        Imgs.makemoneysavemoney,
                                        fit: BoxFit.cover,
                                        width: 20.w, height: 5.h,
                                        // color: AppColors.yellowColor1,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(
                                              const IntroducersFindOutMorePageScreen());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w, vertical: 1.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: const Color(0xff2274bb)),
                                          child: Text(
                                            "Find Out More",
                                            style: TextStyle(
                                              fontFamily: FontFamily.bold,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.whiteColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(webViewAssociates(
                                      link:
                                          "https://www.aiadvicecentre.com/lander"));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 0.5.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5.w, color: AppColors.perpl),
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.whiteColor),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        Imgs.aicenterphoto,
                                        scale: 6,
                                        // color: AppColors.yellowColor1,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(webViewAssociates(
                                              link:
                                                  "https://www.aiadvicecentre.com/lander"));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.perpl),
                                          child: Text(
                                            "Find Out More",
                                            style: TextStyle(
                                              fontFamily: FontFamily.bold,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.whiteColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(webViewAssociates(
                                      link: "https://www.theadvicecentre.ltd"));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 0.5.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5.w,
                                          color: AppColors.blackColor),
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.whiteColor),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        Imgs.allinonevip,
                                        scale: 2.5,
                                        // color: AppColors.yellowColor1,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(webViewAssociates(
                                              link:
                                                  "https://www.theadvicecentre.ltd"));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.blackColor),
                                          child: Text(
                                            "Find Out More",
                                            style: TextStyle(
                                              fontFamily: FontFamily.bold,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.whiteColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(webViewAssociates(
                                      link: "https://www.bizboard.co.uk"));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 0.5.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5.w,
                                          color: AppColors.bizvoard),
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.whiteColor),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        Imgs.bizboard,
                                        scale: 3.6,
                                        // color: AppColors.yellowColor1,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(webViewAssociates(
                                              link:
                                                  "https://www.bizboard.co.uk"));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.bizvoard),
                                          child: Text(
                                            "Find Out More",
                                            style: TextStyle(
                                              fontFamily: FontFamily.bold,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.whiteColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(webViewAssociates(
                                      link:
                                          "https://www.thedeveloperagency.co.uk"));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 0.5.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5.w, color: AppColors.perpl),
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.whiteColor),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        Imgs.thedeveloperagency,
                                        scale: 2,
                                        // color: AppColors.yellowColor1,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(webViewAssociates(
                                              link:
                                                  "https://www.thedeveloperagency.co.uk"));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.perpl),
                                          child: Text(
                                            "Find Out More",
                                            style: TextStyle(
                                              fontFamily: FontFamily.bold,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.whiteColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 0.5.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5.w,
                                          color: AppColors.orangeColor),
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.whiteColor),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        Imgs.univercity,
                                        scale: 3,
                                        // color: AppColors.yellowColor1,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(webViewAssociates(
                                              link:
                                                  "https://www.universityofexperts.com"));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.orangeColor),
                                          child: Text(
                                            "Find Out More",
                                            style: TextStyle(
                                              fontFamily: FontFamily.bold,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.whiteColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(webViewAssociates(
                                      link: "https://www.amzbuddy.ai/"));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 0.5.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5.w,
                                          color: AppColors.bgColor),
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.whiteColor),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          Imgs.amzBuddy,
                                          scale: 6.5,
                                          // color: AppColors.yellowColor1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(webViewAssociates(
                                              link:
                                                  "https://www.amzbuddy.ai/"));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.bgColor),
                                          child: Text(
                                            "Find Out More",
                                            style: TextStyle(
                                              fontFamily: FontFamily.bold,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.whiteColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ).marginSymmetric(horizontal: 3.w),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Memberships to Transform You:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: AppColors.bgColor,
                                fontFamily: FontFamily.extraBold,
                                fontWeight: FontWeight.bold),
                          ),
                        ).marginSymmetric(horizontal: 3.w),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(
                                    const IntroducersFindOutMorePageScreen());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.w, vertical: 0.5.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: const Color(0xff2274bb)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.makemoneysavemoney,
                                      fit: BoxFit.cover,
                                      width: 20.w, height: 5.h,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                            const IntroducersFindOutMorePageScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xff2274bb)),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.w, vertical: 0.5.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: AppColors.orangeColor),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.univercity,
                                      scale: 3,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(webViewAssociates(
                                            link:
                                                "https://www.universityofexperts.com"));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.orangeColor),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ).marginSymmetric(horizontal: 3.w),
                        SizedBox(
                          height: 4.h,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              height: 35.h,
                              color: AppColors.bgColor,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    'Not Sure Which Membership Is Right for You?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: AppColors.whiteColor,
                                        fontFamily: FontFamily.extraBold,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(WebviewScreen(
                                            link:
                                                "https://survey.zohopublic.eu/zs/6QxtyX",
                                          ));
                                        },
                                        child: Container(
                                          height: 54.sp,
                                          width: 54.sp,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(colors: [
                                                Color(0xffffde59),
                                                Color(0xffff914d),
                                              ])),
                                          child: Text(
                                            'Take Our AMZ Membership Quiz!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: AppColors.whiteColor,
                                                fontFamily: FontFamily.bold,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(WebviewScreen(
                                            link:
                                                "https://survey.zohopublic.eu/zs/Qe6qEP",
                                          ));
                                        },
                                        child: Container(
                                          height: 54.sp,
                                          width: 54.sp,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(colors: [
                                                Color(0xff0097b2),
                                                Color(0xff7ed957),
                                              ])),
                                          child: Text(
                                            'Take Our Marketing Membership Quiz!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: AppColors.whiteColor,
                                                fontFamily: FontFamily.bold,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  'A Few Testimonials...',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.bgColor,
                                      fontFamily: FontFamily.extraBold,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 42.h,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      height: 20.h,
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
                                              height: 35.h,
                                              width: 42.w,
                                              margin: EdgeInsets.all(10.sp),
                                              color: AppColors.cardBgColor2,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.h,
                                                  horizontal: 4.w),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    testimonialList[i].photo,
                                                    fit: BoxFit.cover,
                                                    height: 35.sp,
                                                    width: 35.sp,
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Text(
                                                    testimonialList[i].name,
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color:
                                                            AppColors.bgColor,
                                                        fontFamily: FontFamily
                                                            .extraBold,
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
                                                        color:
                                                            AppColors.bgColor,
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
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Text(
                                                        testimonialList[i]
                                                            .description,
                                                        style: TextStyle(
                                                          fontSize: 12.5.sp,
                                                          color:
                                                              AppColors.bgColor,
                                                          fontFamily: FontFamily
                                                              .regular,
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
                          ],
                        ),
                        InkWell(
                          onTap: () => Get.to(
                            WebviewScreen(
                              link: "https://www.theadvicecentre.ltd",
                            ),
                          ),
                          child: Image.asset(
                            Imgs.homepagenew1,
                            scale: 1.3,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () => Get.to(
                            WebviewScreen(
                              link: "https://www.makemoneysavemoney-now.co.uk",
                            ),
                          ),
                          child: Image.asset(
                            Imgs.homepagenew2,
                            scale: 1.3,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.orange, width: 1.5),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: SizedBox(
                            height: 25.h,
                            child: Scrollbar(
                              thumbVisibility: true,
                              child: SingleChildScrollView(
                                child: RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      height: 1.6,
                                    ),
                                    children: [
                                      // 🔹 Centered "© The Advice Centre Ltd"
                                      WidgetSpan(
                                        child: Center(
                                          child: Text(
                                            "© The Advice Centre Ltd",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                      ),
                                      const WidgetSpan(
                                        child: SizedBox(height: 8),
                                      ),

                                      // 🔹 Centered "Disclaimer"
                                      WidgetSpan(
                                        child: Center(
                                          child: Text(
                                            "Disclaimer",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: Colors.black,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                      ),
                                      const WidgetSpan(
                                        child: SizedBox(height: 12),
                                      ),

                                      // 🔹 Main text (justified paragraphs)
                                      const TextSpan(
                                        text:
                                            "We are in no way endorsed or associated with Amazon, TikTok, Facebook, Instagram, ChatGPT, LinkedIn, Shopify, Zoho, Apple, Google, or any other digital marketing platforms. ",
                                      ),
                                      const TextSpan(
                                        text:
                                            "We are The Advice Centre Ltd, an independent UK-based advice and training organisation.\n\n",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const TextSpan(
                                        text:
                                            "All training, advice, and support provided are for educational and demonstration purposes only. ",
                                      ),
                                      const TextSpan(
                                        text:
                                            "We do not provide legal, financial, compliance or accounting advice, ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const TextSpan(
                                        text:
                                            "and any information shared should not be relied upon as such. It is your responsibility to seek independent advice from a qualified accountant, solicitor, or other professional before starting or operating your business.\n\n",
                                      ),
                                      const TextSpan(
                                        text:
                                            "Please note that, in addition to working with experienced professionals, we use AI tools such as ChatGPT in our business to assist with certain aspects of our services. By using our services, you acknowledge and accept that AI tools may be used to provide advice, guidance, or support in certain areas.\n\n",
                                      ),
                                      const TextSpan(
                                        text:
                                            "Examples of results or business outcomes shown are not typical ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const TextSpan(
                                        text:
                                            "and depend on factors outside our control, including your own effort, products, marketing activities, and market conditions. You are solely responsible for your business decisions, the products you choose to sell, services you choose to offer and the suppliers you work with. The Advice Centre Ltd accepts no responsibility or liability for any losses, damages, or outcomes resulting from your use of our services, information, or materials.\n\n",
                                      ),
                                      const TextSpan(
                                        text:
                                            "Automatic renewals are billed to the payment method selected (or your backup/alternate payment method) until cancelled. Your payment details may be securely stored for future purchases and subscription renewals. Payments are processed safely by Stripe and Zoho Billing in the United Kingdom. For billing queries, please contact ",
                                      ),
                                      const TextSpan(
                                        text:
                                            "accounts@theadvicecentre.ltd\n\n",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue,
                                        ),
                                      ),
                                      const TextSpan(
                                        text:
                                            "By using any of our services, you are deemed to have accepted our ",
                                      ),
                                      TextSpan(
                                        text: "Terms & Conditions",
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // launchUrl(Uri.parse("https://theadvicecentre.ltd/terms"));
                                          },
                                      ),
                                      const TextSpan(text: " and "),
                                      TextSpan(
                                        text: "Privacy Policy.",
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // launchUrl(Uri.parse("https://theadvicecentre.ltd/privacy"));
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.5.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () => Get.to(
                const joinTodayButtonPage(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 250),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                margin: EdgeInsets.only(bottom: 1.5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffffde59),
                      Color(0xfff1811b),
                      Color(0xfff1811b),
                    ],
                  ),
                ),
                child: Text(
                  'Join Today',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 19.sp,
                      color: AppColors.whiteColor,
                      fontFamily: FontFamily.bold,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: AppOrangeBottombar(
          selected: 1,
        ),
      ),
    );
  }
}
