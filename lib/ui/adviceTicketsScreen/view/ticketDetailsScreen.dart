import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/ui/adviceTicketsScreen/modal/replyTikitModal.dart';
import 'package:zohosystem/ui/adviceTicketsScreen/modal/ticketRepliesModal.dart';
import 'package:zohosystem/utils/snackBars.dart';

import '../../../apiCalling/Loader.dart';
import '../../../apiCalling/buildErrorDialog.dart';
import '../../../apiCalling/checkInternetModule.dart';
import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/textFields.dart';
import '../../homeScreen/modal/getTimeEntryModal.dart';
import '../../homeScreen/provider/homeProvider.dart';
import '../modal/ThreadModal.dart';
import '../modal/singleDepartmentModal.dart';
import '../modal/viewDetailsTikitModal.dart';
import '../provider/adviceProvider.dart';

// ignore: must_be_immutable
class TicketDetailsScreen extends StatefulWidget {
  var tickitid;

  TicketDetailsScreen({super.key, required this.tickitid});

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

final TextEditingController _bodyController = TextEditingController();

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    allDetailsTicketApi();
  }

  String? storedId;
  final List<SupportDepartment> departments = [
    SupportDepartment(
      name: 'AMZ Advice Centre',
      email: 'support@amzadvicecentre.com',
      subject: 'AMZ\tAdvice\tCentre\tSupport',
      whatsAppNumber: '+44-114-405-5024',
    ),
    SupportDepartment(
      name: 'AMZ Agency',
      email: 'support@amzagency.co.uk',
      subject: 'AMZAgency\tSupport',
    ),
    SupportDepartment(
      name: 'Marketing Advice Centre',
      email: 'support@marketingadvicecentre.co.uk',
      subject: 'Marketing\tAdvice\tCentre\tSupport',
      whatsAppNumber: '+44-114-405-5021',
    ),
    SupportDepartment(
      name: 'The Marketing Agency',
      email: 'support@the-marketingagency.co.uk',
      subject: 'The\tMarketing\tAgency\tSupport',
    ),
    SupportDepartment(
      name: 'The Advice Centre: Accounts',
      email: 'accounts@theadvicecentre.ltd',
      subject: 'Accounts\tSupport',
    ),
    SupportDepartment(
      name: 'The Advice Centre: Introducers',
      email: 'support@amzadvicecentre.com',
      subject: 'Introducers\tSupport',
    ),
    SupportDepartment(
      name: 'Just Ask Alex',
      email: 'support@amzadvicecentre.com',
      subject: 'Just\tAsk\tAlex\tSupport',
    ),
    SupportDepartment(
      name: 'AMZBuddy',
      email: 'support@amzbuddy.ai',
      subject: 'AMZBuddy\tSupport',
    ),
    SupportDepartment(
      name: 'The Advice Centre Ltd',
      email: 'support@amzbuddy.ai',
      subject: 'AMZBuddy\tSupport',
    ),
  ];
  String departmentEmail = '';
  bool isAdding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Loader()
          : Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
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
                                            onTap: () async {},
                                            child: const Icon(null),
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
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Subject
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Ticket Number :- ",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        "#${viewDetailsTikitModal?.ticketNumber}",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 1.h),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Subject :- ",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: viewDetailsTikitModal
                                                            ?.subject ??
                                                        "",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 1.h),

                                            // Description
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Description :- ",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: viewDetailsTikitModal
                                                            ?.description ??
                                                        "",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 1.h), // Time-Entry
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "Total Time Spent :- ",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: totalTimeString,
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 1.h),

                                            // Due Date
                                            if (viewDetailsTikitModal
                                                    ?.dueDate !=
                                                null)
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "DueDate :- ",
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .blackColor,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: DateFormat(
                                                              "dd MMM yyyy, hh:mm a")
                                                          .format(
                                                        DateTime.parse(
                                                                viewDetailsTikitModal
                                                                        ?.dueDate ??
                                                                    '')
                                                            .toLocal(),
                                                      ),
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 16.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            SizedBox(height: 1.h),

                                            // Layout
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Department :- ",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: viewDetailsTikitModal
                                                            ?.layoutDetails
                                                            ?.layoutName ??
                                                        "",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 1.h),

                                            // Status
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Ticket Status :- ",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: viewDetailsTikitModal
                                                            ?.status ??
                                                        "",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.5.h,
                                      ),
                                      // InkWell(
                                      //   onTap: () {
                                      //     final _formKey = GlobalKey<
                                      //         FormState>(); // Form key
                                      //     TextEditingController
                                      //         _bodyController =
                                      //         TextEditingController();
                                      //     showModalBottomSheet(
                                      //       context: context,
                                      //       isScrollControlled: true,
                                      //       shape: RoundedRectangleBorder(
                                      //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                      //       ),
                                      //       builder: (context) {
                                      //         return StatefulBuilder(
                                      //           builder: (BuildContext context, StateSetter setState) {
                                      //             return Padding(
                                      //               padding: EdgeInsets.only(
                                      //                 bottom: MediaQuery.of(context).viewInsets.bottom,
                                      //                 top: 2.h,
                                      //                 left: 2.w,
                                      //                 right: 2.w,
                                      //               ),
                                      //               child: Form(
                                      //                 key: _formKey,
                                      //                 child: Column(
                                      //                   mainAxisSize: MainAxisSize.min,
                                      //                   children: [
                                      //                     Text(
                                      //                       'Send Ticket Reply',
                                      //                       style: TextStyle(
                                      //                         fontSize: 18.sp,
                                      //                         fontWeight: FontWeight.bold,
                                      //                       ),
                                      //                     ),
                                      //                     SizedBox(height: 2.h),
                                      //                     AppTextField(
                                      //                       controller: _bodyController,
                                      //                       hintText: 'Enter Reply',
                                      //                       text: 'Reply body',
                                      //                       isTextavailable: true,
                                      //                       maxline: 5,
                                      //                       validator: (value) {
                                      //                         if (value == null || value.trim().isEmpty) {
                                      //                           return 'Reply Message is required';
                                      //                         }
                                      //                         return null;
                                      //                       },
                                      //                       textInputType: TextInputType.text,
                                      //                       suffix: IconButton(
                                      //                         icon: const Icon(Icons.attach_file, color: AppColors.bgColor),
                                      //                         onPressed: () async {
                                      //                           await _pickFiles();
                                      //                           setState(() {}); // <-- Refresh UI after picking file
                                      //                         },
                                      //                       ),
                                      //                     ),
                                      //                     SizedBox(height: 1.h),
                                      //                     if (_pickedFiles.isNotEmpty)
                                      //                       Column(
                                      //                         crossAxisAlignment: CrossAxisAlignment.start,
                                      //                         children: _pickedFiles.asMap().entries.map((entry) {
                                      //                           final index = entry.key;
                                      //                           final file = entry.value;
                                      //                           return Container(
                                      //                             margin: EdgeInsets.symmetric(vertical: 0.5.h),
                                      //                             padding: EdgeInsets.all(2.w),
                                      //                             decoration: BoxDecoration(
                                      //                               borderRadius: BorderRadius.circular(10),
                                      //                               border: Border.all(color: AppColors.bgColor),
                                      //                             ),
                                      //                             child: Row(
                                      //                               children: [
                                      //                                 if (file.extension == 'jpg' ||
                                      //                                     file.extension == 'jpeg' ||
                                      //                                     file.extension == 'png')
                                      //                                   Image.file(
                                      //                                     File(file.path!),
                                      //                                     width: 50,
                                      //                                     height: 50,
                                      //                                     fit: BoxFit.cover,
                                      //                                   )
                                      //                                 else if (file.extension == 'mp4' ||
                                      //                                     file.extension == 'mov' ||
                                      //                                     file.extension == 'avi')
                                      //                                   const Icon(Icons.videocam,
                                      //                                       color: AppColors.bgColor, size: 40)
                                      //                                 else
                                      //                                   const Icon(Icons.insert_drive_file,
                                      //                                       color: AppColors.bgColor, size: 40),
                                      //                                 SizedBox(width: 2.w),
                                      //                                 Expanded(
                                      //                                   child: Text(
                                      //                                     file.name,
                                      //                                     style: TextStyle(
                                      //                                       fontSize: 14.sp,
                                      //                                       color: AppColors.bgColor,
                                      //                                       fontWeight: FontWeight.w500,
                                      //                                     ),
                                      //                                     overflow: TextOverflow.ellipsis,
                                      //                                   ),
                                      //                                 ),
                                      //                                 IconButton(
                                      //                                   icon: const Icon(Icons.delete, color: Colors.red),
                                      //                                   onPressed: () {
                                      //                                     _removeFile(index);
                                      //                                     setState(() {}); // <-- Refresh UI after removing
                                      //                                   },
                                      //                                 ),
                                      //                               ],
                                      //                             ),
                                      //                           );
                                      //                         }).toList(),
                                      //                       ),
                                      //                     SizedBox(height: 3.h),
                                      //                     GestureDetector(
                                      //                       onTap: () {
                                      //                         if (_formKey.currentState!.validate()) {
                                      //                           print('Reply: ${_bodyController.text}');
                                      //                           Get.back();
                                      //                           replyTicketApi(_bodyController.text.trim());
                                      //                         }
                                      //                       },
                                      //                       child: Container(
                                      //                         height: 5.5.h,
                                      //                         alignment: Alignment.center,
                                      //                         decoration: BoxDecoration(
                                      //                           color: AppColors.bgColor,
                                      //                           borderRadius: BorderRadius.circular(3.w),
                                      //                         ),
                                      //                         child: Text(
                                      //                           'Send',
                                      //                           style: TextStyle(
                                      //                             fontSize: 17.sp,
                                      //                             color: AppColors.whiteColor,
                                      //                             fontWeight: FontWeight.bold,
                                      //                             fontFamily: FontFamily.bold,
                                      //                           ),
                                      //                         ),
                                      //                       ).marginSymmetric(horizontal: 2.w),
                                      //                     ),
                                      //                     SizedBox(height: 2.h),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //             );
                                      //           },
                                      //         );
                                      //       },
                                      //     );
                                      //
                                      //   },
                                      //   child: Container(
                                      //     height: 5.5.h,
                                      //     alignment: Alignment.center,
                                      //     decoration: BoxDecoration(
                                      //       color: AppColors.bgColor,
                                      //       borderRadius:
                                      //           BorderRadius.circular(3.w),
                                      //     ),
                                      //     child: Text(
                                      //       'Send Ticket Reply',
                                      //       style: TextStyle(
                                      //         fontSize: 17.sp,
                                      //         color: AppColors.whiteColor,
                                      //         fontWeight: FontWeight.bold,
                                      //         fontFamily: FontFamily.bold,
                                      //       ),
                                      //     ),
                                      //   ).marginSymmetric(horizontal: 2.w),
                                      // ),
                                      InkWell(
                                        onTap: () {
                                          final formKey = GlobalKey<
                                              FormState>(); // Form key
                                          TextEditingController bodyController =
                                              TextEditingController();

                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(20)),
                                            ),
                                            builder: (context) {
                                              return StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter setState) {
                                                  /// Pick files method using StatefulBuilder's setState
                                                  Future<void>
                                                      pickFiles() async {
                                                    showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return SafeArea(
                                                          child: Wrap(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const SizedBox(
                                                                      width:
                                                                          24),
                                                                  Text(
                                                                    "Choose an Option",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .bold,
                                                                      color: AppColors
                                                                          .bgColor,
                                                                      fontSize:
                                                                          17.sp,
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () =>
                                                                        Get.back(),
                                                                    child: const Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: AppColors
                                                                            .bgColor),
                                                                  ).paddingOnly(
                                                                      right:
                                                                          4.w),
                                                                ],
                                                              ).paddingOnly(
                                                                  top: 1.5.h),
                                                              ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .insert_drive_file,
                                                                    color: AppColors
                                                                        .bgColor),
                                                                title: const Text(
                                                                    "Pick a File"),
                                                                onTap:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                  FilePickerResult?
                                                                      result =
                                                                      await FilePicker
                                                                          .platform
                                                                          .pickFiles(
                                                                    type: FileType
                                                                        .custom,
                                                                    allowMultiple:
                                                                        true,
                                                                    allowedExtensions: [
                                                                      'pdf',
                                                                      'doc',
                                                                      'docx'
                                                                    ],
                                                                  );
                                                                  if (result !=
                                                                      null) {
                                                                    setState(
                                                                        () {
                                                                      _pickedFiles
                                                                          .addAll(
                                                                              result.files);
                                                                    });
                                                                  }
                                                                },
                                                              ),
                                                              ListTile(
                                                                leading: const Icon(
                                                                    Icons.photo,
                                                                    color: AppColors
                                                                        .bgColor),
                                                                title: const Text(
                                                                    "Pick Image (Gallery)"),
                                                                onTap:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                  final XFile?
                                                                      picked =
                                                                      await _picker.pickImage(
                                                                          source:
                                                                              ImageSource.gallery);
                                                                  if (picked !=
                                                                      null) {
                                                                    setState(
                                                                        () {
                                                                      _pickedFiles
                                                                          .add(
                                                                        PlatformFile(
                                                                          name:
                                                                              picked.name,
                                                                          path:
                                                                              picked.path,
                                                                          size:
                                                                              File(picked.path).lengthSync(),
                                                                        ),
                                                                      );
                                                                    });
                                                                  }
                                                                },
                                                              ),
                                                              ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .video_library,
                                                                    color: AppColors
                                                                        .bgColor),
                                                                title: const Text(
                                                                    "Pick Video (Gallery)"),
                                                                onTap:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                  final XFile?
                                                                      video =
                                                                      await _picker.pickVideo(
                                                                          source:
                                                                              ImageSource.gallery);
                                                                  if (video !=
                                                                      null) {
                                                                    setState(
                                                                        () {
                                                                      _pickedFiles
                                                                          .add(
                                                                        PlatformFile(
                                                                          name:
                                                                              video.name,
                                                                          path:
                                                                              video.path,
                                                                          size:
                                                                              File(video.path).lengthSync(),
                                                                        ),
                                                                      );
                                                                    });
                                                                  }
                                                                },
                                                              ),
                                                              ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .camera_alt,
                                                                    color: AppColors
                                                                        .bgColor),
                                                                title: const Text(
                                                                    "Open Camera"),
                                                                onTap:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                  final XFile?
                                                                      photo =
                                                                      await _picker.pickImage(
                                                                          source:
                                                                              ImageSource.camera);
                                                                  if (photo !=
                                                                      null) {
                                                                    setState(
                                                                        () {
                                                                      _pickedFiles
                                                                          .add(
                                                                        PlatformFile(
                                                                          name:
                                                                              photo.name,
                                                                          path:
                                                                              photo.path,
                                                                          size:
                                                                              File(photo.path).lengthSync(),
                                                                        ),
                                                                      );
                                                                    });
                                                                  }
                                                                },
                                                              ),
                                                              ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .videocam,
                                                                    color: AppColors
                                                                        .bgColor),
                                                                title: const Text(
                                                                    "Record Video"),
                                                                onTap:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                  final XFile?
                                                                      video =
                                                                      await _picker.pickVideo(
                                                                          source:
                                                                              ImageSource.camera);
                                                                  if (video !=
                                                                      null) {
                                                                    setState(
                                                                        () {
                                                                      _pickedFiles
                                                                          .add(
                                                                        PlatformFile(
                                                                          name:
                                                                              video.name,
                                                                          path:
                                                                              video.path,
                                                                          size:
                                                                              File(video.path).lengthSync(),
                                                                        ),
                                                                      );
                                                                    });
                                                                  }
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }

                                                  /// Remove file method
                                                  void removeFile(int index) {
                                                    setState(() {
                                                      _pickedFiles
                                                          .removeAt(index);
                                                    });
                                                  }

                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom,
                                                      top: 2.h,
                                                      left: 2.w,
                                                      right: 2.w,
                                                    ),
                                                    child: Form(
                                                      key: formKey,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            'Send Ticket Reply',
                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(height: 2.h),
                                                          AppTextField(
                                                            controller:
                                                                bodyController,
                                                            hintText:
                                                                'Enter Reply',
                                                            text: 'Reply body',
                                                            isTextavailable:
                                                                true,
                                                            maxline: 5,
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .trim()
                                                                      .isEmpty) {
                                                                return 'Reply Message is required';
                                                              }
                                                              return null;
                                                            },
                                                            textInputType:
                                                                TextInputType
                                                                    .text,
                                                            suffix: IconButton(
                                                              icon: const Icon(
                                                                  Icons
                                                                      .attach_file,
                                                                  color: AppColors
                                                                      .bgColor),
                                                              onPressed:
                                                                  () async {
                                                                await pickFiles(); // <-- Live refresh
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(height: 1.h),
                                                          if (_pickedFiles
                                                              .isNotEmpty)
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children:
                                                                  _pickedFiles
                                                                      .asMap()
                                                                      .entries
                                                                      .map(
                                                                          (entry) {
                                                                final index =
                                                                    entry.key;
                                                                final file =
                                                                    entry.value;
                                                                return Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              0.5.h),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(2
                                                                              .w),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    border: Border.all(
                                                                        color: AppColors
                                                                            .bgColor),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      if (file.extension == 'jpg' || file.extension == 'jpeg' || file.extension == 'png')
                                                                        Image.file(
                                                                            File(file
                                                                                .path!),
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            fit: BoxFit
                                                                                .cover)
                                                                      else if (file
                                                                                  .extension ==
                                                                              'mp4' ||
                                                                          file.extension ==
                                                                              'mov' ||
                                                                          file.extension ==
                                                                              'avi')
                                                                        const Icon(
                                                                            Icons
                                                                                .videocam,
                                                                            color: AppColors
                                                                                .bgColor,
                                                                            size:
                                                                                40)
                                                                      else
                                                                        const Icon(
                                                                            Icons
                                                                                .insert_drive_file,
                                                                            color:
                                                                                AppColors.bgColor,
                                                                            size: 40),
                                                                      SizedBox(
                                                                          width:
                                                                              2.w),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          file.name,
                                                                          style: TextStyle(
                                                                              fontSize: 14.sp,
                                                                              color: AppColors.bgColor,
                                                                              fontWeight: FontWeight.w500),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                      IconButton(
                                                                        icon: const Icon(
                                                                            Icons
                                                                                .delete,
                                                                            color:
                                                                                Colors.red),
                                                                        onPressed:
                                                                            () {
                                                                          removeFile(
                                                                              index); // <-- Live refresh
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              }).toList(),
                                                            ),
                                                          SizedBox(height: 3.h),
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                                print(
                                                                    'Reply: ${bodyController.text}');
                                                                Get.back();
                                                                replyTicketApi(
                                                                    bodyController
                                                                        .text
                                                                        .trim());
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 5.5.h,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: AppColors
                                                                    .bgColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3.w),
                                                              ),
                                                              child: Text(
                                                                'Send',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      17.sp,
                                                                  color: AppColors
                                                                      .whiteColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ).marginSymmetric(
                                                                horizontal:
                                                                    2.w),
                                                          ),
                                                          SizedBox(height: 2.h),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: 5.5.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.bgColor,
                                            borderRadius:
                                                BorderRadius.circular(3.w),
                                          ),
                                          child: Text(
                                            'Send Ticket Reply',
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.bold,
                                            ),
                                          ),
                                        ).marginSymmetric(horizontal: 2.w),
                                      ),

                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Ticket Replies :",
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                color: AppColors.blackColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: FontFamily.bold),
                                          )
                                        ],
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
                                        child: Column(
                                          children: [
                                            // for (int i = 0;
                                            //     i <
                                            //         (ticketReplies
                                            //                 ?.data?.length ??
                                            //             0);
                                            //     i++)
                                            //   Padding(
                                            //     padding: EdgeInsets.symmetric(
                                            //         vertical: 0.5.h),
                                            //     child: Container(
                                            //       width: Device.width,
                                            //       padding: EdgeInsets.symmetric(
                                            //           horizontal: 3.w,
                                            //           vertical: 1.5.h),
                                            //       decoration: BoxDecoration(
                                            //         color:
                                            //             const Color(0xffF5F5F5),
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 15),
                                            //         border: Border.all(
                                            //             color: AppColors
                                            //                 .blackColor
                                            //                 .withValues(
                                            //                     alpha: 0.1)),
                                            //       ),
                                            //       child: Column(
                                            //         crossAxisAlignment:
                                            //             CrossAxisAlignment
                                            //                 .start,
                                            //         children: [
                                            //           /// Top Row: Author + Date
                                            //           Row(
                                            //             mainAxisAlignment:
                                            //                 MainAxisAlignment
                                            //                     .spaceBetween,
                                            //             children: [
                                            //               ticketReplies
                                            //                           ?.data?[i]
                                            //                           .author
                                            //                           ?.id ==
                                            //                       storedId
                                            //                   ? Text(
                                            //                       "Me",
                                            //                       style:
                                            //                           TextStyle(
                                            //                         fontSize:
                                            //                             15.sp,
                                            //                         fontWeight:
                                            //                             FontWeight
                                            //                                 .bold,
                                            //                         color: AppColors
                                            //                             .blackColor,
                                            //                       ),
                                            //                     )
                                            //                   : Expanded(
                                            //                       child: Column(
                                            //                         crossAxisAlignment:
                                            //                             CrossAxisAlignment
                                            //                                 .start,
                                            //                         children: [
                                            //                           Text(
                                            //                             ticketReplies?.data?[i].author?.name ??
                                            //                                 "",
                                            //                             style:
                                            //                                 TextStyle(
                                            //                               fontSize:
                                            //                                   15.sp,
                                            //                               fontWeight:
                                            //                                   FontWeight.bold,
                                            //                               color:
                                            //                                   AppColors.blackColor,
                                            //                             ),
                                            //                           ),
                                            //                           Text(
                                            //                             ticketReplies?.data?[i].author?.email ??
                                            //                                 "",
                                            //                             style:
                                            //                                 TextStyle(
                                            //                               fontSize:
                                            //                                   15.sp,
                                            //                               fontWeight:
                                            //                                   FontWeight.bold,
                                            //                               color:
                                            //                                   AppColors.blackColor,
                                            //                             ),
                                            //                           ),
                                            //                         ],
                                            //                       ),
                                            //                     ),
                                            //               SizedBox(
                                            //                 width: 2.w,
                                            //               ),
                                            //               Text(
                                            //                 ticketReplies
                                            //                             ?.data?[
                                            //                                 i]
                                            //                             .createdTime !=
                                            //                         null
                                            //                     ? DateFormat(
                                            //                             "dd MMM yyyy, hh:mm a")
                                            //                         .format(
                                            //                         DateTime.parse(ticketReplies!
                                            //                                 .data![i]
                                            //                                 .createdTime!)
                                            //                             .toLocal(),
                                            //                       )
                                            //                     : "",
                                            //                 style: TextStyle(
                                            //                   fontSize: 13.sp,
                                            //                   color:
                                            //                       Colors.grey,
                                            //                 ),
                                            //               ),
                                            //             ],
                                            //           ),
                                            //           SizedBox(height: 0.5.h),
                                            //
                                            //           /// Reply Content
                                            //           Text(
                                            //             ticketReplies?.data?[i]
                                            //                     .summary ??
                                            //                 "",
                                            //             style: TextStyle(
                                            //               fontSize: 15.sp,
                                            //               color: AppColors
                                            //                   .blackColor,
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ),
                                            /// ee hale
                                            for (int i = 0;
                                                i <
                                                    (ticketReplies
                                                            ?.data?.length ??
                                                        0);
                                                i++)
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0.5.h),
                                                child: Container(
                                                  width: Device.width,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3.w,
                                                      vertical: 1.5.h),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .blackColor
                                                            .withValues(
                                                                alpha: 0.1)),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      /// Top Row (Author + Date)
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ticketReplies
                                                                      ?.data?[i]
                                                                      .author
                                                                      ?.id ==
                                                                  storedId
                                                              ? Text(
                                                                  "Me",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: AppColors
                                                                        .blackColor,
                                                                  ),
                                                                )
                                                              : Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        ticketReplies?.data?[i].author?.name ??
                                                                            "",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              15.sp,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              AppColors.blackColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        ticketReplies?.data?[i].author?.email ??
                                                                            "",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              13.sp,
                                                                          color:
                                                                              Colors.grey,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                          SizedBox(width: 2.w),
                                                          Text(
                                                            ticketReplies
                                                                        ?.data?[
                                                                            i]
                                                                        .createdTime !=
                                                                    null
                                                                ? DateFormat(
                                                                        "dd MMM yyyy, hh:mm a")
                                                                    .format(
                                                                    DateTime.parse(ticketReplies!
                                                                            .data![i]
                                                                            .createdTime!)
                                                                        .toLocal(),
                                                                  )
                                                                : "",
                                                            style: TextStyle(
                                                                fontSize: 13.sp,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ],
                                                      ),

                                                      SizedBox(height: 1.h),

                                                      /// 👇 Instead of Text(summary), use FutureBuilder to fetch and render HTML
                                                      // FutureBuilder(
                                                      //   future: therddetaisl(ticketReplies?.data?[i].id),
                                                      //   builder: (context, snapshot) {
                                                      //     if (snapshot.connectionState == ConnectionState.waiting) {
                                                      //       return const CircularProgressIndicator();
                                                      //     } else if (snapshot.hasError) {
                                                      //       return Text(
                                                      //         "Error loading reply",
                                                      //         style: TextStyle(color: Colors.red),
                                                      //       );
                                                      //     } else if (snapshot.hasData) {
                                                      //       final ThreadModal thread = snapshot.data!;
                                                      //       return Html(
                                                      //         data: thread.content ?? "",
                                                      //       );
                                                      //     } else {
                                                      //       return const SizedBox();
                                                      //     }
                                                      //   },
                                                      // ),

                                                      FutureBuilder(
                                                        future: therddetaisl(
                                                            ticketReplies
                                                                ?.data?[i].id),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                                  .connectionState ==
                                                              ConnectionState
                                                                  .waiting) {
                                                            return const CircularProgressIndicator();
                                                          } else if (snapshot
                                                              .hasError) {
                                                            return Text(
                                                              "Error loading reply",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                            );
                                                          } else if (snapshot
                                                              .hasData) {
                                                            final ThreadModal
                                                                thread =
                                                                snapshot.data!;

                                                            String
                                                                cleanedContent =
                                                                cleanHtmlContent(
                                                                    thread.content ??
                                                                        "");

                                                            // Convert HTML to plain text with paragraphs
                                                            String plainText =
                                                                htmlToPlainTextWithParagraphs(
                                                                    cleanedContent);

                                                            // Show plain text with paragraph formatting
                                                            return Container(
                                                              child: Text(
                                                                plainText,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  height:
                                                                      1.6, // Increased line height for better readability
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return const SizedBox();
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
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
                                  height: 3.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (isAdding)
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(child: Loader()),
                  ),
              ],
            ),
    );
  }

  String htmlToPlainTextWithParagraphs(String htmlString) {
    // More sophisticated approach that preserves paragraph structure
    String text = htmlString;

    // Preserve paragraph breaks
    text = text
        .replaceAll(RegExp(r'<p[^>]*>', caseSensitive: false),
            '') // Remove opening <p> tags
        .replaceAll(RegExp(r'</p>', caseSensitive: false),
            '\n\n') // Replace closing </p> with double newline
        .replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false),
            '\n') // Replace <br> with single newline
        .replaceAll(RegExp(r'<div[^>]*>', caseSensitive: false),
            '') // Remove opening <div> tags
        .replaceAll(RegExp(r'</div>', caseSensitive: false),
            '\n'); // Replace closing </div> with newline

    // Remove all other HTML tags
    text = text.replaceAll(RegExp(r'<[^>]*>'), '');

    // Decode HTML entities
    text = htmlDecode(text);

    // Clean up whitespace while preserving paragraph breaks
    text = cleanWhitespacePreserveParagraphs(text);

    return text;
  }

  String htmlDecode(String text) {
    return text
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&emsp;', '    ')
        .replaceAll('&ensp;', '  ');
  }

  String cleanWhitespacePreserveParagraphs(String text) {
    // Replace 3 or more newlines with just 2 (preserve paragraph spacing)
    text = text.replaceAll(RegExp(r'\n{3,}'), '\n\n');
    // Replace multiple spaces within lines with single space
    text = text.replaceAll(RegExp(r'[ ]+'), ' ');
    // Trim each line and the entire text
    text = text.split('\n').map((line) => line.trim()).join('\n').trim();

    return text;
  }

  String htmlToPlainText(String htmlString) {
    // Remove HTML tags using regex
    String text = htmlString.replaceAll(RegExp(r'<[^>]*>'), ' ');

    // Decode HTML entities
    text = text
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&nbsp;', ' ');

    // Clean up multiple spaces and trim
    text = text.replaceAll(RegExp(r'\s+'), ' ').trim();

    return text;
  }

  String cleanHtmlContent(String html) {
    if (html.isEmpty) return "";

    // Remove extra spaces, newlines and trim
    String cleaned = html
        .replaceAll(
            RegExp(r'\s+'), ' ') // Replace multiple spaces with single space
        .replaceAll(RegExp(r'\n\s*\n'), '\n') // Remove empty lines
        .trim();

    // Fix common HTML spacing issues
    cleaned = cleaned
        .replaceAll(RegExp(r'>\s+<'), '><') // Remove spaces between tags
        .replaceAll(RegExp(r'\s+</'), '</') // Remove spaces before closing tags
        .replaceAll(RegExp(r'>\s+'), '> ') // Normalize spaces after tags
        .replaceAll(RegExp(r'\s+<'), ' <'); // Normalize spaces before tags

    return cleaned;
  }

  bool isLoading = true;
  ViewDetailsTikitModal? viewDetailsTikitModal;

  void allDetailsTicketApi() async {
    storedId = await HomeProvider().getId();

    checkInternet().then((internet) async {
      if (internet) {
        Adviceprovider()
            .viewtikitdetaisl(widget.tickitid)
            .then((response) async {
          viewDetailsTikitModal =
              ViewDetailsTikitModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            setState(() {
              // isLoading = false;
            });
            allTicketRepliesApi();
            deparmentallapi();
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, stackTrace) {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
            log('Error : ${stackTrace.toString()}');
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });

        showCustomErrorSnackbar(title: 'Error', message: 'Internet Required');
      }
    });
  }

  void allTicketRepliesApi() {
    checkInternet().then((internet) async {
      if (internet) {
        Adviceprovider()
            .viewtikitrepliesdetaisl(widget.tickitid)
            .then((response) async {
          ticketReplies =
              TicketRepliesModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            setState(() {
              ticketTimeEntryApi();
              // isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, stackTrace) {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
            log('Error : ${stackTrace.toString()}');
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        showCustomErrorSnackbar(title: 'Error', message: 'Internet Required');
      }
    });
  }

  Future<String?> uploadFileToZoho(PlatformFile file) async {
    try {
      var uri = Uri.parse("https://desk.zoho.eu/api/v1/uploads");

      Map<String, String> headers = await apiConfig.getAuthHeader();

      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll(headers);

      var multipartFile = await http.MultipartFile.fromPath(
        "file",
        file.path!,
        filename: file.name,
      );

      request.files.add(multipartFile);

      // 👇 Print everything you are sending
      log("📤 API URL: $uri");
      log("📤 Headers: $headers");
      log("📤 Sending file -> field: file, name: ${multipartFile.filename}, path: ${file.path}");

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      log("📥 Upload Response Code: ${response.statusCode}");
      log("📥 Upload Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["id"] != null) {
          log("✅ File uploaded, ID: ${data["id"]}");
          return data["id"].toString();
        }
      }
      return null;
    } catch (e, stacktrace) {
      log("💥 Upload Exception: $e");
      log("💥 Stack: $stacktrace");
      return null;
    }
  }

  final ImagePicker _picker = ImagePicker();

  final List<PlatformFile> _pickedFiles = [];

  Future<void> _pickFiles(StateSetter setState) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final options = [
          {
            'icon': Icons.insert_drive_file,
            'title': 'Pick a File',
            'action': () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowMultiple: true,
                allowedExtensions: ['pdf', 'doc', 'docx'],
              );
              if (result != null) {
                setState(() => _pickedFiles.addAll(result.files));
              }
            }
          },
          {
            'icon': Icons.photo,
            'title': 'Pick Image (Gallery)',
            'action': () async {
              final XFile? picked =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (picked != null) {
                setState(() => _pickedFiles.add(PlatformFile(
                      name: picked.name,
                      path: picked.path,
                      size: File(picked.path).lengthSync(),
                    )));
              }
            }
          },
          {
            'icon': Icons.video_library,
            'title': 'Pick Video (Gallery)',
            'action': () async {
              final XFile? video =
                  await _picker.pickVideo(source: ImageSource.gallery);
              if (video != null) {
                setState(() => _pickedFiles.add(PlatformFile(
                      name: video.name,
                      path: video.path,
                      size: File(video.path).lengthSync(),
                    )));
              }
            }
          },
          {
            'icon': Icons.camera_alt,
            'title': 'Open Camera',
            'action': () async {
              final XFile? photo =
                  await _picker.pickImage(source: ImageSource.camera);
              if (photo != null) {
                setState(() => _pickedFiles.add(PlatformFile(
                      name: photo.name,
                      path: photo.path,
                      size: File(photo.path).lengthSync(),
                    )));
              }
            }
          },
          {
            'icon': Icons.videocam,
            'title': 'Record Video',
            'action': () async {
              final XFile? video =
                  await _picker.pickVideo(source: ImageSource.camera);
              if (video != null) {
                setState(() => _pickedFiles.add(PlatformFile(
                      name: video.name,
                      path: video.path,
                      size: File(video.path).lengthSync(),
                    )));
              }
            }
          },
        ];

        return SafeArea(
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24),
                  Text(
                    "Choose an Option",
                    style: TextStyle(
                      fontFamily: FontFamily.bold,
                      color: AppColors.bgColor,
                      fontSize: 17.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.close, color: AppColors.bgColor),
                  ).paddingOnly(right: 4.w),
                ],
              ).paddingOnly(top: 1.5.h),
              ...options.map((opt) => ListTile(
                    leading:
                        Icon(opt['icon'] as IconData, color: AppColors.bgColor),
                    title: Text(opt['title'] as String),
                    onTap: () async {
                      Navigator.pop(context);
                      await (opt['action'] as Future<void> Function())();
                    },
                  )),
            ],
          ),
        );
      },
    );
  }

  void _removeFile(int index) {
    setState(() {
      _pickedFiles.removeAt(index);
    });
  }

  replyTicketApi(content) async {
    setState(() => isAdding = true);

    // Step 1: Upload all picked files → collect IDs
    List<String> uploadIds = [];
    for (var file in _pickedFiles) {
      String? id = await uploadFileToZoho(file);
      if (id != null) uploadIds.add(id);
    }

    // Step 2: Build ticket body
    final Map<String, dynamic> data = {
      "channel": "EMAIL",
      "fromEmailAddress": userData?.data?[0].email,
      "to": departmentEmail,
      "contentType": "plainText",
      "content": content,
      if (uploadIds.isNotEmpty) "attachmentIds": uploadIds,
      "isForward": "false"
    };

    log("📤 Final Ticket Request Body: ${jsonEncode(data)}");

    // Step 3: Call your wrapper
    try {
      final response =
          await Adviceprovider().replyTicketApi(data, widget.tickitid);
      log("📥 Ticket Response Code: ${response.statusCode}");
      log("📥 Ticket Response Body: ${response.body}");

      replyTicket = ReplyTicketModal.fromJson(json.decode(response.body));

      if (response.statusCode == 200 || response.statusCode == 201) {
        showCustomSuccessSnackbar(
          title: 'Reply Sent',
          message: 'Your reply has been sent successfully.',
        );
        _pickedFiles.clear();
        allTicketRepliesApi();
      } else {
        setState(() {
          isAdding = false;
        });
        showCustomErrorSnackbar(
          title: 'Reply Failed',
          message: 'Unable to send your reply. Please try again.',
        );
      }
    } catch (e) {
      setState(() {
        isAdding = false;
      });
      showCustomErrorSnackbar(
        title: 'Reply Error',
        message: 'An error occurred while sending your reply: $e',
      );
    } finally {
      setState(() => isAdding = false);
    }
  }

  // replyTicketApi(content) async {
  //   setState(() => isAdding = true);
  //
  //   // Step 1: Prepare the reply message body
  //   final Map<String, dynamic> data = {
  //     "channel": "EMAIL",
  //     "fromEmailAddress": userData?.data?[0].email,
  //     "to": departmentEmail,
  //     "contentType": "plainText",
  //     "content": content,
  //     "isForward": "false"
  //   };
  //
  //   log("📤 Ticket Reply Request Body: ${jsonEncode(data)}");
  //
  //   try {
  //     // Step 2: Send reply API call
  //     final response =
  //         await Adviceprovider().replyTicketApi(data, widget.tickitid);
  //
  //     log("📥 Ticket Reply Response Code: ${response.statusCode}");
  //     log("📥 Ticket Reply Response Body: ${response.body}");
  //
  //     replyTicket = ReplyTicketModal.fromJson(json.decode(response.body));
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       showCustomSuccessSnackbar(
  //         title: 'Reply Sent',
  //         message: 'Your reply has been sent successfully.',
  //       );
  //       allTicketRepliesApi(); // Refresh the replies list
  //     } else {
  //       setState(() {
  //         isAdding = false;
  //       });
  //       showCustomErrorSnackbar(
  //         title: 'Reply Failed',
  //         message: 'Unable to send your reply. Please try again.',
  //       );
  //     }
  //   } catch (e) {
  //     setState(() {
  //       isAdding = false;
  //     });
  //     showCustomErrorSnackbar(
  //       title: 'Reply Error',
  //       message: 'An error occurred while sending your reply: $e',
  //     );
  //   } finally {
  //     setState(() => isAdding = false);
  //   }
  // }

  String totalTimeString = "00:00:00"; // declare this at class level

  void ticketTimeEntryApi() {
    checkInternet().then((internet) async {
      if (internet) {
        HomeProvider().getTimeEntryApi(widget.tickitid).then((response) async {
          getTimeEntry = GetTimeEntryModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            // calculate total time here
            totalTimeString = calculateTotalTime(getTimeEntry!);

            setState(() {
              isLoading = false;
              isAdding = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, stackTrace) {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
            log('Error : ${stackTrace.toString()}');
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        showCustomErrorSnackbar(title: 'Error', message: 'Internet Required');
      }
    });
  }

  /// function to calculate total time in hh:mm:ss
  String calculateTotalTime(GetTimeEntryModal getTimeEntry) {
    int totalSeconds = 0;

    if (getTimeEntry.data != null) {
      for (var entry in getTimeEntry.data!) {
        int hours = int.tryParse(entry.hoursSpent ?? '0') ?? 0;
        int minutes = int.tryParse(entry.minutesSpent ?? '0') ?? 0;
        int seconds = int.tryParse(entry.secondsSpent ?? '0') ?? 0;

        totalSeconds += (hours * 3600) + (minutes * 60) + seconds;
      }
    }

    // convert total seconds into hh:mm:ss format
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    return "${hours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}:"
        "${seconds.toString().padLeft(2, '0')}";
  }

  deparmentallapi() {
    checkInternet().then((internet) async {
      if (internet) {
        Adviceprovider()
            .singleDepartment(viewDetailsTikitModal?.departmentId)
            .then((response) async {
          if (response.statusCode == 200) {
            singleDepartment = SingleDepartmentModal.fromJson(
              json.decode(response.body),
            );

            // Fetch email from departments list based on singleDepartment name
            String? departmentsEmail;
            if (singleDepartment?.name != null) {
              final matchedDepartment = departments.firstWhere(
                (dept) => dept.name == singleDepartment!.name,
                orElse: () =>
                    SupportDepartment(name: '', email: '', subject: ''),
              );
              departmentsEmail = matchedDepartment.email.isNotEmpty
                  ? matchedDepartment.email
                  : null;
            }

            print('Department Name: ${singleDepartment?.name}');
            print('Departments Email: $departmentsEmail');

            setState(() {
              departmentEmail = departmentsEmail ?? '';
              print('Department : $departmentEmail');
            });
          } else if (response.statusCode == 422) {
            setState(() {
              isLoading = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Server Error',
              message: 'Internal Server Error',
            );
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        showCustomErrorSnackbar(
          title: 'No Internet',
          message: 'Please check your connection',
        );
      }
    });
  }

  // Future<void> therddetaisl(therdcode) async {
  //   bool internet = await checkInternet();
  //
  //   if (!internet) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     buildErrorDialog(context, 'Error', "Internet Required");
  //     return;
  //   }
  //
  //   try {
  //     final response = await Adviceprovider().therdDetails(therdcode);
  //     threadModal = ThreadModal.fromJson(json.decode(response.body));
  //
  //     if (response.statusCode == 200) {
  //       print("data=====>>>>>>>");
  //       print(planDetails?.plans?[0].customFields?.length);
  //
  //
  //     } else if (response.statusCode == 422) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     } else {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   } catch (error, stackTrace) {
  //     print("=======>>>>>>>>>>>>>${stackTrace}");
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }
  Future<ThreadModal?> therddetaisl(String? therdcode) async {
    if (therdcode == null) return null;

    bool internet = await checkInternet();
    if (!internet) {
      buildErrorDialog(context, 'Error', "Internet Required");
      return null;
    }

    try {
      final response = await Adviceprovider().therdDetails(therdcode);
      if (response.statusCode == 200) {
        return ThreadModal.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (error) {
      print("Thread details error: $error");
      return null;
    }
  }

  Widget buildHtmlContent(String content) {
    // First clean the content
    String cleanedContent = cleanHtmlContent(content);

    // If it's just plain text without HTML tags, use Text widget
    if (!cleanedContent.contains('<') && !cleanedContent.contains('>')) {
      return Text(
        cleanedContent,
        style: TextStyle(
          fontSize: 15.sp,
          color: AppColors.blackColor,
        ),
        maxLines: null, // Allow multiple lines
        overflow: TextOverflow.visible,
      );
    }

    // For actual HTML content
    return Container(
      child: Html(
        data: cleanedContent,
        style: {
          "*": Style(
            margin: Margins.all(0),
            padding: HtmlPaddings.all(0),
            display: Display.inline, // Force inline to avoid extra space
          ),
        },
        shrinkWrap: true,
      ),
    );
  }
}
