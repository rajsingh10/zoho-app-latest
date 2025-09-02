import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/membershipFindOutMore/joinTodayPageScreen.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/fontFamily.dart';
import '../../../../../utils/images.dart';
import '../../../../authentications/signup/view/registerScreen.dart';
import '../../webviewScreen.dart';

class membershipFindOutMorePageScreen extends StatefulWidget {
  const membershipFindOutMorePageScreen({super.key});

  @override
  State<membershipFindOutMorePageScreen> createState() =>
      _membershipFindOutMorePageScreenState();
}

class SupportCard {
  final String title;
  final String description;
  final IconData icon;

  SupportCard({
    required this.title,
    required this.description,
    required this.icon,
  });
}

List<SupportCard> supportCards = [
  SupportCard(
    title: "Social Media Ads Help!",
    description:
        "Why am I not making any sales from my Facebook/Instagram/TikTok Ads?",
    icon: Icons.messenger_outline,
  ),
  SupportCard(
    title: "E-commerce Support!",
    description:
        "How do I sell my products on Amazon, Etsy, Shopify and eBay? I need more sales!",
    icon: Icons.shopping_cart_outlined,
  ),
  SupportCard(
    title: "Artificial Intelligence Guidance",
    description:
        "How does Artificial Intelligence impact my business? What do I need to implement now?",
    icon: Icons.memory,
  ),
  SupportCard(
    title: "Social Media Strategy Support",
    description:
        "Can you take a look at my planned social media posts/Ads? I need more customers!",
    icon: Icons.show_chart,
  ),
  SupportCard(
    title: "SEO & Pay Per Click Advice",
    description:
        "Why am I getting hardly any sales from my website? Can you help me make the best use of my budget!",
    icon: Icons.paid,
  ),
  SupportCard(
    title: "Marketing Planning Support",
    description:
        "I have a budget and targets to meet but what I'm doing at the moment isn't working, please help?!",
    icon: Icons.bar_chart,
  ),
];

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

