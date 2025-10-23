import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
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
    <div id="zf-widget-root-id-b8jz1bj3t"
         data-pricing-table="true"
         data-digest="2-5a63a60a6616461940505ce8b586831d1753f6cf23c9bba5c20ab52d618040c313892a2705ada1bf8eb3357ff1546cd8d2e0a70dcd19f3011460627bd4e28617"
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
