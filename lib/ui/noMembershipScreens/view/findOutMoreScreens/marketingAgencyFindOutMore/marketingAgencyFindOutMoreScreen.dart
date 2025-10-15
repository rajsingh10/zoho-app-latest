import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/fontFamily.dart';
import '../../../../../utils/images.dart';
import '../../webviewScreen.dart';

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
            InkWell(
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
                                color: const Color(0xff232f3f)),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      Imgs.amzAgencyManPhoto,
                                      scale: 1.3,
                                    ),
                                    // SizedBox(
                                    //   height: 1.h,
                                    // ),
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     gradient: const LinearGradient(
                                    //       colors: [
                                    //         Color(0xFF00B4DB),
                                    //         Color(0xFF38EF7D)
                                    //       ],
                                    //       begin: Alignment.centerLeft,
                                    //       end: Alignment.centerRight,
                                    //     ),
                                    //     borderRadius: BorderRadius.circular(
                                    //         10), // round corners
                                    //   ),
                                    //   child: Padding(
                                    //     padding: EdgeInsets.symmetric(
                                    //         vertical: 1.h, horizontal: 2.w),
                                    //     child: Text(
                                    //       "Book a FREE Demo",
                                    //       style: TextStyle(
                                    //           fontSize: 15.sp,
                                    //           color: AppColors.whiteColor,
                                    //           fontWeight: FontWeight.bold,
                                    //           fontFamily: FontFamily.extraBold),
                                    //     ),
                                    //   ),
                                    // )
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
                              color: const Color(0xffE7E6E6),
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
                                        '...with their Strategic and Digital Marketing Growth, helping our clients achieve serious sales (up to £350k a month!)',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Work with Leading UK Marketing Consultants',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.orangeColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.bold),
                                        ),
                                      ),
                                      Text(
                                        'As Marketing Consultants we can help with your Marketing Planning,  Website Development, SEO, Google Ads, Blogging, Video Production, Social Media Content, Social Media Ads and so much more!',
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
            <div id="zf-widget-root-id-iaale3ops"
                 data-pricing-table="true"
                 data-digest="2-5a63a60a6616461996bb25d73783bf08a78fcfda8d6b09487f81503cc2184f1ba2c3848b275ea4e38eb3357ff1546cd8d2e0a70dcd19f3011460627bd4e28617"
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
