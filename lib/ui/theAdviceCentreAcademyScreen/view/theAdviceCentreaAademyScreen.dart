import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/utils.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';

class TheAdviceCentreAcademyScreen extends StatefulWidget {
  const TheAdviceCentreAcademyScreen({super.key});

  @override
  State<TheAdviceCentreAcademyScreen> createState() =>
      _TheAdviceCentreAcademyScreenState();
}

class _TheAdviceCentreAcademyScreenState
    extends State<TheAdviceCentreAcademyScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.alternativeBlueColor),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Text(
                  "The Advice Centre Academy",
                  style: TextStyle(
                    fontFamily: FontFamily.bold,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                    fontSize: 19.sp,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.whiteColor,
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: WebUri.uri(Uri.parse(
                          'https://academy.theadvicecentre.ltd/#/login')),
                    ),
                    onWebViewCreated: (controller) {},
                    onLoadStop: (controller, url) {
                      if (mounted) {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                  ),
                  if (_isLoading)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: AppColors.whiteColor,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.alternativeBlueColor,
                        ),
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
        child: AppBottombar(),
      ),
    );
  }
}

/// IOS WORKING
// import 'package:flutter/material.dart';
// import 'package:get/utils.dart';
// import 'package:sizer/sizer.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../../../utils/bottomBar.dart';
// import '../../../utils/colors.dart';
// import '../../../utils/fontFamily.dart';
//
// class theAdviceCentreaAademyScreen extends StatefulWidget {
//   const theAdviceCentreaAademyScreen({super.key});
//
//   @override
//   State<theAdviceCentreaAademyScreen> createState() =>
//       _theAdviceCentreaAademyScreenState();
// }
//
// class _theAdviceCentreaAademyScreenState
//     extends State<theAdviceCentreaAademyScreen> {
//   late final WebViewController _controller;
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageFinished: (url) {
//             if (mounted)
//               setState(() {
//                 _isLoading = false;
//               });
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse('https://academy.theadvicecentre.ltd/#/login'));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
//             width: double.infinity,
//             decoration: BoxDecoration(color: AppColors.alternativeBlueColor),
//             child: Column(
//               children: [
//                 SizedBox(height: 5.h),
//                 Text(
//                   "The Advice Centre Academy",
//                   style: TextStyle(
//                     fontFamily: FontFamily.bold,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.whiteColor,
//                     fontSize: 19.sp,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               color: AppColors.whiteColor,
//               child: Stack(
//                 children: [
//                   Container(
//                     width: Device.width,
//                     color: AppColors.whiteColor,
//                     child: WebViewWidget(controller: _controller),
//                   ),
//                   if (_isLoading)
//                     Container(
//                       width: Device.width,
//                       height: Device.height,
//                       color: AppColors.whiteColor,
//                       child: Center(
//                         child: CircularProgressIndicator(
//                           color: AppColors.alternativeBlueColor,
//                         ),
//                       ),
//                     ),
//                 ],
//               ).paddingSymmetric(horizontal: 2.w, vertical: 2.h),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: SizedBox(
//         height: 10.h,
//         child: AppBottombar(),
//       ),
//     );
//   }
//
// }
