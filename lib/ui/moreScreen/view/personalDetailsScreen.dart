import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/Loader.dart';
import 'package:zohosystem/ui/authentications/signup/modal/countriesModal.dart';
import 'package:zohosystem/ui/homeScreen/provider/homeProvider.dart';
import 'package:zohosystem/ui/homeScreen/view/homeScreen.dart';
import 'package:zohosystem/ui/moreScreen/modal/getCardModal.dart';
import 'package:zohosystem/ui/moreScreen/modal/getCustomerDataModal.dart';
import 'package:zohosystem/ui/moreScreen/modal/updatePaymentMethod.dart';
import 'package:zohosystem/ui/moreScreen/view/updateCardWebview.dart';
import 'package:zohosystem/utils/countryIsoCodes.dart';

import '../../../apiCalling/apiConfig.dart';
import '../../../apiCalling/buildErrorDialog.dart';
import '../../../apiCalling/checkInternetModule.dart';
import '../../../apiCalling/saveUserData.dart';
import '../../../apiCalling/saveUserToken.dart';
import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/snackBars.dart';
import '../../../utils/textFields.dart';
import '../../authentications/signup/modal/allProductsModal.dart';
import '../../authentications/signup/modal/checkEmailModal.dart';
import '../../authentications/signup/modal/createContractModal.dart';
import '../../authentications/signup/provider/signupProvider.dart';
import '../../landingScreen/view/landingScreen.dart';
import '../modal/updateCustomerModal.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

