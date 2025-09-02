import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/moreScreen/view/personalDetailsScreen.dart';
import 'package:zohosystem/utils/snackBars.dart';

import '../../../utils/colors.dart';
import '../../../utils/images.dart';

// ignore: must_be_immutable
class UpdateCardWebVew extends StatefulWidget {
  String link;

  UpdateCardWebVew({required this.link, super.key});

  @override
  State<UpdateCardWebVew> createState() => _UpdateCardWebVewState();
}

class _UpdateCardWebVewState extends State<UpdateCardWebVew> {
  InAppWebViewController? webViewController;
  bool _isLoading = true;

  final String successUrl =
      "https://api.theadvicecentre.ltd/card_details_updated_success";

  void _handleSuccess() {
    showCustomSuccessSnackbar(
      title: 'Success',
      message: 'Card details updated successfully',
    );

    Future.delayed(const Duration(seconds: 1), () {
      Get.back();
      Get.back();
      Get.to(const PersonalDetailsScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔹 Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            width: Device.width,
            decoration: const BoxDecoration(color: AppColors.orangeColor),
            child: Column(
              children: [
                SizedBox(height: 5.h),
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

          // 🔹 WebView
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.whiteColor,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: WebUri.uri(Uri.parse(widget.link)),
                    ),
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                      debugPrint("✅ WebView created");
                    },
                    onLoadStart: (controller, url) {
                      debugPrint("🚀 Started loading: $url");
                      setState(() {
                        _isLoading = true;
                      });
                    },
                    onProgressChanged: (controller, progress) {
                      debugPrint("📊 Loading progress: $progress%");
                    },
                    onLoadStop: (controller, url) async {
                      debugPrint("✅ Stopped loading: $url");
                      setState(() {
                        _isLoading = false;
                      });

                      if (url.toString().startsWith(successUrl)) {
                        debugPrint("🎉 Success URL detected in onLoadStop!");
                        _handleSuccess();
                      }
                    },
                    onUpdateVisitedHistory: (controller, url, androidIsReload) {
                      debugPrint("📌 History updated: $url");
                      if (url.toString().startsWith(successUrl)) {
                        debugPrint(
                            "🎯 Success URL detected in onUpdateVisitedHistory!");
                        _handleSuccess();
                      }
                    },
                    shouldOverrideUrlLoading:
                        (controller, navigationAction) async {
                      final url = navigationAction.request.url.toString();
                      debugPrint("🔗 Navigation override: $url");

                      if (url.startsWith(successUrl)) {
                        debugPrint(
                            "🎯 Success URL detected in shouldOverrideUrlLoading!");
                        _handleSuccess();
                        return NavigationActionPolicy.CANCEL;
                      }
                      return NavigationActionPolicy.ALLOW;
                    },
                  ),

                  // 🔹 Loader
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
          ),
        ],
      ),
    );
  }
}
