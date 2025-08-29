import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/fontFamily.dart';
import '../../../../utils/images.dart';

Future<void> openInExternalBrowser(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

// ignore: camel_case_types, must_be_immutable
class policyWebviewScreen extends StatefulWidget {
  String link;
  String? fileName;

  policyWebviewScreen({required this.link, required this.fileName, super.key});

  @override
  State<policyWebviewScreen> createState() => _policyWebviewScreenState();
}

class _policyWebviewScreenState extends State<policyWebviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  InAppWebViewController? webViewController;
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
                    Text(
                      widget.fileName ?? '',
                      style: TextStyle(
                        fontFamily: FontFamily.bold,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                        fontSize: 19.sp,
                      ),
                    ),
                    Icon(null),
                  ],
                ),
              ],
            ),
          ),
          // inside your Expanded widget, replace with this:

          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.whiteColor,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: WebUri.uri(Uri.parse('${widget.link}')),
                    ),
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                    onLoadStop: (controller, url) async {
                      setState(() {
                        _isLoading = false;
                      });
                    },
                  ),
                  if (_isLoading)
                    Container(
                      color: Colors.white,
                      child: Center(
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

  bool isLoading = true;
}
