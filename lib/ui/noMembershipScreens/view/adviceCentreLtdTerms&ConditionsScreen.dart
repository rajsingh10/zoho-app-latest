import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/utils/bottomBar.dart';

import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/orangeBottomBar.dart';

// ignore: must_be_immutable
class AdviceCentreLtdTermsConditionsScreen extends StatefulWidget {
  String? fromPage;

  AdviceCentreLtdTermsConditionsScreen({super.key, this.fromPage});

  @override
  State<AdviceCentreLtdTermsConditionsScreen> createState() =>
      _AdviceCentreLtdTermsConditionsScreenState();
}

class _AdviceCentreLtdTermsConditionsScreenState
    extends State<AdviceCentreLtdTermsConditionsScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            width: double.infinity,
            decoration: BoxDecoration(
                color: widget.fromPage == 'more'
                    ? AppColors.bgColor
                    : AppColors.orangeColor),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Image.asset(
                  Imgs.namedLogo,
                  scale: 5.5,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ),
          // WebView with Loader
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    "Advice Centre Ltd Terms & Conditions:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FontFamily.bold,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                      fontSize: 19.sp,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Expanded(
                    child: Stack(
                      children: [
                        InAppWebView(
                          initialUrlRequest: URLRequest(
                            url: WebUri.uri(Uri.parse(
                                'https://www.theadvicecentre.ltd/terms-and-conditions')),
                          ),
                          onWebViewCreated: (controller) {},
                          onLoadStart: (controller, url) {
                            setState(() {
                              _isLoading = true;
                            });
                          },
                          onLoadStop: (controller, url) {
                            setState(() {
                              _isLoading = false;
                            });
                          },
                        ),
                        if (_isLoading)
                          Container(
                            color: Colors.white,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.orangeColor,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 2.w, vertical: 2.h),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child:
            widget.fromPage == 'more' ? AppBottombar() : AppOrangeBottombar(),
      ),
    );
  }
}

/// IOS WORKING
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../../../utils/colors.dart';
// import '../../../utils/fontFamily.dart';
// import '../../../utils/images.dart';
// import '../../../utils/orangeBottomBar.dart';
//
// class adviceCentreLtdTermsConditionsScreen extends StatefulWidget {
//   const adviceCentreLtdTermsConditionsScreen({super.key});
//
//   @override
//   State<adviceCentreLtdTermsConditionsScreen> createState() =>
//       _adviceCentreLtdTermsConditionsScreenState();
// }
//
// class _adviceCentreLtdTermsConditionsScreenState
//     extends State<adviceCentreLtdTermsConditionsScreen> {
//   late final WebViewController _controller;
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageStarted: (url) {
//             setState(() {
//               _isLoading = true;
//             });
//           },
//           onPageFinished: (url) {
//             setState(() {
//               _isLoading = false;
//             });
//           },
//         ),
//       )
//       ..loadRequest(
//           Uri.parse('https://www.theadvicecentre.ltd/terms-and-conditions'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Header
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
//             width: Device.width,
//             decoration: BoxDecoration(color: AppColors.orangeColor),
//             child: Column(
//               children: [
//                 SizedBox(height: 5.h),
//                 Image.asset(
//                   Imgs.namedLogo,
//                   scale: 5.5,
//                   color: AppColors.whiteColor,
//                 ),
//               ],
//             ),
//           ),
//           // WebView with Loader
//           Expanded(
//             child: Container(
//               width: Device.width,
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   Text(
//                     "Advice Centre Ltd Terms & Conditions:",
//                     style: TextStyle(
//                       fontFamily: FontFamily.bold,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.blackColor,
//                       fontSize: 19.sp,
//                     ),
//                   ),
//                   SizedBox(height: 1.h),
//                   Expanded(
//                     child: Stack(
//                       children: [
//                         WebViewWidget(controller: _controller),
//                         if (_isLoading)
//                           Container(
//                             color: Colors.white,
//                             child: Center(
//                               child: CircularProgressIndicator(
//                                 color: AppColors.orangeColor,
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ).paddingSymmetric(horizontal: 2.w, vertical: 2.h),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: SizedBox(
//         height: 10.h,
//         child: AppOrangeBottombar(),
//       ),
//     );
//   }
// }
