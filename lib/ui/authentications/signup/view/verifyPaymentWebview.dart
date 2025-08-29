import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:zohosystem/ui/landingScreen/view/landingScreen.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/snackBars.dart';

class VerifyPaymentScreen extends StatefulWidget {
  final String? paymentLink;

  VerifyPaymentScreen({super.key, this.paymentLink});

  @override
  State<VerifyPaymentScreen> createState() => _VerifyPaymentScreenState();
}

class _VerifyPaymentScreenState extends State<VerifyPaymentScreen> {
  InAppWebViewController? webViewController;
  bool _isLoading = true;
  bool _redirected = false; // Prevent multiple redirections

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: WebUri.uri(Uri.parse(widget.paymentLink ?? '')),
                    ),
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                    onLoadStart: (controller, url) {
                      setState(() {
                        _isLoading = true;
                      });
                    },
                    onLoadStop: (controller, url) {
                      setState(() {
                        _isLoading = false;
                      });

                      if (url.toString().contains("thankyou") && !_redirected) {
                        _redirected = true;
                        Future.delayed(const Duration(seconds: 3), () {
                          if (mounted) {
                            Get.offAll(
                              LandingScreen(),
                              transition: Transition.rightToLeft,
                              duration: Duration(milliseconds: 250),
                            );

                            showCustomSuccessSnackbar(
                                title: 'Registration',
                                message: "User Registered Successfully");
                          }
                        });
                      }
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
          ],
        ),
      ),
    );
  }
}
