import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/Loader.dart';
import 'package:zohosystem/ui/bills&Payments/view/pdfviewWebView.dart';

import '../../../apiCalling/apiConfig.dart';
import '../../../apiCalling/buildErrorDialog.dart';
import '../../../apiCalling/checkInternetModule.dart';
import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/snackBars.dart';
import '../modal/allInvoiceModal.dart';
import '../modal/viewPdfModal.dart';
import '../provider/billProvider.dart';

class BillsnPaymentsscreen extends StatefulWidget {
  const BillsnPaymentsscreen({super.key});

  @override
  State<BillsnPaymentsscreen> createState() => _BillsnPaymentsscreenState();
}

class _BillsnPaymentsscreenState extends State<BillsnPaymentsscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allinvoiceAPi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Loader()
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColors.alternativeBlueColor),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 2.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 1.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xffE9E7E7)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final result = await showMenu<String>(
                                            context: context,
                                            position: RelativeRect.fromLTRB(
                                                6.w, 25.h, 7.w, 5.w),
                                            // position of menu
                                            items: [
                                              PopupMenuItem<String>(
                                                value:
                                                    'Recent Tickets (Last 10)',
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Recent Tickets (Last 10)',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.bgColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              FontFamily.light,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontSize: 15.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              PopupMenuItem<String>(
                                                value: 'Last Month',
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Last Month',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.bgColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              FontFamily.light,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontSize: 15.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              PopupMenuItem<String>(
                                                value: 'Last 6 Months',
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Last 6 Months',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.bgColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              FontFamily.light,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontSize: 15.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              PopupMenuItem<String>(
                                                value: 'All Time',
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'All Time',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.bgColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              FontFamily.light,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontSize: 15.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                            elevation: 5,
                                          );

                                          if (result != null) {
                                            print('Selected: $result');
                                          }
                                        },
                                        child: Icon(
                                          Icons.filter_alt,
                                          color: const Color(0xff545454),
                                          size: 25.sp,
                                        ),
                                      ),
                                      Image.asset(
                                        Imgs.namedLogo,
                                        scale: 4.5,
                                      ),
                                      const Icon(null),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const Divider(
                                    thickness: 0.5,
                                    color: AppColors.blackColor,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  allinvoice?.invoices?.length == 0
                                      ? Container(
                                          child: Text(
                                            "No Invoice Available",
                                            style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: FontFamily.regular,
                                                fontSize: 15.sp),
                                          ),
                                        )
                                      : Column(
                                          children: [
                                            for (int i = (allinvoice?.invoices
                                                            ?.length ??
                                                        0) -
                                                    1;
                                                i >= 0;
                                                i--) ...[
                                              InkWell(
                                                onTap: () {
                                                  pdfviewapi(
                                                      allinvoice?.invoices?[i]
                                                              .invoiceId ??
                                                          "",
                                                      allinvoice?.invoices?[i]
                                                              .number ??
                                                          "");
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      allinvoice?.invoices?[i]
                                                              .number ??
                                                          "",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .blackColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: FontFamily
                                                              .regular,
                                                          fontSize: 15.sp),
                                                    ),
                                                    // InkWell(
                                                    //   onTap: () {
                                                    //     downloadFile(
                                                    //       allinvoice?.invoices?[i]
                                                    //               .number ??
                                                    //           "",
                                                    //       context,
                                                    //       (allinvoice
                                                    //                   ?.invoices?[
                                                    //                       i]
                                                    //                   .number ??
                                                    //               "")
                                                    //           .split('/')
                                                    //           .last
                                                    //           .split('.')
                                                    //           .first,
                                                    //       (allinvoice
                                                    //                   ?.invoices?[
                                                    //                       i]
                                                    //                   .number ??
                                                    //               "")
                                                    //           .split('/')
                                                    //           .last
                                                    //           .split('.')
                                                    //           .last,
                                                    //     );
                                                    //   },
                                                    //   child: Container(
                                                    //       width: 7.w,
                                                    //       height: 7.w,
                                                    //       decoration: BoxDecoration(
                                                    //           borderRadius:
                                                    //               BorderRadius
                                                    //                   .circular(
                                                    //                       90),
                                                    //           color: Colors
                                                    //               .grey.shade400),
                                                    //       alignment:
                                                    //           Alignment.center,
                                                    //       child: Icon(
                                                    //         Icons.download,
                                                    //         color: AppColors
                                                    //             .blackColor,
                                                    //       )),
                                                    // )
                                                  ],
                                                ).paddingSymmetric(
                                                    vertical: 1.h,
                                                    horizontal: 4.w),
                                              ),
                                              const Divider(
                                                thickness: 0.5,
                                                color: AppColors.blackColor,
                                              ),
                                            ],
                                          ],
                                        ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  // allinvoice?.invoices?.length==0?Container():Text(
                                  //   'Load More...',
                                  //   style: TextStyle(
                                  //       color: AppColors.blackColor,
                                  //       fontWeight: FontWeight.bold,
                                  //       fontFamily: FontFamily.regular,
                                  //       fontSize: 15.sp),
                                  // ),
                                  // SizedBox(
                                  //   height: 1.h,
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

  bool isLoading = true;

  allinvoiceAPi() {
    checkInternet().then((internet) async {
      if (internet) {
        billProvider().invoiceapi().then((response) async {
          allinvoice = allInvoiceModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            setState(() {
              isLoading = false;
            });
            // showCustomSuccessSnackbar(
            //     title: 'Invoice', message: allinvoice?.message ?? "");
          } else if (response.statusCode == 422) {
            setState(() {
              isLoading = false;
            });
          } else {
            // showCustomErrorSnackbar(
            //   title: 'Login Error',
            //   message: 'Internal Server Error',
            // );
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, straceTrace) {
          showCustomErrorSnackbar(
            title: 'Invoice Error',
            message: error.toString(),
          );
          log("error=====>>>>${error.toString()}  $straceTrace");
          setState(() {
            isLoading = false;
          });
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  pdfviewapi(String id, name) {
    checkInternet().then((internet) async {
      if (internet) {
        billProvider().pdfviewapi(id).then((response) async {
          pdfview = PdfViewModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            setState(() {
              isLoading = false;
            });

            Get.to(PdfViewWeb(
              link: pdfview?.invoice?.invoiceUrl ?? "",
              fileName: name,
            ));
          } else if (response.statusCode == 422) {
            setState(() {
              isLoading = false;
            });
          } else {
            // showCustomErrorSnackbar(
            //   title: 'Login Error',
            //   message: 'Internal Server Error',
            // );
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, straceTrace) {
          showCustomErrorSnackbar(
            title: 'Invoice Error',
            message: error.toString(),
          );
          log("error=====>>>>${error.toString()}  $straceTrace");
          setState(() {
            isLoading = false;
          });
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
