import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
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
  double _webViewHeight = 0; // initial height
  final double _maxWebViewHeight = 600;
  InAppWebViewController? _controller;
  bool _isLoading = true;
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
                          color: const Color(0xffE7E6E6),
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
// max height in pixels

    Container(
      width: Device.width,
      height: _webViewHeight > _maxWebViewHeight ? _maxWebViewHeight : _webViewHeight,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffe9e7e7),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            InAppWebView(
              initialData: InAppWebViewInitialData(
                data: '''
            <!DOCTYPE html>
            <html>
            <head>
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
            </head>
            <body>
              <div id="zf-widget-root-id-1sxhtn2pg"
                   data-pricing-table="true"
                   data-digest="..."
                   data-product_url="https://billing.zoho.eu">
              </div>
              <script src="https://js.zohostatic.com/books/zfwidgets/assets/js/zf-widget.js"></script>
            </body>
            </html>
            ''',
                baseUrl: WebUri('https://billing.zoho.eu'),
              ),
              onWebViewCreated: (controller) {
                _controller = controller;
              },
              onLoadStop: (controller, url) async {
                await Future.delayed(const Duration(milliseconds: 500));

                double? height = double.tryParse(
                  await controller.evaluateJavascript(
                    source: "document.body.scrollHeight.toString();",
                  ),
                );

                if (height != null && mounted) {
                  setState(() {
                    // dynamic height but capped
                    _webViewHeight = height > _maxWebViewHeight ? _maxWebViewHeight : height;
                    _isLoading = false;
                  });
                }
              },
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  verticalScrollBarEnabled: true,
                  useOnLoadResource: true,
                ),
              ),
            ),
            if (_isLoading)
              Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
              ),
          ],
        ),
      ),
    ),

    SizedBox(
              height: 7.h,
            ),
        
          ],
        ),
      ),
    );
  }
}
