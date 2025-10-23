import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
              child: Column(
                children: [
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
                      color: const Color(0xffE7E6E6),
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
                ],
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
    <div id="zf-widget-root-id-cpptacpvp"
         data-pricing-table="true"
         data-digest="2-5a63a60a66164619091c4e83157b1fb96a68358c346319c1c20ab52d618040c313892a2705ada1bf8eb3357ff1546cd8d2e0a70dcd19f3011460627bd4e28617"
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