final TextEditingController _firstname = TextEditingController();
final TextEditingController _lastname = TextEditingController();
final TextEditingController _companyname = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneNumber = TextEditingController();
final TextEditingController _state = TextEditingController();
final TextEditingController _address = TextEditingController();
final TextEditingController _city = TextEditingController();
final TextEditingController _zipCode = TextEditingController();
TextEditingController searchController = TextEditingController();
List<Products> productsList = [];
List<Data> countriesList = [];
Cards? selectedPrimaryCard; 
String _countryCode = '';
String _initialCountryCode = '';
String? selectedCountry;
List<String> cityList = [];
List<String> allCountries = [];
List<String> filteredCountries = [];
final LayerLink _layerLink = LayerLink();
OverlayEntry? _overlayEntry;
final GlobalKey _textFieldKey = GlobalKey();
final LayerLink _cityLayerLink = LayerLink();
OverlayEntry? _cityOverlayEntry;
final GlobalKey _cityFieldKey = GlobalKey();
TextEditingController _citySearchController = TextEditingController();
List<String> filteredCities = [];
bool isLoading = true;
bool isAdding = false;
bool _isChanged = false;
final _formKey = GlobalKey<FormState>();
String? _oldEmail;
String? _oldPhone;
bool _emailChanged = false;
bool _phoneChanged = false;

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
      _isChanged = false;
      isAdding = false;
    });
    getCountriesApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: isLoading
          ? Loader()
          : InkWell(
              onTap: () {
                if (_overlayEntry != null) _removeOverlay();
                if (_cityOverlayEntry != null) _removeCityOverlay();
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    width: Device.width,
                    decoration: const BoxDecoration(
                        color: AppColors.alternativeBlueColor),
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
                            Text(
                              "My Info",
                              style: TextStyle(
                                fontFamily: FontFamily.bold,
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor,
                                fontSize: 20.sp,
                              ),
                            ),
                            const Icon(null)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        width: Device.width,
                        color: AppColors.whiteColor,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.h),
                              Container(
                                margin: EdgeInsets.only(left: 5.w),
                                width: 70.w,
                                child: Text(
                                  'Your Membership Information.',
                                  style: TextStyle(
                                    fontFamily: FontFamily.bold,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.bgColor,
                                    fontSize: 20.sp,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Personal Information :',
                                style: TextStyle(
                                  fontFamily: FontFamily.bold,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.bgColor,
                                  fontSize: 19.sp,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(height: 1.h),
                              AppTextField(
                                controller: _firstname,
                                hintText: 'Enter Your First Name',
                                text: 'First Name',
                                isTextavailable: true,
                                textInputType: TextInputType.text,
                                prefix: const Icon(Icons.person),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'Please enter your first name'
                                        : null,
                                onChanged: (_) {
                                  if (!_isChanged) {
                                    setState(() => _isChanged = true);
                                  }
                                },
                              ),
                              SizedBox(height: 2.h),
                              AppTextField(
                                controller: _lastname,
                                hintText: 'Enter Your Last Name',
                                text: 'Last Name',
                                isTextavailable: true,
                                textInputType: TextInputType.text,
                                prefix: const Icon(Icons.person),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'Please enter your last name'
                                        : null,
                                onChanged: (_) {
                                  if (!_isChanged) {
                                    setState(() => _isChanged = true);
                                  }
                                },
                              ),
                              SizedBox(height: 2.h),
                              AppTextField(
                                controller: _companyname,
                                hintText: 'Enter Your Company Name',
                                text: 'Company Name (If Applicable)',
                                isTextavailable: true,
                                textInputType: TextInputType.text,
                                prefix: const Icon(Icons.business),
                                onChanged: (_) {
                                  if (!_isChanged) {
                                    setState(() => _isChanged = true);
                                  }
                                },
                              ),
                              SizedBox(height: 2.h),
                              AppTextField(
                                controller: _emailController,
                                hintText: 'Enter Your Email Address',
                                text: 'Email',
                                isTextavailable: true,
                                textInputType: TextInputType.emailAddress,
                                prefix: const Icon(Icons.email_outlined),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      .hasMatch(value)) {
                                    return 'Enter valid email';
                                  }
                                  return null;
                                },
                                onChanged: (_) {
                                  if (!_isChanged) {
                                    setState(() => _isChanged = true);
                                  }
                                },
                              ),
                              SizedBox(height: 2.h),
                              AppTextField(
                                controller: _phoneNumber,
                                hintText: 'Enter Your Phone Number',
                                text: 'Phone Number',
                                isTextavailable: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Phone Number is required';
                                  }
                                  return null;
                                },
                                textInputType: TextInputType.phone,
                                prefix: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: 2.w),
                                    Icon(Icons.phone, size: 19.sp),
                                    SizedBox(width: 2.w),
                                    Expanded(
                                      child: IntlPhoneField(
                                        controller: _phoneNumber,
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          disabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                          hintText: 'Enter Your Phone Number',
                                          hintStyle: TextStyle(
                                            color: AppColors.border,
                                            fontFamily: FontFamily.regular,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        initialCountryCode: _initialCountryCode,
                                        onChanged: (_) {
                                          if (!_isChanged) {
                                            setState(() => _isChanged = true);
                                          }
                                        },
                                        onCountryChanged: (phone) {
                                          if (mounted) {
                                            setState(() {
                                              _countryCode =
                                                  "+${phone.dialCode}";
                                              _isChanged = true;
                                              if (kDebugMode) {
                                                print(_countryCode);
                                              }
                                            });
                                          }
                                        },
                                        disableLengthCheck: true,
                                        showDropdownIcon: true,
                                        showCountryFlag: false,
                                        dropdownIconPosition:
                                            IconPosition.trailing,
                                        dropdownTextStyle: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Billing Information :',
                                style: TextStyle(
                                  fontFamily: FontFamily.bold,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.bgColor,
                                  fontSize: 19.sp,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(height: 2.h),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Country/Region',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontFamily: FontFamily.light,
                                        color: AppColors.blackColor,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: AppColors.redColor,
                                        fontSize: 16.sp,
                                        fontFamily: FontFamily.light,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.h),
                              CompositedTransformTarget(
                                link: _layerLink,
                                child: GestureDetector(
                                  onTap: () {
                                    if (_overlayEntry == null) {
                                      _showSearchableDropdown();
                                    } else {
                                      _removeOverlay();
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      key: _textFieldKey,
                                      controller: TextEditingController(
                                          text: selectedCountry),
                                      decoration: InputDecoration(
                                        hintText: "Select Country/Region",
                                        prefixIcon: const Icon(Icons.flag),
                                        suffixIcon: const Icon(
                                            CupertinoIcons.chevron_down),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                        filled: true,
                                        fillColor: AppColors.whiteColor,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                          borderSide: const BorderSide(
                                              width: 1.5,
                                              color: AppColors.border),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                          borderSide: const BorderSide(
                                              width: 1.5,
                                              color: AppColors.border),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                          borderSide: const BorderSide(
                                              width: 1.5,
                                              color: AppColors.blackColor),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        if (!_isChanged) {
                                          setState(() => _isChanged = true);
                                        }
                                      },
                                      validator: (value) {
                                        if (selectedCountry == null ||
                                            selectedCountry!.isEmpty) {
                                          return 'Please select a country/region';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              AppTextField(
                                controller: _address,
                                hintText: 'Enter Billing Address',
                                text: 'Billing Address',
                                isTextavailable: true,
                                textInputType: TextInputType.text,
                                prefix: const Icon(Icons.location_history),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'Please enter your billing address'
                                        : null,
                                onChanged: (_) {
                                  if (!_isChanged) {
                                    setState(() => _isChanged = true);
                                  }
                                },
                              ),
                              SizedBox(height: 2.h),
                              AppTextField(
                                controller: _state,
                                hintText: 'Enter Your Country/State',
                                text: 'Country/State',
                                isTextavailable: true,
                                textInputType: TextInputType.text,
                                prefix: const Icon(Icons.location_pin),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'Please enter your country/state'
                                        : null,
                                onChanged: (_) {
                                  if (!_isChanged) {
                                    setState(() => _isChanged = true);
                                  }
                                },
                              ),
                              SizedBox(height: 2.h),
                              CompositedTransformTarget(
                                link: _cityLayerLink,
                                child: GestureDetector(
                                  onTap: () {
                                    if (cityList.isEmpty) {
                                      showCustomErrorSnackbar(
                                          title: 'Country/Region Require',
                                          message:
                                              'Please Select Country/Region Before Selecting City');
                                    } else {
                                      if (_cityOverlayEntry == null) {
                                        _showCityDropdown();
                                        setState(() => _isChanged = true);
                                      } else {
                                        _removeCityOverlay();
                                      }
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: AppTextField(
                                      key: _cityFieldKey,
                                      controller: _city,
                                      hintText: 'Enter Your City',
                                      text: 'City',
                                      isTextavailable: true,
                                      textInputType: TextInputType.text,
                                      prefix: const Icon(Icons.business),
                                      suffix: const Icon(
                                          CupertinoIcons.chevron_down),
                                      validator: (value) =>
                                          value == null || value.isEmpty
                                              ? 'Please enter city'
                                              : null,
                                      onChanged: (_) {
                                        if (!_isChanged) {
                                          setState(() => _isChanged = true);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              AppTextField(
                                controller: _zipCode,
                                hintText: 'Enter Your Postal/Zip Code',
                                text: 'Postal/Zip Code',
                                isTextavailable: true,
                                textInputType: TextInputType.text,
                                prefix: const Icon(Icons.my_location_rounded),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter postal/zip code';
                                  }
                                  return null;
                                },
                                onChanged: (_) {
                                  if (!_isChanged) {
                                    setState(() => _isChanged = true);
                                  }
                                },
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Card Information :',
                                style: TextStyle(
                                  fontFamily: FontFamily.bold,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.bgColor,
                                  fontSize: 19.sp,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Center(
                                child: Text(
                                  '* Tap on the card to edit its details. *',
                                  style: TextStyle(
                                    fontFamily: FontFamily.bold,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.bgColor,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.h),
                              InkWell(
                                onTap: () {
                                  updatePaymentMethodApi();
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 22.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.bgColor,
                                        AppColors.appBlueColor
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 4),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedPrimaryCard?.paymentGateway
                                                  ?.toUpperCase() ??
                                              'CARD',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "**** **** **** ${selectedPrimaryCard?.lastFourDigits ?? ''}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 2,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Expiry',
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                                Text(
                                                  '${selectedPrimaryCard?.expiryMonth?.toString().padLeft(2, '0')}/${selectedPrimaryCard?.expiryYear ?? ''}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.credit_card,
                                              color: Colors.white,
                                              size: 24.sp,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              if (_isChanged)
                                InkWell(
                                  onTap: isAdding
                                      ? () {}
                                      : () {
                                          _handleUpdate();
                                        },
                                  child: Container(
                                    height: 5.5.h,
                                    width: 99.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.bgColor,
                                      borderRadius: BorderRadius.circular(3.w),
                                    ),
                                    child: isAdding
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : Text(
                                            'Update Info',
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.bold,
                                            ),
                                          ),
                                  ),
                                ),
                              SizedBox(height: 5.h),
                            ],
                          ).paddingSymmetric(horizontal: 4.w),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: AppBottombar(),
      ),
    );
  }

  getCountriesApi() {
    checkInternet().then((internet) async {
      if (internet) {
        Signupprovider().fetchCountriesApi().then((response) async {
          countries = CountriesModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            if (mounted) {
              setState(() {
                countriesList = countries?.data ?? [];
                allCountries =
                    countriesList.map((item) => item.country ?? '').toList();

                allCountries.removeWhere(
                    (element) => element.toLowerCase() == 'united kingdom');
                allCountries.insert(0, 'United Kingdom');

                filteredCountries = List.from(allCountries);
                fetchContractApi(userData?.data?[0].customerId);
                getCardsApi();
              });
            }
          } else if (response.statusCode == 422) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          } else {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Error',
            message: error.toString(),
          );
          log("error=====>>>>${error.toString()}");
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  void _handleUpdate() {
    _emailChanged = _emailController.text.trim() != _oldEmail;
    _phoneChanged = _phoneNumber.text.trim() != _oldPhone;

    if (_emailChanged || _phoneChanged) {
      String content = '';
      if (_emailChanged && _phoneChanged) {
        content =
            'Your email and phone number have been changed. You need to re-login after updating. You will be logged out.';
      } else if (_emailChanged) {
        content =
            'Your email has been changed. You need to re-login after updating. You will be logged out.';
      } else if (_phoneChanged) {
        content =
            'Your phone number has been changed. You need to re-login after updating. You will be logged out.';
      }

      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              'Confirm Update',
              style: TextStyle(fontSize: 18.sp),
            ),
            content: Text(
              content,
              style: TextStyle(fontSize: 17.sp),
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('Cancel'),
                onPressed: () => Get.back(),
              ),
              CupertinoDialogAction(
                child: const Text('Update & Logout'),
                isDestructiveAction: true,
                onPressed: () async {
                  Get.back(); // close dialog
                  if (_emailChanged && _phoneChanged) {
                    checkEmailApi(); // inside it we decide if phone check is needed
                  } else if (_emailChanged) {
                    checkEmailApi();
                  } else if (_phoneChanged) {
                    checkPhoneApi();
                  }
                },
              ),
            ],
          );
        },
      );
    } else {
      // Normal update (no re-login needed)
      updateContractApi();
    }
  }

  fetchContractApi(id) {
    checkInternet().then((internet) async {
      if (internet) {
        Signupprovider().fetchCustomerApi(id).then((response) async {
          getCustomer =
              GetCustomerDataModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            if (mounted) {
              setState(() {
                _firstname.text = getCustomer?.customer?.firstName ?? '';
                _lastname.text = getCustomer?.customer?.lastName ?? '';
                _companyname.text = getCustomer?.customer?.companyName ?? '';
                _emailController.text = getCustomer?.customer?.email ?? '';
                _phoneNumber.text = getCustomer?.customer?.phone ?? '';
                _countryCode = getCustomer?.customer?.cfCountryCode ?? '';
                _initialCountryCode = dialCodeToISO[_countryCode] ?? 'GB';
                log(_initialCountryCode);
                _state.text =
                    getCustomer?.customer?.shippingAddress?.state ?? '';
                selectedCountry =
                    getCustomer?.customer?.shippingAddress?.country ?? '';
                getCitiesFromSelectedCountry(selectedCountry ?? '');
                _address.text =
                    getCustomer?.customer?.shippingAddress?.address ?? '';
                _city.text = getCustomer?.customer?.shippingAddress?.city ?? '';
                _zipCode.text =
                    getCustomer?.customer?.shippingAddress?.zip ?? '';
                _oldEmail = _emailController.text;
                _oldPhone = _phoneNumber.text;
                isLoading = false;
              });
            }
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Fetch Error", message: getCustomer?.message ?? '');
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          } else {
            showCustomErrorSnackbar(
              title: 'Fetch Error',
              message: getCustomer?.message ?? '',
            );
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          }
        }).catchError((error, stackTrace) {
          showCustomErrorSnackbar(
            title: 'Fetch Error',
            message: error.toString(),
          );
          log("Error ========>>>>>>>>${stackTrace.toString()}");
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  void getCitiesFromSelectedCountry(String selectedCountryName) {
    final selectedCountry = countriesList.firstWhere(
      (country) => country.country == selectedCountryName,
      orElse: () => Data(),
    );

    if (selectedCountry.cities != null) {
      cityList = List<String>.from(selectedCountry.cities!);
      if (kDebugMode) {
        print("Cities: $cityList");
      }
      if (mounted) setState(() {});
    } else {
      cityList = [];
      if (kDebugMode) {
        print("No cities found for selected country");
      }
    }
  }

  void _showCityDropdown() {
    final renderBox =
        _cityFieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    filteredCities = List.from(cityList); // use current cityList

    _cityOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height - 6.h,
        width: size.width,
        child: CompositedTransformFollower(
          link: _cityLayerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height - 6.h),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.border, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _citySearchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search City',
                      fillColor: AppColors.whiteColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.border,
                        ),
                      ),
                      errorStyle:
                          TextStyle(color: AppColors.redColor, fontSize: 15.sp),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.redColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.border,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.blackColor,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                        color: AppColors.border,
                        fontFamily: FontFamily.regular,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    onChanged: (value) {
                      filteredCities = cityList
                          .where((city) =>
                              city.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                      _cityOverlayEntry!.markNeedsBuild();
                    },
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: filteredCities.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredCities[index]),
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                _city.text = filteredCities[index];
                              });
                            }
                            _removeCityOverlay();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_cityOverlayEntry!);
  }

  void _showSearchableDropdown() {
    final renderBox =
        _textFieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    filteredCountries = List.from(allCountries);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height - 6.h,
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height - 6.h),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 400),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.border, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      fillColor: AppColors.whiteColor,
                      hintText: 'Search Country',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.border,
                        ),
                      ),
                      errorStyle:
                          TextStyle(color: AppColors.redColor, fontSize: 15.sp),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.redColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.border,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.w),
                        borderSide: const BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: AppColors.blackColor,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                        color: AppColors.border,
                        fontFamily: FontFamily.regular,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    onChanged: (value) {
                      filteredCountries = allCountries
                          .where((country) => country
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                      _overlayEntry!.markNeedsBuild(); // Refresh the overlay
                    },
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: filteredCountries.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredCountries[index]),
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                selectedCountry = filteredCountries[index];
                                getCitiesFromSelectedCountry(
                                    selectedCountry ?? '');
                              });
                            }
                            _removeOverlay();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    searchController.clear();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _removeCityOverlay() {
    _citySearchController.clear();
    _cityOverlayEntry?.remove();
    _cityOverlayEntry = null;
  }

  checkEmailApi() {
    if (_formKey.currentState!.validate()) {
      if (mounted) setState(() => isAdding = true);

      checkInternet().then((internet) async {
        if (internet) {
          Signupprovider()
              .checkEmailApi(_emailController.text.trim())
              .then((response) async {
            checkEmail = checkEmailModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200) {
              if (checkEmail?.customers?.length == 0) {
                if (_phoneChanged) {
                  checkPhoneApi(); // if phone also changed, continue with phone validation
                } else {
                  updateContractApi(); // only email changed, skip phone
                }
              } else {
                if (mounted) setState(() => isAdding = false);
                showCustomErrorSnackbar(
                  title: 'Email Address',
                  message:
                      'This email address is already registered. Please use a different one.',
                );
              }
            } else if (response.statusCode == 422) {
              if (mounted) setState(() => isAdding = false);
            } else {
              if (mounted) setState(() => isAdding = false);
            }
          }).catchError((error) {
            showCustomErrorSnackbar(
              title: 'Login Error',
              message: '${error.toString()}',
            );
            log("error=====>>>>${error.toString()}");
            if (mounted) setState(() => isAdding = false);
          });
        } else {
          if (mounted) setState(() => isAdding = false);
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    } else {
      if (mounted) setState(() => isAdding = false);
    }
  }

  checkPhoneApi() {
    checkInternet().then((internet) async {
      if (internet) {
        Signupprovider()
            .checkPhoneApi(_phoneNumber.text.trim().toString())
            .then((response) async {
          checkEmail = checkEmailModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            if (checkEmail?.customers?.length == 0) {
              updateContractApi();
            } else {
              if (mounted)
                setState(() {
                  isAdding = false;
                });
              showCustomErrorSnackbar(
                title: 'Mobile Number',
                message:
                    'This phone number is already in use. Please try a different number.',
              );
            }
          } else if (response.statusCode == 422) {
            if (mounted)
              setState(() {
                isAdding = false;
              });
          } else {
            if (mounted)
              setState(() {
                isAdding = false;
              });
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Login Error',
            message: '${error.toString()}',
          );
          log("error=====>>>>${error.toString()}");
          if (mounted)
            setState(() {
              isAdding = false;
            });
        });
      } else {
        if (mounted)
          setState(() {
            isAdding = false;
          });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  updateContractApi() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isAdding = true;
      });
      final Map<String, dynamic> data = {
        'firstName': _firstname.text.trim(),
        'lastName': _lastname.text.trim(),
        'email': _emailController.text.trim(),
        'phone': _phoneNumber.text.trim(),
        'mobile': _phoneNumber.text.trim()
      };

      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          Signupprovider().updateContractApi(data).then((response) async {
            createContract =
                CreateContractModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200) {
              updateInformationApi();
            } else if (response.statusCode == 422) {
              showCustomErrorSnackbar(
                  title: "Update Error",
                  message: 'There was an error. Please try again.');
              if (mounted)
                setState(() {
                  isAdding = false;
                });
            } else {
              showCustomErrorSnackbar(
                title: 'Update Error',
                message: 'There was an error. Please try again.',
              );
              if (mounted)
                setState(() {
                  isAdding = false;
                });
            }
          }).catchError((error) {
            showCustomErrorSnackbar(
              title: 'Update Error',
              message: error.toString(),
            );
            log("Error ========>>>>>>>>${error.toString()}");
            if (mounted)
              setState(() {
                isAdding = false;
              });
          });
        } else {
          if (mounted)
            setState(() {
              isAdding = false;
            });
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    } else {
      if (mounted)
        setState(() {
          isAdding = false;
        });
    }
  }

  getCardsApi() {
    checkInternet().then((internet) async {
      if (internet) {
        HomeProvider()
            .getCard(userData?.data?[0].customerId)
            .then((response) async {
          getCard = GetCardModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            // filter only primary cards
            var primaryCards = getCard?.cards
                ?.where((card) => card.isPrimary == true)
                .toList();

            if (primaryCards != null && primaryCards.isNotEmpty) {
              // get latest by created_time
              primaryCards.sort((a, b) => DateTime.parse(b.createdTime!)
                  .compareTo(DateTime.parse(a.createdTime!)));

              setState(() {
                selectedPrimaryCard = primaryCards.first;
                log('Card Selected: ${selectedPrimaryCard?.lastFourDigits}');
              });
            }
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Fetch Error", message: getCard?.message ?? '');
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          } else {
            showCustomErrorSnackbar(
              title: 'Fetch Error',
              message: getCustomer?.message ?? '',
            );
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          }
        }).catchError((error, stackTrace) {
          showCustomErrorSnackbar(
            title: 'Fetch Error',
            message: error.toString(),
          );
          log("Error ========>>>>>>>>${stackTrace.toString()}");
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  updateInformationApi() {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> data = {
        'display_name': _firstname.text.trim(),
        'first_name': _firstname.text.trim(),
        'last_name': _lastname.text.trim(),
        'email': _emailController.text.trim(),
        'company_name': _companyname.text.trim(),
        'phone': _phoneNumber.text.trim(),
        'mobile': _phoneNumber.text.trim(),
        "shipping_address": {
          "attention": "${_firstname.text.trim()} ${_lastname.text.trim()}",
          "street": _address.text.trim(),
          "city": _city.text.trim(),
          "state": _state.text.trim(),
          "zip": _zipCode.text.trim(),
          "country": selectedCountry!.length > 30
              ? selectedCountry!.substring(0, 30)
              : selectedCountry,
          "state_code": _state.text.trim().length >= 2
              ? _state.text.trim().substring(0, 2)
              : _state.text.trim(),
        },
        "billing_address": {
          "attention": "${_firstname.text.trim()} ${_lastname.text.trim()}",
          "street": _address.text.trim(),
          "city": _city.text.trim(),
          "state": _state.text.trim(),
          "zip": _zipCode.text.trim(),
          "country": selectedCountry!.length > 30
              ? selectedCountry!.substring(0, 30)
              : selectedCountry,
          "state_code": _state.text.trim().length >= 2
              ? _state.text.trim().substring(0, 2)
              : _state.text.trim(),
        },
        "custom_fields": [
          {
            "api_name": "cf_email_address",
            "value": _emailController.text.trim(),
          },
          {
            "api_name": "cf_country_code",
            "value": _countryCode.toString(),
          }
        ]
      };

      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          Signupprovider()
              .updateCustomerApi(data, userData?.data?[0].customerId)
              .then((response) async {
            updateCustomer =
                UpdateCustomerModal.fromJson(json.decode(response.body));
            if (response.statusCode == 201 || updateCustomer?.code == 0) {
              // ✅ Success case
              if (_emailChanged || _phoneChanged) {
                // if email/phone changed → logout
                showCustomSuccessSnackbar(
                  title: "Update Successful",
                  message:
                      "Changes saved. Kindly log in again with your updated credentials.",
                );

                SaveAuthtokenData.clearUserData();
                SaveDataLocal.clearUserData();
                Get.offAll(LandingScreen());
              } else {
                // if no email/phone change → go home
                showCustomSuccessSnackbar(
                  title: "Update Successful",
                  message:
                      "Your personal information has been updated successfully.",
                );

                Get.offAll(Homescreen()); // or whatever home screen is
              }
            } else if (response.statusCode == 422) {
              showCustomErrorSnackbar(
                title: "Update Error",
                message: updateCustomer?.message ?? '',
              );
              if (mounted) setState(() => isLoading = false);
            } else {
              showCustomErrorSnackbar(
                title: 'Update Error',
                message: updateCustomer?.message ?? '',
              );
              if (mounted) setState(() => isLoading = false);
            }
          }).catchError((error) {
            showCustomErrorSnackbar(
              title: 'Update Error',
              message: error.toString(),
            );
            log("Error ========>>>>>>>>${error.toString()}");
            if (mounted) setState(() => isLoading = false);
          });
        } else {
          if (mounted) setState(() => isLoading = false);
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    } else {
      if (mounted) setState(() => isLoading = false);
    }
  }
  updatePaymentMethodApi() async {
    setState(() => isAdding = true);

    final Map<String, dynamic> data = {
      "customer_id": userData?.data?[0].customerId,
      "card_id": selectedPrimaryCard?.cardId,
      "redirect_url":
          "https://api.theadvicecentre.ltd/card_details_updated_success"
    };

    log("📤 Final Ticket Request Body: ${jsonEncode(data)}");

    // Step 3: Call your wrapper
    try {
      final response = await HomeProvider().updatePaymentMethod(data);

      updatePaymentMethod =
          UpdatePaymentMethodModal.fromJson(json.decode(response.body));

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() => isAdding = false);
        log('hosted url: ${updatePaymentMethod?.hostedpage?.url}');
        Get.to(
          UpdateCardWebVew(link: updatePaymentMethod?.hostedpage?.url ?? ''),
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
