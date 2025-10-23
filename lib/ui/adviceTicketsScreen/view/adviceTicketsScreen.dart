import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/adviceTicketsScreen/view/createTicketScreen.dart';
import 'package:zohosystem/ui/adviceTicketsScreen/view/ticketDetailsScreen.dart';

import '../../../apiCalling/Loader.dart';
import '../../../apiCalling/apiConfig.dart';
import '../../../apiCalling/buildErrorDialog.dart';
import '../../../apiCalling/checkInternetModule.dart';
import '../../../apiCalling/saveUserToken.dart';
import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/snackBars.dart';
import '../../authentications/login/modal/authTokenModal.dart';
import '../../authentications/login/provider/loginProvider.dart';
import '../../homeScreen/modal/allTicketModal.dart';
import '../../homeScreen/provider/homeProvider.dart';
import '../../manageMembershipScreen/view/membershipPageScreen.dart';

class adviceTicketsScreen extends StatefulWidget {
  const adviceTicketsScreen({super.key});

  @override
  State<adviceTicketsScreen> createState() => _adviceTicketsScreenState();
}

class _adviceTicketsScreenState extends State<adviceTicketsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    checkTimeStatus();
    allTicketApi();
  }

  void checkTimeStatus() async {
    bool timeExceeded = await getTimeExceededStatus();
    setState(() {
      isTimeExceed = timeExceeded;
      // isLoading = false;
    });
  }

  bool isTimeExceed = false;

  Future<bool> getTimeExceededStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isTimeExceeded") ?? false;
  }

  List<Data> filteredTicketList = [];
  String searchQuery = '';

  void filterTickets(String filterOption) {
    DateTime now = DateTime.now();
    DateTime startDate;
    List<Data> baseList = [];

    switch (filterOption) {
      case 'Recent Tickets (Last 10)':
        baseList = allTicket?.data?.take(10).toList() ?? [];
        break;

      case 'Last Month':
        startDate = DateTime(now.year, now.month - 1, now.day);
        baseList = allTicket?.data
                ?.where((ticket) =>
                    DateTime.tryParse(ticket.createdTime ?? '')
                        ?.isAfter(startDate) ??
                    false)
                .toList() ??
            [];
        break;

      case 'Last 6 Months':
        startDate = DateTime(now.year, now.month - 6, now.day);
        baseList = allTicket?.data
                ?.where((ticket) =>
                    DateTime.tryParse(ticket.createdTime ?? '')
                        ?.isAfter(startDate) ??
                    false)
                .toList() ??
            [];
        break;

      case 'All Time':
      default:
        baseList = allTicket?.data ?? [];
    }

    // Apply search on top of filter
    if (searchQuery.isNotEmpty) {
      baseList = baseList.where((ticket) {
        final subject = ticket.subject?.toLowerCase() ?? '';
        final ticketNo = ticket.ticketNumber?.toLowerCase() ?? '';
        return subject.contains(searchQuery.toLowerCase()) ||
            ticketNo.contains(searchQuery.toLowerCase());
      }).toList();
    }

    setState(() {
      filteredTicketList = baseList;
    });
  }

  final TextEditingController _searchController = TextEditingController();

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
                              // Get.back();
                            },
                            child: const Icon(null),
                          ),
                          Text(
                            "Advice Tickets",
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
                                  horizontal: 4.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColors.bgColor,
                              ),
                              child: Text(
                                'Welcome to your Advice Centre Tickets page.\n'
                                'This is your \'all in one\' place to manage your advice tickets with us.\n'
                                '- To create a new ticket, click "Create a New Ticket" below. We\'ll send you an acknowledgement email with your ticket details.\n'
                                '- To reply to an existing ticket or add more information, simply reply to the original email (please make sure to use the correct ticket number).\n'
                                '- If you need any help, our team is available via the live chat.',
                                style: TextStyle(
                                  fontSize: 14.5.sp,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'Our offices are open Mon–Fri (9am–5pm UK time) Excluding UK Bank Holidays. Our Experts aim to respond to all queries within 24hrs but in some cases this can take longer depending on workload and the complexity of the issue you’re facing. Speak soon!',
                              style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontFamily.bold,
                                  fontSize: 15.sp),
                            ),
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
                                                enabled: false,
                                                // Prevent closing on tap
                                                child: StatefulBuilder(
                                                  builder:
                                                      (context, setStatePopup) {
                                                    return SizedBox(
                                                      width: 60.w,
                                                      child: TextField(
                                                        controller:
                                                            _searchController,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: "Search",
                                                          isDense: true,
                                                          suffix: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              // Search icon
                                                              InkWell(
                                                                onTap: () {
                                                                  searchQuery =
                                                                      _searchController
                                                                          .text
                                                                          .trim();
                                                                  filterTickets(
                                                                      ''); // or retain previous filter
                                                                  Get.back(); // close popup
                                                                },
                                                                child: const Icon(
                                                                    Icons
                                                                        .search,
                                                                    size: 20),
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              // Clear icon
                                                              InkWell(
                                                                onTap: () {
                                                                  setStatePopup(
                                                                      () {
                                                                    _searchController
                                                                        .clear();
                                                                    searchQuery =
                                                                        '';
                                                                  });
                                                                  filterTickets(
                                                                      'All Time');
                                                                  Get.back(); // close popup
                                                                },
                                                                child: const Icon(
                                                                    Icons.close,
                                                                    size: 20),
                                                              ),
                                                            ],
                                                          ),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
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

                                          if (result != null &&
                                              result.isNotEmpty) {
                                            filterTickets(result);
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
                                  Container(
                                    width: Device.width,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 4.w),
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: (filteredTicketList.isEmpty)
                                        ? Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: Text(
                                              'No tickets available',
                                              style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              for (int i = 0;
                                                  i <
                                                      (filteredTicketList
                                                          .length);
                                                  i++) ...[
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(TicketDetailsScreen(
                                                      tickitid:
                                                          filteredTicketList[i]
                                                              .id,
                                                    ));
                                                    print(
                                                        'Id : ${filteredTicketList[i].id}');
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.all(
                                                            9.sp),
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              width: 6.sp,
                                                              color: AppColors
                                                                  .bgColor),
                                                        ),
                                                        child: const Icon(
                                                          CupertinoIcons
                                                              .doc_richtext,
                                                          color:
                                                              AppColors.bgColor,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 60.w,
                                                            child: Text(
                                                              filteredTicketList[
                                                                          i]
                                                                      .subject ??
                                                                  "N/A",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .bgColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .light,
                                                                  fontSize:
                                                                      15.sp),
                                                            ),
                                                          ),
                                                          Text(
                                                            '#${filteredTicketList[i].ticketNumber ?? "N/A"}',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .border,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .bold,
                                                                fontSize:
                                                                    15.sp),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ).paddingSymmetric(
                                                      vertical: 1.h),
                                                ),
                                              ],
                                            ],
                                          ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            InkWell(
                              onTap: () {
                                if (isTimeExceed) {
                                  showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: Text(
                                          'Monthly Advice Time Exceeded',
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                        content: Text(
                                          'Please upgrade your membership to create a new ticket.',
                                          style: TextStyle(fontSize: 17.sp),
                                        ),
                                        actions: [
                                          CupertinoDialogAction(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Get.back(); // Dismiss dialog
                                            },
                                          ),
                                          CupertinoDialogAction(
                                            isDestructiveAction: true,
                                            onPressed: () {
                                              Get.back();
                                              Get.to(
                                                  const membershipPageScreen());
                                            },
                                            child: const Text('Upgrade'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  Get.to(const CreateTicketScreen());
                                }
                              },
                              child: Container(
                                height: 5.5.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.bgColor,
                                    borderRadius: BorderRadius.circular(3.w)),
                                child: Text(
                                  'Create a New Ticket',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: FontFamily.bold),
                                ),
                              ),
                            ).marginSymmetric(horizontal: 2.w),
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
        child: AppBottombar(
          selected: 4,
        ),
      ),
    );
  }

  void showChatBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          maxChildSize: 0.95,
          minChildSize: 0.5,
          builder: (context, scrollController) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    width: Device.width,
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 3.w),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: AppColors.orangeColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(null),
                        Text(
                          "Chat With Support",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.bold),
                        ),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child:
                                const Icon(Icons.close, color: Colors.white)),
                      ],
                    ),
                  ),
                  // Chat Area
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(12),
                      children: [
                        _chatBubble(
                          isUser: true,
                          name: "Anna Example",
                          time: "27 Aug, 7:16 PM GMT",
                          message: "Would you be able to help with this?",
                        ),
                        _chatBubble(
                          isUser: false,
                          name: "Alex Shelton",
                          time: "27 Aug, 7:16 PM GMT",
                          message:
                              "Hey Anna,\n\nThanks for reaching out to us.\nWe will help you with your \nquery as soon as possible\n\nKind Regards,\nThe Advice Centre Ltd",
                        ),
                        _chatBubble(
                          isUser: true,
                          name: "Anna Example",
                          time: "27 Aug, 7:16 PM GMT",
                          message: "Thanks Alex. Really appreciate it!",
                        ),
                      ],
                    ),
                  ),
                  // Input Field
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                            color: const Color(0xffececec),
                            borderRadius:
                                BorderRadius.circular(25), // Rounded border
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Type here to chat...",
                              border: InputBorder.none, // Remove underline
                            ),
                          ),
                        )),
                        const Icon(Icons.send, color: Colors.grey),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    width: Device.width,
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                    decoration: const BoxDecoration(
                      color: AppColors.orangeColor,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(null),
                        Icon(null),
                        Icon(null),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _chatBubble({
    required bool isUser,
    required String name,
    required String time,
    required String message,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.bold),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.gray,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 2.w,
                ),
                Container(
                  width: 58.w,
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: isUser ? Colors.grey[200] : const Color(0xFFEAF4FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.normal,
                        fontFamily: FontFamily.regular),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool isLoading = false;

  allTicketApi() {
    checkInternet().then((internet) async {
      if (internet) {
        final prefs = await SharedPreferences.getInstance();
        final savedId = prefs.getString('selectedSubscriptionId');
        HomeProvider().Viewalltikit(savedId).then((response) async {
          allTicket = MyTickitModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 || response.statusCode == 204) {
            setState(() {
              filterTickets('All Time');
              isLoading = false;
            });
            print("==========>>>>>>>>${filteredTicketList.length}");
          } else if (response.statusCode == 422) {
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, straceTrace) {
          final errorMessage = error.toString();

          if (errorMessage
              .contains("You are not authorized to perform this operation")) {
            log("User not authorized, retaking token...");
            fetchAuthtokenApi();

            return;
          }
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  fetchAuthtokenApi() {
    SaveAuthtokenData.removeAuthToken();
    checkInternet().then((internet) async {
      if (internet) {
        LoginProvider().refreshTokenApi().then((response) async {
          authtoken = AuthtokenModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            setState(() {
              // isLoading = false;
            });
            SaveAuthtokenData.saveAuthData(authtoken!);
            allTicketApi();
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Token Error", message: sendOtp?.message ?? '');
            setState(() {
              isLoading = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Token Error',
              message: 'Internal Server Error',
            );
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Token Error',
            message: 'Internal Server Error',
          );
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
