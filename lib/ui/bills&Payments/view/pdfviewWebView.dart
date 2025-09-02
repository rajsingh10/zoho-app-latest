import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/utils/fontFamily.dart';

import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/downloader.dart';
import '../../../utils/images.dart'; // Replace with your downloader file import

class PdfViewWeb extends StatefulWidget {
  final String link;
  final String? fileName;

  const PdfViewWeb({required this.link, this.fileName, super.key});

  @override
  State<PdfViewWeb> createState() => _PdfViewWebState();
}

class _PdfViewWebState extends State<PdfViewWeb> {
  InAppWebViewController? webViewController;
  bool _isLoading = true;
  String? _cookies;

  @override
  void initState() {
    super.initState();
    _getCookies();
  }

  Future<void> _getCookies() async {
    final cookieManager = CookieManager.instance();
    List<Cookie> cookies = await cookieManager.getCookies(
      url: WebUri(widget.link),
    );

    if (cookies.isNotEmpty) {
      setState(() {
        _cookies = cookies.map((c) => '${c.name}=${c.value}').join('; ');
      });
      log("🍪 Cookies fetched: $_cookies");
    } else {
      log("No cookies found.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            width: double.infinity,
            decoration:
                const BoxDecoration(color: AppColors.alternativeBlueColor),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Image.asset(Imgs.backIcon, scale: 30),
                    ),
                    Text(
                      "Bills & Payments",
                      style: TextStyle(
                        fontFamily: FontFamily.bold,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                        fontSize: 19.sp,
                      ),
                    ),
                    const Icon(null),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.whiteColor,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: WebUri(widget.link),
                    ),
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                    onLoadStop: (controller, url) {
                      setState(() => _isLoading = false);
                    },
                    onDownloadStartRequest: (controller, request) async {
                      String downloadUrl = request.url.toString();
                      log("Download requested: $downloadUrl");

                      // Extract file name and extension
                      String filename = widget.fileName ?? 'invoice';
                      String extension = 'pdf';
                      Uri uri = Uri.parse(downloadUrl);
                      String? lastSegment = uri.pathSegments.isNotEmpty
                          ? uri.pathSegments.last
                          : null;
                      if (lastSegment != null && lastSegment.contains('.')) {
                        filename = lastSegment.split('.').first;
                        extension = lastSegment.split('.').last;
                      }

                      // Pass cookies + url to downloader
                      await downloadFileWithCookies(
                          downloadUrl, context, filename, extension, _cookies);
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
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(height: 10.h, child: AppBottombar()),
    );
  }
}
