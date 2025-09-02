import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/snackBars.dart';
import '../../homeScreen/view/homeScreen.dart';

class VerifyPaymentScripationScreen extends StatefulWidget {
  final String? paymentLink;

  const VerifyPaymentScripationScreen({super.key, this.paymentLink});

  @override
  State<VerifyPaymentScripationScreen> createState() =>
      _VerifyPaymentScripationScreenState();
}

class _VerifyPaymentScripationScreenState
    extends State<VerifyPaymentScripationScreen> {
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
                              const Homescreen(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 250),
                            );

                            showCustomSuccessSnackbar(
                              title: 'Membership Confirmed',
                              message:
                                  'Thank you! Your membership is now active.',
                            );
                          }
                        });
                      }
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
        ),
      ),
    );
  }
}
