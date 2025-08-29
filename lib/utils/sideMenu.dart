// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import 'package:zohosystem/ui/academy/view/academyScreen.dart';
// import 'package:zohosystem/ui/landingScreen/view/landingScreen.dart';
// import 'package:zohosystem/ui/profile/view/profileScreen.dart';
// import 'package:zohosystem/ui/referral/view/referralScreen.dart';
// import 'package:zohosystem/utils/colors.dart';
//
// import '../ui/homeScreen/view/homeScreen.dart';
// import '../ui/referral/view/referralScreen2.dart';
// import '../ui/referral/view/referralScreen3.dart';
// import 'fontFamily.dart';
//
// class SideMenu extends StatefulWidget {
//   const SideMenu({super.key});
//
//   @override
//   State<SideMenu> createState() => _SideMenuState();
// }
//
// class _SideMenuState extends State<SideMenu> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double widthDrawer = 80.w;
//     return Drawer(
//       elevation: 00,
//       backgroundColor: AppColors.alternativeBlueColor,
//       width: widthDrawer,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//       child: Container(
//         width: widthDrawer,
//         decoration: BoxDecoration(borderRadius: BorderRadius.zero),
//         height: MediaQuery.of(context).size.height,
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 3.h,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   'Welcome',
//                   style: TextStyle(
//                     fontFamily: FontFamily.extraBold,
//                     color: AppColors.whiteColor,
//                     fontSize: 20.sp,
//                   ),
//                   softWrap: true,
//                   overflow: TextOverflow.visible,
//                 ),
//                 Text(
//                   'Terian Lanister',
//                   style: TextStyle(
//                     fontFamily: FontFamily.bold,
//                     color: AppColors.whiteColor,
//                     fontSize: 18.sp,
//                   ),
//                   softWrap: true,
//                   overflow: TextOverflow.visible,
//                 ),
//               ],
//             ).paddingOnly(left: 2.w),
//             SizedBox(
//               height: 0.5.h,
//             ),
//             Divider(),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
//               child: Column(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Get.back();
//                       Get.to(() => Homescreen());
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               CupertinoIcons.home,
//                               color: Colors.white,
//                               size: 20.sp,
//                             ),
//                             SizedBox(
//                               width: 2.w,
//                             ),
//                             Text(
//                               'Home',
//                               style: TextStyle(
//                                 fontFamily: FontFamily.bold,
//                                 color: Colors.white,
//                                 letterSpacing: 1,
//                                 fontSize: 17.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Icon(
//                           CupertinoIcons.right_chevron,
//                           color: Colors.white,
//                           size: 20.sp,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1.9.h,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.back();
//                       Get.to(() => Profilescreen());
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               CupertinoIcons.person,
//                               color: Colors.white,
//                               size: 20.sp,
//                             ),
//                             SizedBox(
//                               width: 2.w,
//                             ),
//                             Text(
//                               'Profile',
//                               style: TextStyle(
//                                 fontFamily: FontFamily.bold,
//                                 color: Colors.white,
//                                 letterSpacing: 1,
//                                 fontSize: 17.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Icon(
//                           CupertinoIcons.right_chevron,
//                           color: Colors.white,
//                           size: 20.sp,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1.9.h,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.back();
//                       Get.to(() => Academyscreen());
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               CupertinoIcons.at_circle,
//                               color: Colors.white,
//                               size: 20.sp,
//                             ),
//                             SizedBox(
//                               width: 2.w,
//                             ),
//                             Text(
//                               'Academy Screen',
//                               style: TextStyle(
//                                 fontFamily: FontFamily.bold,
//                                 color: Colors.white,
//                                 letterSpacing: 1,
//                                 fontSize: 17.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Icon(
//                           CupertinoIcons.right_chevron,
//                           color: Colors.white,
//                           size: 20.sp,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1.9.h,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.back();
//                       Get.to(() => Referralscreen());
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               CupertinoIcons.money_dollar,
//                               color: Colors.white,
//                               size: 20.sp,
//                             ),
//                             SizedBox(
//                               width: 2.w,
//                             ),
//                             Text(
//                               'Referral Screen 1',
//                               style: TextStyle(
//                                 fontFamily: FontFamily.bold,
//                                 color: Colors.white,
//                                 letterSpacing: 1,
//                                 fontSize: 17.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Icon(
//                           CupertinoIcons.right_chevron,
//                           color: Colors.white,
//                           size: 20.sp,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1.9.h,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.back();
//                       Get.to(() => Referralscreen2());
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               CupertinoIcons.money_dollar,
//                               color: Colors.white,
//                               size: 20.sp,
//                             ),
//                             SizedBox(
//                               width: 2.w,
//                             ),
//                             Text(
//                               'Referral Screen 2',
//                               style: TextStyle(
//                                 fontFamily: FontFamily.bold,
//                                 color: Colors.white,
//                                 letterSpacing: 1,
//                                 fontSize: 17.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Icon(
//                           CupertinoIcons.right_chevron,
//                           color: Colors.white,
//                           size: 20.sp,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1.9.h,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.back();
//                       Get.to(() => Referralscreen3());
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               CupertinoIcons.money_dollar,
//                               color: Colors.white,
//                               size: 20.sp,
//                             ),
//                             SizedBox(
//                               width: 2.w,
//                             ),
//                             Text(
//                               'Referral Screen 3',
//                               style: TextStyle(
//                                 fontFamily: FontFamily.bold,
//                                 color: Colors.white,
//                                 letterSpacing: 1,
//                                 fontSize: 17.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Icon(
//                           CupertinoIcons.right_chevron,
//                           color: Colors.white,
//                           size: 20.sp,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 3.9.h,
//                   ),
//                   InkWell(
//                     onTap: () async {
//                       Get.offAll(LandingScreen());
//                     },
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.logout_rounded,
//                           color: Colors.red,
//                           size: 20.sp,
//                         ),
//                         SizedBox(
//                           width: 4.w,
//                         ),
//                         Text(
//                           'Log Out',
//                           style: TextStyle(
//                             fontFamily: "task",
//                             color: Colors.red,
//                             letterSpacing: 1,
//                             fontSize: 17.sp,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
