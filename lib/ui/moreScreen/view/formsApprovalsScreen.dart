import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../noMembershipScreens/view/webviewScreen.dart';

class FormsApprovalScreen extends StatefulWidget {
  const FormsApprovalScreen({super.key});

  @override
  State<FormsApprovalScreen> createState() => _FormsApprovalScreenState();
}

class _FormsApprovalScreenState extends State<FormsApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            width: Device.width,
            decoration: BoxDecoration(color: AppColors.alternativeBlueColor),
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
                    Icon(null)
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: Device.width,
              color: AppColors.whiteColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: 80.w,
                      child: Text(
                        'Membership Approval Forms: Grant us with Approvals to Access your Logins/Platforms.',
                        style: TextStyle(
                          fontFamily: FontFamily.regular,
                          fontWeight: FontWeight.bold,
                          color: AppColors.bgColor,
                          fontSize: 16.5.sp,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => Get.to(
                          WebviewScreen(
                            link:
                                "https://forms.zohopublic.eu/theadvicecentreltd/form/AMZAdviceCentreMyBusinessReview/formperma/gruPBV4fk0IlNE1ZrNLVhzo44XUokgscikJfzdX---k",
                          ),
                        ),
                        child: SizedBox(
                          width: 80.w,
                          child: Text(
                            textAlign: TextAlign.center,
                            'AMZ Advice Center : \nMy Business Review',
                            style: TextStyle(
                              fontFamily: FontFamily.regular,
                              fontWeight: FontWeight.normal,
                              color: AppColors.blackColor,
                              fontSize: 16.sp,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => Get.to(
                          WebviewScreen(
                            link:
                                "https://forms.zohopublic.eu/theadvicecentreltd/form/AMZAgencyMyBusinessReview/formperma/2mbKEKw73Ki9nYsQ7bf6jWwUeTHjGTquCIrKpAX1RNo",
                          ),
                        ),
                        child: SizedBox(
                          width: 80.w,
                          child: Text(
                            textAlign: TextAlign.center,
                            'AMZAgency : \nMy Business Review',
                            style: TextStyle(
                              fontFamily: FontFamily.regular,
                              fontWeight: FontWeight.normal,
                              color: AppColors.blackColor,
                              fontSize: 16.sp,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => Get.to(
                          WebviewScreen(
                            link:
                                "https://forms.zohopublic.eu/theadvicecentreltd/form/MarketingAdviceCentreMyBusinessReview/formperma/HB4KjQxzrTdYDHTU50dSj8VZBfswAt0PouUtQ2tbbZU",
                          ),
                        ),
                        child: SizedBox(
                          width: 80.w,
                          child: Text(
                            textAlign: TextAlign.center,
                            'Marketing Advice Centre : \nMy Business Review',
                            style: TextStyle(
                              fontFamily: FontFamily.regular,
                              fontWeight: FontWeight.normal,
                              color: AppColors.blackColor,
                              fontSize: 16.sp,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => Get.to(
                          WebviewScreen(
                            link:
                                "https://forms.zohopublic.eu/theadvicecentreltd/form/TheMarketingAgencyMyBusinessReview/formperma/Id8w2eAtbb0ngvXecxWOzvv6VjFfUh0uR77EfyBqsRo",
                          ),
                        ),
                        child: SizedBox(
                          width: 80.w,
                          child: Text(
                            textAlign: TextAlign.center,
                            'The Marketing Agency : \nMy Business Review',
                            style: TextStyle(
                              fontFamily: FontFamily.regular,
                              fontWeight: FontWeight.normal,
                              color: AppColors.blackColor,
                              fontSize: 16.sp,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => Get.to(
                          WebviewScreen(
                            link:
                                "https://forms.theadvicecentre.ltd/theadvicecentreltd/form/AMZAdviceCentreApprovalforSellerCentralAccess/formperma/XAd0545EYgBA7KzThFJk7SbVC58v4xpNMQAeOXHcIPU",
                          ),
                        ),
                        child: SizedBox(
                          width: 80.w,
                          child: Text(
                            textAlign: TextAlign.center,
                            'AMZ Advice Centre: Approval For Seller Central Access',
                            style: TextStyle(
                              fontFamily: FontFamily.regular,
                              fontWeight: FontWeight.normal,
                              color: AppColors.blackColor,
                              fontSize: 16.sp,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => Get.to(
                          WebviewScreen(
                            link:
                                "https://forms.zohopublic.eu/theadvicecentreltd/form/AMZAdviceCentreApprovalforRequestedPlatformUpdates/formperma/hU5iUEhEQeagUMRY7qvriQy0MUiQNOvAis9iXWoLKtY",
                          ),
                        ),
                        child: SizedBox(
                          width: 80.w,
                          child: Text(
                            textAlign: TextAlign.center,
                            'AMZ Advice Centre: Approval For Seller Central Updates & Changes',
                            style: TextStyle(
                              fontFamily: FontFamily.regular,
                              fontWeight: FontWeight.normal,
                              color: AppColors.blackColor,
                              fontSize: 16.sp,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => Get.to(
                          WebviewScreen(
                            link:
                                "https://forms.zohopublic.eu/theadvicecentreltd/form/MarketingAdviceCentreApprovalforRequestedPlatformU/formperma/Ag4kcpTa6N89qkMem_-PHe3UvFoSoK01-Zlcbv1g0-c",
                          ),
                        ),
                        child: SizedBox(
                          width: 80.w,
                          child: Text(
                            textAlign: TextAlign.center,
                            'Marketing Advice Centre: Approval For Digital Platform Updates & Changes',
                            style: TextStyle(
                              fontFamily: FontFamily.regular,
                              fontWeight: FontWeight.normal,
                              color: AppColors.blackColor,
                              fontSize: 16.sp,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
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
}