class _membershipFindOutMorePageScreenState
    extends State<membershipFindOutMorePageScreen> {
  List<Testimonials> testimonialList = [
    Testimonials(
      name: 'Phil Carter',
      position: 'Carters of Chapeltown',
      description:
          '"We have benefited from their professional marketing advice provided for many years. Couldn’t recommend the Marketing Advice Centre highly enough!"',
    ),
    Testimonials(
      name: 'Joyce Matthews',
      position: 'Safety Surfaces',
      description:
          '"We don’t have our own ‘in house’ marketing department, so having a marketing team to go to for specific advice about our marketing such as Facebook, getting sales from LinkedIn, Google Shopping, using Adwords to generate leads has been invaluable."',
    ),
    Testimonials(
      name: 'Rob Pickersgill',
      position: 'W Hallam Castings Ltd',
      description:
          '"We’ve dealt with the Advice Centre for a number of years and they have helped us with marketing advice on a range of areas including LinkedIn, CRM Systems, SEO, email marketing and websites. They are there whenever we need them to discuss marketing."',
    ),
    Testimonials(
      name: 'Richard Abdy',
      position: 'Wentworth Pewter',
      description:
          '“Alex has an extensive knowledge of all aspects of all the major shopping channels and social media that we use as a company and we have no hesitation in recommending him to others.”',
    ),
  ];
  int type = 1;
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = -1;
  final List<Map<String, dynamic>> plans = [
    {
      "title": "Start-up (Monthly)",
      "title1":
          "Build Your Business with Powerful Online Training: Monthly Membership",
      "price": "£47",
      "billing": "Billed Monthly",
      "features": [
        "Monthly Membership: One Member",
        "No Contract (just a 7 Day Cancellation Notice)",
        "24/7 Access to Powerful 'On Demand' Strategic & Digital Marketing Training"
            "Please note: For Personal 1-2-1 Advice & Guidance, please select either the 'Pro' or 'Premium' Plan"
      ]
    },
    {
      "title": "Pro (Monthly)",
      "title1":
          "Build Your Business with Powerful Online Training & Professional Marketing Advice: Monthly Membership",
      "price": "£247",
      "billing": "Billed Monthly",
      "features": [
        "Get Started with a 7-Day Free Trial!",
        "Monthly Membership: One Member",
        "No Contract (just a 7 Day Cancellation Notice)",
        "Pro-Active Liaison with your Account Manager to keep you on track!",
        "Up to 120mins a Month Marketing Advice whenever you need it: Strategic/Digital/E-Commerce/Social Media/Ads & more! (Email, Live Chat, WhatsApp, Advice Tickets - we aim to respond within 24hrs Mon-Fri)"
      ]
    },
    {
      "title": "Premium (Monthly)",
      "title1":
          "Build Your Business with Powerful Online Training, Professional Marketing Advice & 1-2-1 Catch-up Sessions: Monthly Membership",
      "price": "£500",
      "billing": "Billed Monthly",
      "features": [
        "Monthly 1-2-1 Marketing Consultancy (60min Online Session)",
        "Additional 120mins a Month (Total 240mins) Marketing Advice whenever you need it: Strategic/Digital/E-Commerce/Social Media/Ads & more! (Email, Live Chat, WhatsApp, Advice Tickets - we aim to respond within 24hrs Mon-Fri)",
      ]
    },
  ];
  final List<Map<String, dynamic>> plans1 = [
    {
      "title": "Start-up (Yearly Discount)",
      "title1":
          "Build Your Business with Powerful Online Training: Yearly Membership",
      "price": "£500",
      "billing": "Billed Yearly",
      "features": [
        "Yearly Membership: One Member",
        "Sign up for 12 Months: SAVE Over 15%",
        "24/7 Access to Powerful 'On Demand' Strategic & Digital Marketing Training",
        "Please note: For Personal 1-2-1 Advice & Guidance, please select either the 'Pro' or 'Premium' Plan"
      ]
    },
    {
      "title": "Pro (Yearly Discount)",
      "title1":
          "Build Your Business with Powerful Online Training & Professional Marketing Advice: Yearly Membership",
      "price": "£2500",
      "billing": "Billed Yearly",
      "features": [
        "Yearly Membership: One Member",
        "Sign up for 12 Months: SAVE Over 15%",
        "Pro-Active Liaison with your Account Manager to keep you on track!",
        "Up to 120mins a Month Marketing Advice whenever you need it: Strategic/Digital/E-Commerce/Social Media/Ads & more! (Email, Live Chat, WhatsApp, Advice Tickets - we aim to respond within 24hrs Mon-Fri)"
      ]
    },
    {
      "title": "Premium (Yearly Discount)",
      "title1":
          "Build Your Business with Powerful Online Training, Professional Marketing Advice & 1-2-1 Catch-up Sessions: Yearly Membership",
      "price": "£5000",
      "billing": "Billed Yearly",
      "features": [
        "Sign up for 12 Months: SAVE Over 15%",
        "Monthly 1-2-1 Marketing Consultancy (60min Online Session)",
        "Additional 120mins a Month (Total 240mins) Marketing Advice whenever you need it: Strategic/Digital/E-Commerce/Social Media/Ads & more! (Email, Live Chat, WhatsApp, Advice Tickets - we aim to respond within 24hrs Mon-Fri)"
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
                                  horizontal: 1.w, vertical: 2.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff232f3f)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        Imgs.photo122344,
                                        scale: 2.5,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(WebviewScreen(
                                            link:
                                                "https://calendly.com/alexander-shelton/marketing-advice-centre-demo",
                                          ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
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
                                                  fontSize: 15.sp,
                                                  color: AppColors.whiteColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      FontFamily.extraBold),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Marketing",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.extraBold),
                                      ),
                                      Text(
                                        "Advice...",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.extraBold),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Whenever you",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.extraBold),
                                      ),
                                      Text(
                                        "need it!",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.extraBold),
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
                              height: 1.5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Text(
                                "Unlock the Power of Ai in Your Digital Marketing Strategy",
                                style: TextStyle(
                                    fontSize: 14.5.sp,
                                    color: const Color(0xff594faf),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontFamily.bold),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Image.asset(
                              Imgs.chantgptphoto,
                              fit: BoxFit.cover,
                              height: 25.h,
                              width: 85.w,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: SizedBox(
                                width: 90.w,
                                child: Text(
                                  "Ai isn't just for tech giants-it's a powerful tool that all businesses can use to work smarter.Form automating repetitive tasks to predicting customer behaviour, AI can help you make better marketing decisions,faster...",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xff0b3a51),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: FontFamily.regular),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              width: Device.width,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 2.h),
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffe9e7e7),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Work with a professional Marketing",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: const Color(0xff0b3a51),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.regular),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Consultant and grow your business",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: const Color(0xff0b3a51),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.regular),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "for just £47+VAT a month.",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: const Color(0xff0b3a51),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.regular),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  Imgs.alexImage,
                                  scale: 25,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 1.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffe9e7e7),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Meet Alex",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      SizedBox(
                                        width: 65.w,
                                        child: Text(
                                          "Alex is a leading UK-based Amazon & Digital Marketing Consultant. With a background in Marketing, he founded the AMZ Business Academy to teach his skills to aspiring Entrepreneurs & Existing Businesses!",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: FontFamily.regular),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.w, vertical: 1.h),
                              width: Device.width,
                              color: const Color(0xff63A9D6),
                              child: Wrap(
                                spacing: 2.w,
                                runSpacing: 1.h,
                                alignment: WrapAlignment.center,
                                children: supportCards.map((card) {
                                  return Container(
                                    width: 45.w,
                                    height: 14.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 1.w, vertical: 1.h),
                                    alignment: Alignment.center,
                                    color: Colors.white,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Icon(
                                            card.icon,
                                            color: const Color(0xff01A44E),
                                            size: 18.sp,
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            card.title,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: const Color(0xff3c4576),
                                              fontWeight: FontWeight.normal,
                                              fontFamily: FontFamily.regular,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          SizedBox(
                                            width: 40.w,
                                            child: Text(
                                              card.description,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color: const Color(0xff3c4576),
                                                fontWeight: FontWeight.normal,
                                                fontFamily: FontFamily.regular,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  'Our Testimonials:',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.bgColor,
                                      fontFamily: FontFamily.extraBold,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      height: 12.h,
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
                                              height: 20.h,
                                              width: 42.w,
                                              margin: EdgeInsets.all(10.sp),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffe9e7e7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.h,
                                                  horizontal: 4.w),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
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
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: 60.h,
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
                                                      color:
                                                          AppColors.blackColor,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    fontFamily:
                                                        FontFamily.light,
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
                                                "Strategic & Digital Marketing Advice from Professional UK-based Marketing Consultants as and when you need it!",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: AppColors.blackColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily:
                                                        FontFamily.regular),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.w,
                                                            vertical: 1.h),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: type == 1
                                                          ? AppColors
                                                              .orangeColor
                                                          : AppColors
                                                              .whiteColor,
                                                    ),
                                                    child: Text(
                                                      "Pay Monthly",
                                                      style: TextStyle(
                                                          fontSize: 14.5.sp,
                                                          color: AppColors
                                                              .blackColor,
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.w,
                                                            vertical: 1.h),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: type == 2
                                                          ? AppColors
                                                              .orangeColor
                                                          : AppColors
                                                              .whiteColor,
                                                    ),
                                                    child: Text(
                                                      "Pay Yearly",
                                                      style: TextStyle(
                                                          fontSize: 14.5.sp,
                                                          color: AppColors
                                                              .blackColor,
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
                                        height: 20.h,
                                        width: Device.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        decoration: const BoxDecoration(
                                            color: Color(0xff232f3f)),
                                      ),
                                    ],
                                  ),
                                  // Positioned(
                                  //   top: Device.height * 0.15,
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
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(10),
                                  //                 color: AppColors.whiteColor),
                                  //             child: Column(
                                  //               mainAxisSize: MainAxisSize.min,
                                  //               children: [
                                  //                 Text(
                                  //                   "START-UP (MONTHLY)",
                                  //                   style: TextStyle(
                                  //                       fontSize: 17.sp,
                                  //                       color: AppColors
                                  //                           .blackColor,
                                  //                       fontWeight:
                                  //                           FontWeight.normal,
                                  //                       fontFamily:
                                  //                           FontFamily.regular),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   height: 1.h,
                                  //                 ),
                                  //                 Text(
                                  //                   "Build Your Business with Powerful Online",
                                  //                   style: TextStyle(
                                  //                       fontSize: 15.sp,
                                  //                       color: AppColors
                                  //                           .blackColor,
                                  //                       fontWeight:
                                  //                           FontWeight.normal,
                                  //                       fontFamily:
                                  //                           FontFamily.regular),
                                  //                 ),
                                  //                 Text(
                                  //                   "Training: Monthly Membership",
                                  //                   style: TextStyle(
                                  //                       fontSize: 15.sp,
                                  //                       color: AppColors
                                  //                           .blackColor,
                                  //                       fontWeight:
                                  //                           FontWeight.bold,
                                  //                       fontFamily:
                                  //                           FontFamily.bold),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   height: 3.h,
                                  //                 ),
                                  //                 Text(
                                  //                   "£47",
                                  //                   style: TextStyle(
                                  //                       fontSize: 18.sp,
                                  //                       color: AppColors
                                  //                           .blackColor,
                                  //                       fontWeight:
                                  //                           FontWeight.bold,
                                  //                       fontFamily: FontFamily
                                  //                           .extraBold),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   height: 1.h,
                                  //                 ),
                                  //                 Text(
                                  //                   "Build Monthly",
                                  //                   style: TextStyle(
                                  //                       fontSize: 15.sp,
                                  //                       color: AppColors
                                  //                           .blackColor,
                                  //                       fontWeight:
                                  //                           FontWeight.bold,
                                  //                       fontFamily:
                                  //                           FontFamily.bold),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   height: 1.h,
                                  //                 ),
                                  //                 InkWell(
                                  //                   onTap: () {
                                  //                     Get.to(
                                  //                       joinTodayPageScreen(),
                                  //                       transition: Transition
                                  //                           .rightToLeft,
                                  //                       duration: Duration(
                                  //                           milliseconds: 250),
                                  //                     );
                                  //                   },
                                  //                   child: Container(
                                  //                     padding:
                                  //                         EdgeInsets.symmetric(
                                  //                             horizontal: 18.w,
                                  //                             vertical: 1.h),
                                  //                     decoration: BoxDecoration(
                                  //                         borderRadius:
                                  //                             BorderRadius
                                  //                                 .circular(10),
                                  //                         color: Color(
                                  //                             0xfff78800)),
                                  //                     child: Text(
                                  //                       "JOIN TODAY",
                                  //                       style: TextStyle(
                                  //                           fontSize: 15.sp,
                                  //                           color: AppColors
                                  //                               .blackColor,
                                  //                           fontWeight:
                                  //                               FontWeight.bold,
                                  //                           fontFamily:
                                  //                               FontFamily
                                  //                                   .bold),
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   height: 1.h,
                                  //                 ),
                                  //                 Column(
                                  //                   mainAxisAlignment:
                                  //                       MainAxisAlignment.start,
                                  //                   crossAxisAlignment:
                                  //                       CrossAxisAlignment
                                  //                           .start,
                                  //                   children: [
                                  //                     Row(
                                  //                       mainAxisAlignment:
                                  //                           MainAxisAlignment
                                  //                               .start,
                                  //                       children: [
                                  //                         SizedBox(
                                  //                           width: 1.w,
                                  //                         ),
                                  //                         Icon(
                                  //                           Icons.check,
                                  //                           color:
                                  //                               AppColors.gray,
                                  //                           size: 15.sp,
                                  //                         ),
                                  //                         SizedBox(
                                  //                           width: 1.w,
                                  //                         ),
                                  //                         Text(
                                  //                           "Monthly Membership:One Member",
                                  //                           style: TextStyle(
                                  //                               fontSize: 15.sp,
                                  //                               color: AppColors
                                  //                                   .blackColor,
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .normal,
                                  //                               fontFamily:
                                  //                                   FontFamily
                                  //                                       .regular),
                                  //                         ),
                                  //                       ],
                                  //                     ),
                                  //                     SizedBox(
                                  //                       height: 1.h,
                                  //                     ),
                                  //                     Row(
                                  //                       mainAxisAlignment:
                                  //                           MainAxisAlignment
                                  //                               .start,
                                  //                       crossAxisAlignment:
                                  //                           CrossAxisAlignment
                                  //                               .start,
                                  //                       children: [
                                  //                         SizedBox(
                                  //                           width: 1.w,
                                  //                         ),
                                  //                         Icon(
                                  //                           Icons.check,
                                  //                           color:
                                  //                               AppColors.gray,
                                  //                           size: 15.sp,
                                  //                         ),
                                  //                         SizedBox(
                                  //                           width: 1.w,
                                  //                         ),
                                  //                         Text(
                                  //                           "No Contract(just a 7 Day Cancellation\nNotice)",
                                  //                           style: TextStyle(
                                  //                               fontSize: 15.sp,
                                  //                               color: AppColors
                                  //                                   .blackColor,
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .normal,
                                  //                               fontFamily:
                                  //                                   FontFamily
                                  //                                       .regular),
                                  //                         ),
                                  //                       ],
                                  //                     ),
                                  //                     SizedBox(
                                  //                       height: 1.h,
                                  //                     ),
                                  //                     Row(
                                  //                       mainAxisAlignment:
                                  //                           MainAxisAlignment
                                  //                               .start,
                                  //                       crossAxisAlignment:
                                  //                           CrossAxisAlignment
                                  //                               .start,
                                  //                       children: [
                                  //                         SizedBox(
                                  //                           width: 1.w,
                                  //                         ),
                                  //                         Icon(
                                  //                           Icons.check,
                                  //                           color:
                                  //                               AppColors.gray,
                                  //                           size: 15.sp,
                                  //                         ),
                                  //                         SizedBox(
                                  //                           width: 1.w,
                                  //                         ),
                                  //                         Text(
                                  //                           "24/7 Access To Powerful 'On Demand'\nStrategic & Digital Marketing Training",
                                  //                           style: TextStyle(
                                  //                               fontSize: 15.sp,
                                  //                               color: AppColors
                                  //                                   .blackColor,
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .normal,
                                  //                               fontFamily:
                                  //                                   FontFamily
                                  //                                       .regular),
                                  //                         ),
                                  //                       ],
                                  //                     ),
                                  //                     SizedBox(
                                  //                       height: 1.h,
                                  //                     ),
                                  //                     Row(
                                  //                       mainAxisAlignment:
                                  //                           MainAxisAlignment
                                  //                               .start,
                                  //                       crossAxisAlignment:
                                  //                           CrossAxisAlignment
                                  //                               .start,
                                  //                       children: [
                                  //                         SizedBox(
                                  //                           width: 1.w,
                                  //                         ),
                                  //                         Icon(
                                  //                           Icons.check,
                                  //                           color:
                                  //                               AppColors.gray,
                                  //                           size: 15.sp,
                                  //                         ),
                                  //                         SizedBox(
                                  //                           width: 1.w,
                                  //                         ),
                                  //                         Text(
                                  //                           "Please note:For Personal 1-2-1 Advice &\nGuidance,please select either the 'Pro' or\n'PremiumPlan",
                                  //                           style: TextStyle(
                                  //                               fontSize: 15.sp,
                                  //                               color: AppColors
                                  //                                   .blackColor,
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .normal,
                                  //                               fontFamily:
                                  //                                   FontFamily
                                  //                                       .regular),
                                  //                         ),
                                  //                       ],
                                  //                     ),
                                  //                   ],
                                  //                 ),
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
                                    top: MediaQuery.of(context).size.height *
                                        0.22,
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .80,
                                            // fixed height for card list
                                            child: type == 1
                                                ? ListView.builder(
                                                    controller:
                                                        _scrollController,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: plans.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final plan = plans[index];
                                                      return Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .65,
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 8),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
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
                                                                    plan[
                                                                        "price"],
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
                                                                    plan[
                                                                        "billing"],
                                                                    style: TextStyle(
                                                                        fontSize: 13
                                                                            .sp,
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            FontFamily.light),
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
                                                                        const joinTodayPageScreen(),
                                                                        transition:
                                                                            Transition.rightToLeft,
                                                                        duration:
                                                                            const Duration(milliseconds: 250),
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: 10
                                                                              .w,
                                                                          vertical:
                                                                              0.5.h),
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              5),
                                                                          color:
                                                                              AppColors.orangeColor),
                                                                      child:
                                                                          Text(
                                                                        "Join Today",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15.sp,
                                                                            color: AppColors.blackColor,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontFamily: FontFamily.bold),
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
                                                                        Icons
                                                                            .check,
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        size:
                                                                            16),
                                                                    const SizedBox(
                                                                        width:
                                                                            4),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        plan["features"]
                                                                            [
                                                                            fIndex],
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14.sp,
                                                                            color: AppColors.blackColor,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontFamily: FontFamily.bold),
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
                                                    controller:
                                                        _scrollController,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: plans1.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final plan =
                                                          plans1[index];
                                                      return Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .65,
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 8),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
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
                                                                    plan[
                                                                        "price"],
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
                                                                    plan[
                                                                        "billing"],
                                                                    style: TextStyle(
                                                                        fontSize: 13
                                                                            .sp,
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            FontFamily.light),
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
                                                                        const joinTodayPageScreen(),
                                                                        transition:
                                                                            Transition.rightToLeft,
                                                                        duration:
                                                                            const Duration(milliseconds: 250),
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: 10
                                                                              .w,
                                                                          vertical:
                                                                              0.5.h),
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              5),
                                                                          color:
                                                                              AppColors.orangeColor),
                                                                      child:
                                                                          Text(
                                                                        "Join Today",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15.sp,
                                                                            color: AppColors.blackColor,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontFamily: FontFamily.bold),
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
                                                                        Icons
                                                                            .check,
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        size:
                                                                            16),
                                                                    const SizedBox(
                                                                        width:
                                                                            4),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        plan["features"]
                                                                            [
                                                                            fIndex],
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14.sp,
                                                                            color: AppColors.blackColor,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontFamily: FontFamily.bold),
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
                              height: 12.h,
                            ),
                          ],
                        ),
                        Positioned(
                            top: 23.h,
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
                                  Imgs.marketingadv,
                                  scale: 5.5,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () => Get.to(
                const Registerscreen(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 250),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                margin: EdgeInsets.symmetric(vertical: 3.h),
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
                  'Start Free Trial',
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
    );
  }
}
