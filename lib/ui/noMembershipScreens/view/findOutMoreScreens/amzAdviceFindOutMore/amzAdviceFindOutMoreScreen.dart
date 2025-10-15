import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/fontFamily.dart';
import '../../../../../utils/images.dart';
import '../../webviewScreen.dart';

class amzAdviceFindOutMoreScreen extends StatefulWidget {
  const amzAdviceFindOutMoreScreen({super.key});

  @override
  State<amzAdviceFindOutMoreScreen> createState() =>
      _amzAdviceFindOutMoreScreenState();
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

class _amzAdviceFindOutMoreScreenState
    extends State<amzAdviceFindOutMoreScreen> {
  int type = 1;
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = -1;
  final List<Map<String, dynamic>> plans = [
    {
      "title": "START-UP (MONTHLY)",
      "title1": "Build Your Business with Online Training & AI Tools",
      "price": "£47",
      "billing": "Billed Monthly",
      "features": [
        "Monthly Membership: One Member",
        "No Contract (just a 7 Day Cancellation Notice)",
        "Learn Alex Shelton's Ultimate Selling System, designed to help anyone start an Amazon Business from scratch!",
        "24/7 Access to the AMZ Business Academy (Powerful On-Demand Amazon Training following The Ultimate Selling System)"
            "AMZBuddy Start-up Plan (Powerful AI Chrome Extension) to help Build Your Amazon Business - Activate up to 50 times a month!"
            "Build your Amazon Business with On-Demand Training & Powerful Artificial Intelligence Tools!"
            "Please note: For Personal 1-2-1 Advice & Guidance, please select either the 'Pro' or 'Premium' Plan"
      ]
    },
    {
      "title": "AMZ Pro (Monthly)",
      "title1":
          "Build Your Business with Online Training, AI Tools & Personal Advice from Amazon Experts!",
      "price": "£247",
      "billing": "Billed Monthly",
      "features": [
        "Work directly with Amazon Experts to help you build your Amazon Business!",
        "Pro-Active Liaison with your Account Manager to help keep your Sales on track!",
        "Up to 120mins a Month Selling on Amazon Advice/How To Guidance from Alex & his team (advice is tailored around your Business & we aim to respond within 24hrs Mon-Fri)",
        "Advice Time is Tracked by Professional Time Tracking Software"
            "Advice on other E-Commerce platforms such as eBay, Shopify, Etsy, Social Media Shopping etc. included!"
            "Invitation to The AMZ Awards (Yearly UK Event)"
            "Access to On-Demand Amazon Services (with Exclusive Discounts to our Members)"
            "Access to Make Money Save Money (Earn Commission & Save on your Membership with 'The Advice Centre Introducers' Programme)"
            "SAVE on AMZScout To Help with Product Research (Yearly Plan-Seller's Bundle)"
            "Introductions to Alex's Expert Partners & Associates"
            "AMZBuddy Professional Plan (Powerful AI Chrome Extension) to help Build Your Amazon Business - Activate up to 150 times a month!"
      ]
    },
    {
      "title": "AMZ Premium (Monthly)",
      "title1":
          "Build Your Business with Online Training, AI Tools, Personal Advice from Amazon Experts & 1-2-1 Monthly Catch-ups!",
      "price": "£500",
      "billing": "Billed Monthly",
      "features": [
        "Additional 120mins a Month Selling on Amazon Advice/How To Guidance (Total 240mins)",
        "Monthly 1-2-1 Amazon Accountancy Advice from an E-commerce Accountant (up to 60min Online Session)",
        "Monthly 1-2-1 Amazon Seller Consultancy Catch-up (up to 60min Online Session)",
        "AMZBuddy Premium Plan (Powerful AI Chrome Extension) to help Build Your Amazon Business - Activate up to 500 times a month!"
      ]
    },
  ];
  final List<Map<String, dynamic>> plans1 = [
    {
      "title": "AMZ Start-up (Yearly Discount)",
      "title1": "Build Your Business with Online Training & AI Tools",
      "price": "£500",
      "billing": "Billed Monthly",
      "features": [
        "Monthly Membership: One Member",
        "No Contract (just a 7 Day Cancellation Notice)",
        "Learn Alex Shelton's Ultimate Selling System, designed to help anyone start an Amazon Business from scratch!",
        "24/7 Access to the AMZ Business Academy (Powerful On-Demand Amazon Training following The Ultimate Selling System)"
            "AMZBuddy Start-up Plan (Powerful AI Chrome Extension) to help Build Your Amazon Business - Activate up to 50 times a month!"
            "Build your Amazon Business with On-Demand Training & Powerful Artificial Intelligence Tools!"
            "Please note: For Personal 1-2-1 Advice & Guidance, please select either the 'Pro' or 'Premium' Plan"
      ]
    },
    {
      "title": "AMZ Pro (Yearly Discount)",
      "title1":
          "Build Your Business with Online Training, AI Tools & Personal Advice from Amazon Experts!",
      "price": "£2500",
      "billing": "Billed Monthly",
      "features": [
        "Work directly with Amazon Experts to help you build your Amazon Business!",
        "Pro-Active Liaison with your Account Manager to help keep your Sales on track!",
        "Up to 120mins a Month Selling on Amazon Advice/How To Guidance from Alex & his team (advice is tailored around your Business & we aim to respond within 24hrs Mon-Fri)",
        "Advice Time is Tracked by Professional Time Tracking Software"
            "Advice on other E-Commerce platforms such as eBay, Shopify, Etsy, Social Media Shopping etc. included!"
            "Invitation to The AMZ Awards (Yearly UK Event)"
            "Access to On-Demand Amazon Services (with Exclusive Discounts to our Members)"
            "Access to Make Money Save Money (Earn Commission & Save on your Membership with 'The Advice Centre Introducers' Programme)"
            "SAVE on AMZScout To Help with Product Research (Yearly Plan-Seller's Bundle)"
            "Introductions to Alex's Expert Partners & Associates"
            "AMZBuddy Professional Plan (Powerful AI Chrome Extension) to help Build Your Amazon Business - Activate up to 150 times a month!"
      ]
    },
    {
      "title": "AMZ Premium (Yearly Discount)",
      "title1":
          "Build Your Business with Online Training, AI Tools, Personal Advice from Amazon Experts & 1-2-1 Monthly Catch-ups!",
      "price": "£5000",
      "billing": "Billed Monthly",
      "features": [
        "Additional 120mins a Month Selling on Amazon Advice/How To Guidance (Total 240mins)",
        "Monthly 1-2-1 Amazon Accountancy Advice from an E-commerce Accountant (up to 60min Online Session)",
        "Monthly 1-2-1 Amazon Seller Consultancy Catch-up (up to 60min Online Session)",
        "AMZBuddy Premium Plan (Powerful AI Chrome Extension) to help Build Your Amazon Business - Activate up to 500 times a month!"
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

  List<Testimonials> testimonialList = [
    Testimonials(
      name: 'Mayur Patel',
      position: 'NM Favours',
      description:
          '“So far I have generated over £100k of sales in just a few short months with lot’s more potential for further growth! Many thanks Alex”',
    ),
    Testimonials(
      name: 'Darrell Price',
      position: 'Amazon UK Private Seller',
      description:
          '“Alex’s depth of knowledge of the Amazon platform & what it takes to successfully sell on Amazon is exceptional.”',
    ),
    Testimonials(
      name: 'Emily Roe',
      position: 'Craft Gin Club',
      description:
          '“Good news from my side, we are seeing good performance on Amazon now – thanks so much for your help!”',
    ),
    Testimonials(
      name: 'Mark Prince',
      position: 'Nurcroft',
      description:
          '“Alex is a great example of someone who is a true expert in their field. I would highly recommend him to any business wishing to succeed in driving sales on Amazon.”',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    Imgs.amzLadyPhoto,
                                    scale: 3.5,
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   width: 47.w,
                              //   child: Column(
                              //     children: [
                              //       Text(
                              //         "Selling on Amazon Advice...",textAlign: TextAlign.center,
                              //         style: TextStyle(
                              //             fontSize: 18.sp,
                              //             color: AppColors.whiteColor,
                              //             fontWeight: FontWeight.bold,
                              //             fontFamily: FontFamily.extraBold),
                              //       ),
                              //
                              //       SizedBox(
                              //         height: 1.h,
                              //       ),
                              //       Text(
                              //         "Whenever you need it!",
                              //         style: TextStyle(
                              //             fontSize: 17.sp,
                              //             color: AppColors.whiteColor,
                              //             fontWeight: FontWeight.normal,
                              //             fontFamily: FontFamily.regular),
                              //       ),
                              //       SizedBox(
                              //         height: 3.h,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              SizedBox(
                                width: 47.w,
                                child: Column(
                                  children: [
                                    Text(
                                      "Selling on Amazon Advice...",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.extraBold),
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      "Whenever you need it!",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: FontFamily.regular),
                                    ),
                                    SizedBox(height: 3.h),
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
                            color: const Color(0xffE7E6E6),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  Imgs.amzImg1Photo,
                                  width: 40.w,
                                  height: 17.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              // SizedBox(
                              //   width: 53.w,
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Center(
                              //         child: Text(
                              //           'New to selling on Amazon?',
                              //           style: TextStyle(
                              //               fontSize: 17.sp,
                              //               color: AppColors.orangeColor,
                              //               fontWeight: FontWeight.bold,
                              //               fontFamily: FontFamily.bold),
                              //         ),
                              //       ),
                              //       Text(
                              //         'Our unique ‘Product Finder Pro’ services means that we’ll undertake your product research for you and help you to find the right products to sell on Amazon!',
                              //         textAlign: TextAlign.center,
                              //         style: TextStyle(
                              //             fontSize: 15.sp,
                              //             color: AppColors.blackColor,
                              //             fontWeight: FontWeight.normal,
                              //             fontFamily: FontFamily.regular),
                              //       ),
                              //     ],
                              //   ),
                              // )
                              SizedBox(
                                width: 53.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        'New to selling on Amazon?',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: AppColors.orangeColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    const AutoSizeText(
                                      'Our unique ‘Product Finder Pro’ services means that we’ll undertake your product research for you and help you to find the right products to sell on Amazon!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: FontFamily.regular,
                                      ),
                                      maxLines: 4,
                                      // paragraph multi-line રહી શકે
                                      minFontSize: 15,
                                      overflow: TextOverflow.ellipsis,
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
                          decoration: BoxDecoration(
                            color: const Color(0xffE7E6E6),
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
                              //           'Pro-Active Amazon Support: We will pro-actively contact you!',
                              //           style: TextStyle(
                              //               fontSize: 14.sp,
                              //               color: AppColors.orangeColor,
                              //               fontWeight: FontWeight.bold,
                              //               fontFamily: FontFamily.bold),
                              //         ),
                              //       ),
                              //       Text(
                              //         'We don’t just sit around waiting for you to get in touch, we will monitor/challenge you and review your Amazon results and actions!',
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
                                    const Center(
                                      child: AutoSizeText(
                                        'Pro-Active Amazon Support: We will pro-actively contact you!',
                                        style: TextStyle(
                                          // fontSize: 14.sp,
                                          color: AppColors.orangeColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.bold,
                                        ),
                                        maxLines: 2,
                                        // heading લાંબી હોય તો 2 line સુધી allow
                                        minFontSize: 12,
                                        // નાની screen પર shrink
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    AutoSizeText(
                                      'We don’t just sit around waiting for you to get in touch, we will monitor/challenge you and review your Amazon results and actions!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: FontFamily.regular,
                                      ),
                                      maxLines: 4,
                                      // paragraph માટે multi-line allow
                                      minFontSize: 10,
                                      overflow: TextOverflow.ellipsis,
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
                          width: 96.w,
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffE7E6E6),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  Imgs.amzClientPhoto,
                                  width: 35.w,
                                  height: 35.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              // SizedBox(
                              //   width: 58.w,
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Center(
                              //         child: Text(
                              //           'We teach the Ultimate Selling System',
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //               fontSize: 18.sp,
                              //               color: AppColors.orangeColor,
                              //               fontWeight: FontWeight.bold,
                              //               fontFamily: FontFamily.bold),
                              //         ),
                              //       ),
                              //       Text(
                              //         'The Selling System used and created by our Founder, Alex Shelton. The Ultimate Selling System has been designed to teach anyone to build a Successful Business on Amazon.',
                              //         textAlign: TextAlign.center,
                              //         style: TextStyle(
                              //             fontSize: 15.sp,
                              //             color: AppColors.blackColor,
                              //             fontWeight: FontWeight.normal,
                              //             fontFamily: FontFamily.regular),
                              //       ),
                              //     ],
                              //   ),
                              // )
                              SizedBox(
                                width: 58.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Center(
                                      child: AutoSizeText(
                                        'We teach the Ultimate Selling System',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColors.orangeColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.bold,
                                        ),
                                        maxLines: 2,
                                        minFontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    const AutoSizeText(
                                      'The Selling System used and created by our Founder, Alex Shelton. The Ultimate Selling System has been designed to teach anyone to build a Successful Business on Amazon.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: FontFamily.regular,
                                      ),
                                      maxLines: 5,
                                      minFontSize: 14,
                                      overflow: TextOverflow.ellipsis,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.2.h, horizontal: 2.w),
                              decoration: BoxDecoration(
                                color: const Color(0xffE7E6E6),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: SizedBox(
                                width: 50.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Monthly 1-2-1 Amazon Consultancy Sessions with Alex Shelton (1 hour)',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: AppColors.orangeColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                                Icons.check_circle_outline,
                                                color: Colors.purple,
                                                size: 20),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                'Work directly with our Founder &\nLeading UK Amazon Consultant',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily:
                                                      FontFamily.regular,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                                Icons.check_circle_outline,
                                                color: Colors.purple,
                                                size: 20),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                'Online or at our Advice Centre\nin Sheffield',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily:
                                                      FontFamily.regular,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                                Icons.check_circle_outline,
                                                color: Colors.purple,
                                                size: 20),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                'Receive tailored advice to keep you on\ntrack with your Selling on Amazon Goals!',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily:
                                                      FontFamily.regular,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.asset(
                                Imgs.clientAMZPhoto,
                                width: 42.w,
                              ),
                            ),
                          ],
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
                      ],
                    ),
                    Positioned(
                        top: 17.h,
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
                              Imgs.amzserviceagency,
                              scale: 2.5,
                            ),
                          ),
                        )),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.21,
                      left: MediaQuery.of(context).size.width * 0.05,
                      child: InkWell(
                        onTap: () {
                          Get.to(WebviewScreen(
                            link:
                                "https://calendly.com/alexander-shelton/amz-advice-centre-demo",
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF00B4DB), Color(0xFF38EF7D)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius:
                                BorderRadius.circular(10), // round corners
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 3.w),
                            child: Text(
                              "Book a FREE Demo",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontFamily.extraBold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: Device.width,
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffe9e7e7),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const _WebViewDynamicHeight(
                  url: 'https://billing.zoho.eu',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WebViewDynamicHeight extends StatefulWidget {
  final String url;

  const _WebViewDynamicHeight({required this.url});

  @override
  State<_WebViewDynamicHeight> createState() => _WebViewDynamicHeightState();
}

class _WebViewDynamicHeightState extends State<_WebViewDynamicHeight> {
  InAppWebViewController? _controller;
  double _height = 300; // initial default height

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: InAppWebView(
        initialData: InAppWebViewInitialData(
          data: '''
          <!DOCTYPE html>
          <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
          </head>
          <body>
            <div id="zf-widget-root-id-atykeik6j"
                 data-pricing-table="true"
                 data-digest="2-5a63a60a66164619b1976bb783a4c7030976dcb73c38514b8de3b8d43c2e484926c3616e6a2782a18eb3357ff1546cd8d2e0a70dcd19f3011460627bd4e28617"
                 data-product_url="https://billing.zoho.eu">
            </div>
            <script src="https://js.zohostatic.com/books/zfwidgets/assets/js/zf-widget.js"></script>
          </body>
          </html>
          ''',
          baseUrl: WebUri(widget.url),
        ),
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        onLoadStop: (controller, url) async {
          _updateHeightPeriodically();
        },
      ),
    );
  }

  // Poll height for dynamic content
  void _updateHeightPeriodically() async {
    if (_controller == null) return;

    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      try {
        var result = await _controller!.evaluateJavascript(
            source: "document.body.scrollHeight.toString();");

        if (result != null) {
          double newHeight = double.tryParse(result) ?? 0;
          if (newHeight > 0 && newHeight != _height) {
            setState(() {
              _height = newHeight + 20; // small padding
            });
          }
        }
      } catch (e) {
        print("Error updating WebView height: $e");
      }
    }
  }
}
