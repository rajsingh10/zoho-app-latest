import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/adviceTicketsScreen/Modal/AllDeparmentModal.dart'
    as AllDeparmentModal;
import 'package:zohosystem/ui/manageMembershipScreen/view/membershipPageScreen.dart';
import 'package:zohosystem/utils/textFields.dart';

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
import '../../homeScreen/view/homeScreen.dart';
import '../modal/addTicketModal.dart';
import '../provider/adviceProvider.dart';

class CreateTicketScreen extends StatefulWidget {
  const CreateTicketScreen({super.key});

  @override
  State<CreateTicketScreen> createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends State<CreateTicketScreen> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  List<AllDeparmentModal.Data> customerList = [];
  String? selectedCustomer;
  // final List<SupportDepartment> departments = [
  //   SupportDepartment(
  //     name: 'AMZ Advice Centre',
  //     email: 'support@amzadvicecentre.com',
  //     subject: 'AMZ\tAdvice\tCentre\tSupport',
  //     whatsAppNumber: '+44-114-405-5024',
  //   ),
  //   SupportDepartment(
  //     name: 'AMZ Agency',
  //     email: 'support@amzagency.co.uk',
  //     subject: 'AMZAgency\tSupport',
  //   ),
  //   SupportDepartment(
  //     name: 'Marketing Advice Centre',
  //     email: 'support@marketingadvicecentre.co.uk',
  //     subject: 'Marketing\tAdvice\tCentre\tSupport',
  //     whatsAppNumber: '+44-114-405-5021',
  //   ),
  //   SupportDepartment(
  //     name: 'The Marketing Agency',
  //     email: 'support@the-marketingagency.co.uk',
  //     subject: 'The\tMarketing\tAgency\tSupport',
  //   ),
  //   SupportDepartment(
  //     name: 'The Advice Centre: Accounts',
  //     email: 'accounts@theadvicecentre.ltd',
  //     subject: 'Accounts\tSupport',
  //   ),
  //   SupportDepartment(
  //     name: 'The Advice Centre: Introducers',
  //     email: 'support@amzadvicecentre.com',
  //     subject: 'Introducers\tSupport',
  //   ),
  //   SupportDepartment(
  //     name: 'Just Ask Alex',
  //     email: 'support@amzadvicecentre.com',
  //     subject: 'Just\tAsk\tAlex\tSupport',
  //   ),
  //   SupportDepartment(
  //     name: 'AMZBuddy',
  //     email: 'support@amzbuddy.ai',
  //     subject: 'AMZBuddy\tSupport',
  //   ),
  //   SupportDepartment(
  //     name: 'The Advice Centre: VIP',
  //     email: 'support@amzbuddy.ai',
  //     subject: 'VIP\tSupport',
  //   ),
  //   SupportDepartment(
  //     name: 'AMZAgency',
  //     email: 'support@amzagency.co.uk',
  //     subject: 'AMZAgency\tSupport\tDepartment',
  //   ),
  //   SupportDepartment(
  //     name: 'Just Ask Alex',
  //     email: 'support@justaskalex.co.uk',
  //     subject: 'Ask\tAlex',
  //   ),
  //   SupportDepartment(
  //     name: 'BizBoard',
  //     email: 'support@bizboard.co.uk',
  //     subject: 'Biz\tBoard',
  //   ),
  // ];
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
    SupportDepartment(
      name: 'BizBoard',
      email: 'support@bizboard.co.uk',
      subject: 'Biz\tBoard\tSupport',
    ),
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
      name: 'The Advice Centre: VIP',
      email: 'support@amzbuddy.ai',
      subject: 'VIP\tSupport',
    ),
    SupportDepartment(
      name: 'AMZAgency',
      email: 'support@amzagency.co.uk',
      subject: 'AMZAgency\tSupport\tDepartment',
    ),
    SupportDepartment(
      name: 'Just Ask Alex',
      email: 'support@justaskalex.co.uk',
      subject: 'Ask\tAlex',
    ),
    SupportDepartment(
      name: 'BizBoard',
      email: 'support@bizboard.co.uk',
      subject: 'Biz\tBoard',
    ),
  ];
  final _formKey = GlobalKey<FormState>();
  bool _showError = false;
  bool isLoading = true;
  bool isAdding = false;
  final ImagePicker _picker = ImagePicker();

  final List<PlatformFile> _pickedFiles = [];

  Future<void> _pickFiles() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24), // instead of Icon(null)
                  Text(
                    "Choose an Option",
                    style: TextStyle(
                      fontFamily: FontFamily.bold,
                      color: AppColors.bgColor,
                      fontSize: 17.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.close, color: AppColors.bgColor),
                  ).paddingOnly(right: 4.w)
                ],
              ).paddingOnly(top: 1.5.h),
              ListTile(
                leading: const Icon(Icons.insert_drive_file,
                    color: AppColors.bgColor),
                title: const Text("Pick a File"),
                onTap: () async {
                  Navigator.pop(context);

                  /// Only **documents**, not images/videos
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowMultiple: true,
                    allowedExtensions: [
                      'pdf',
                      'doc',
                      'docx',
                    ],
                  );

                  if (result != null) {
                    setState(() {
                      _pickedFiles.addAll(result.files);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo, color: AppColors.bgColor),
                title: const Text("Pick Image (Gallery)"),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? picked = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (picked != null) {
                    setState(() {
                      _pickedFiles.add(
                        PlatformFile(
                          name: picked.name,
                          path: picked.path,
                          size: File(picked.path).lengthSync(),
                        ),
                      );
                    });
                  }
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.video_library, color: AppColors.bgColor),
                title: const Text("Pick Video (Gallery)"),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? video = await _picker.pickVideo(
                    source: ImageSource.gallery,
                  );
                  if (video != null) {
                    setState(() {
                      _pickedFiles.add(
                        PlatformFile(
                          name: video.name,
                          path: video.path,
                          size: File(video.path).lengthSync(),
                        ),
                      );
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: AppColors.bgColor),
                title: const Text("Open Camera"),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? photo = await _picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (photo != null) {
                    setState(() {
                      _pickedFiles.add(
                        PlatformFile(
                          name: photo.name,
                          path: photo.path,
                          size: File(photo.path).lengthSync(),
                        ),
                      );
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.videocam, color: AppColors.bgColor),
                title: const Text("Record Video"),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? video = await _picker.pickVideo(
                    source: ImageSource.camera,
                  );
                  if (video != null) {
                    setState(() {
                      _pickedFiles.add(
                        PlatformFile(
                          name: video.name,
                          path: video.path,
                          size: File(video.path).lengthSync(),
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

  void _removeFile(int index) {
    setState(() {
      _pickedFiles.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;

      isAdding = false;
    });
    deparmentallapi();
    getId();
  }

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
                                "Create Ticket",
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
                            child: Form(
                              key: _formKey,
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
                                                final result =
                                                    await showMenu<String>(
                                                  context: context,
                                                  position:
                                                      RelativeRect.fromLTRB(
                                                          6.w, 25.h, 7.w, 5.w),
                                                  // position of menu
                                                  items: [
                                                    PopupMenuItem<String>(
                                                      value: '',
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Which support would you like?',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .bgColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .light,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                fontSize:
                                                                    16.sp),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    PopupMenuItem<String>(
                                                      value:
                                                          'AMZ Advice Centre',
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'AMZ Advice Centre',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .bgColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .light,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                fontSize:
                                                                    14.5.sp),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    PopupMenuItem<String>(
                                                      value:
                                                          'Marketing Advice Centre',
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Marketing Advice Centre',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .bgColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .light,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                fontSize:
                                                                    14.5.sp),
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
                                        AppTextField(
                                            controller: _subjectController,
                                            hintText: 'Enter Ticket Subject',
                                            text: 'Ticket Subject',
                                            isTextavailable: true,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.trim().isEmpty) {
                                                return 'Subject is required';
                                              }
                                              return null;
                                            },
                                            textInputType: TextInputType.text),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        AppTextField(
                                          controller: _bodyController,
                                          hintText: 'Enter Message',
                                          text: 'Message body',
                                          isTextavailable: true,
                                          maxline: 5,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'Message is required';
                                            }
                                            return null;
                                          },
                                          textInputType: TextInputType.text,
                                          suffix: IconButton(
                                            icon: const Icon(Icons.attach_file,
                                                color: AppColors.bgColor),
                                            onPressed: _pickFiles,
                                          ),
                                        ),
                                        SizedBox(height: 1.h),

// Show picked files
                                        if (_pickedFiles.isNotEmpty)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: _pickedFiles
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              final index = entry.key;
                                              final file = entry.value;
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 0.5.h),
                                                padding: EdgeInsets.all(2.w),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: AppColors.bgColor),
                                                ),
                                                child: Row(
                                                  children: [
                                                    // Preview Thumbnail
                                                    if (file.extension ==
                                                            'jpg' ||
                                                        file.extension ==
                                                            'jpeg' ||
                                                        file.extension == 'png')
                                                      Image.file(
                                                        File(file.path!),
                                                        width: 50,
                                                        height: 50,
                                                        fit: BoxFit.cover,
                                                      )
                                                    else if (file.extension ==
                                                            'mp4' ||
                                                        file.extension ==
                                                            'mov' ||
                                                        file.extension == 'avi')
                                                      const Icon(Icons.videocam,
                                                          color:
                                                              AppColors.bgColor,
                                                          size: 40)
                                                    else
                                                      const Icon(
                                                          Icons
                                                              .insert_drive_file,
                                                          color:
                                                              AppColors.bgColor,
                                                          size: 40),

                                                    SizedBox(width: 2.w),

                                                    // File Name
                                                    Expanded(
                                                      child: Text(
                                                        file.name,
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          color:
                                                              AppColors.bgColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),

                                                    // Delete Button
                                                    IconButton(
                                                      icon: const Icon(
                                                          Icons.delete,
                                                          color: Colors.red),
                                                      onPressed: () =>
                                                          _removeFile(index),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),

                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Select Department",
                                              style: TextStyle(
                                                  color: AppColors.bgColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: FontFamily.light,
                                                  fontSize: 15.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: _showError
                                                        ? Colors.red
                                                        : AppColors.bgColor),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButtonFormField(
                                                  icon: Icon(
                                                    CupertinoIcons.chevron_down,
                                                    size: 16.sp,
                                                  ),
                                                  style: const TextStyle(
                                                      color: AppColors.bgColor),
                                                  value: selectedCustomer,
                                                  items: customerList
                                                      .map((customer) {
                                                    return DropdownMenuItem(
                                                      value: customer.id,
                                                      child: Text(
                                                          customer.name ??
                                                              'N/A'),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedCustomer = value;
                                                      _showError = false;
                                                    });
                                                  },
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value
                                                            .toString()
                                                            .isEmpty) {
                                                      setState(() {
                                                        _showError = true;
                                                      });
                                                      return '';
                                                    }
                                                    return null;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                    // No underline
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                  ),
                                                  hint: Text(
                                                    'Select Department',
                                                    style: TextStyle(
                                                      color: AppColors.bgColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          FontFamily.light,
                                                      fontSize: 14.5.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (_showError)
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 2.w, top: 1.h),
                                                child: Text(
                                                  'Please select a department',
                                                  style: TextStyle(
                                                      color: AppColors.redColor,
                                                      fontSize: 15.sp),
                                                ),
                                              ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: AppColors.bgColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: FontFamily.light,
                                        fontSize: 15.sp,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              'Before creating an Advice Centre ticket, please make sure to select a department above where you have a membership plan. If you choose a department without an active plan, your request may not receive a response. ',
                                          style: TextStyle(
                                              color: AppColors.bgColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.bold,
                                              fontSize: 15.sp),
                                        ),
                                        TextSpan(
                                          text:
                                              'Click Here to view your current active membership plans..',
                                          style: TextStyle(
                                            color: Colors.orange[
                                                800], // orange clickable text
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.to(
                                                  () => membershipPageScreen());
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        addTicketApi();
                                      } else {
                                        setState(() {
                                          _showError = selectedCustomer == null;
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 5.5.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColors.bgColor,
                                          borderRadius:
                                              BorderRadius.circular(3.w)),
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
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: AppBottombar(),
      ),
    );
  }

  deparmentallapi() {
    checkInternet().then((internet) async {
      if (internet) {
        Adviceprovider().departments().then((response) async {
          if (response.statusCode == 200) {
            allDepartment = AllDeparmentModal.AllDeparmentModal.fromJson(
              json.decode(response.body),
            );

            setState(() {
              customerList = allDepartment?.data ?? [];
              log('Customer Names: ${customerList.map((e) => e.name).toList()}');

              final matchedList = (allDepartment?.data ?? []).where((apiDept) {
                return departments.any((staticDept) =>
                    apiDept.name?.toLowerCase().trim() ==
                    staticDept.name.toLowerCase().trim());
              }).toList();
              customerList = matchedList;

              isLoading = false;
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

  fetchAuthtokenApi() {
    SaveAuthtokenData.removeAuthToken();
    checkInternet().then((internet) async {
      if (internet) {
        LoginProvider().refreshTokenApi().then((response) async {
          authtoken = AuthtokenModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            setState(() {
              isLoading = false;
            });
            SaveAuthtokenData.saveAuthData(authtoken!);
            addTicketApi();
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

  Future<String?> getId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('my_id');
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

  addTicketApi() async {
    final prefs = await SharedPreferences.getInstance();
    final savedId = prefs.getString('selectedSubscriptionId');
    setState(() => isAdding = true);

    String? storedId = await getId();

    // Step 1: Upload all picked files → collect IDs
    List<String> uploadIds = [];
    for (var file in _pickedFiles) {
      String? id = await uploadFileToZoho(file);
      if (id != null) uploadIds.add(id);
    }

    // Step 2: Build ticket body
    final Map<String, dynamic> data = {
      "subject": _subjectController.text.trim(),
      "departmentId": selectedCustomer.toString(),
      "contactId": storedId ?? "",
      "description": _bodyController.text.trim(),
      "priority": "High",
      "channel": "Email",
      if (uploadIds.isNotEmpty) "uploads": uploadIds,
      "cf": {"cf_plan_id": savedId}
    };

    log("📤 Final Ticket Request Body: ${jsonEncode(data)}");

    // Step 3: Call your wrapper
    try {
      final response = await Adviceprovider().addticketsapi(data);
      log("📥 Ticket Response Code: ${response.statusCode}");
      log("📥 Ticket Response Body: ${response.body}");

      addTicket = AddTicketModal.fromJson(json.decode(response.body));

      if (response.statusCode == 200 || response.statusCode == 201) {
        showCustomSuccessSnackbar(
          title: 'Add Ticket',
          message: 'Ticket created successfully!',
        );
        Get.offAll(
          const Homescreen(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 250),
        );
      } else {
        showCustomErrorSnackbar(
          title: 'Add Ticket Error',
          message: response.body,
        );
      }
    } catch (e) {
      showCustomErrorSnackbar(
        title: 'Add Ticket Error',
        message: e.toString(),
      );
    } finally {
      setState(() => isAdding = false);
    }
  }
}
