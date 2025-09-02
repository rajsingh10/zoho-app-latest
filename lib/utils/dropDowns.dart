import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';
import 'fontFamily.dart';

class AppDropdownField<T> extends StatelessWidget {
  final String text;
  final String hintText;
  final List<T> items;
  final T? selectedValue;
  final void Function(T?)? onChanged;
  final String Function(T)? itemLabel;
  final Widget? prefix;
  final Widget? suffix;
  final bool? enable;
  final FormFieldValidator<T>? validator;
  final bool isTextCentered;
  final bool textsize;
  final EdgeInsets? pad;
  final int? maxline;

  const AppDropdownField({
    super.key,
    required this.text,
    required this.hintText,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.itemLabel,
    this.prefix,
    this.suffix,
    this.enable,
    this.validator,
    this.isTextCentered = false,
    this.textsize = false,
    this.pad,
    this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontFamily: FontFamily.light,
            color: AppColors.blackColor,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 1.h),
        DropdownButtonFormField<T>(
          hint: Text(
            hintText,
            style: TextStyle(
              color: AppColors.border,
              fontFamily: FontFamily.regular,
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
            ),
          ),
          icon: Icon(
            CupertinoIcons.chevron_down,
            size: 16.sp,
            color: AppColors.border,
          ).paddingOnly(right: 2.w),
          value: selectedValue,
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    itemLabel!(item),
                    style: TextStyle(
                      fontFamily: FontFamily.regular,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: enable ?? true ? onChanged : null,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: prefix,
            suffixIcon: suffix,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            fillColor: AppColors.whiteColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: const BorderSide(width: 1.5, color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: const BorderSide(width: 1.5, color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide:
                  const BorderSide(width: 1.5, color: AppColors.blackColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide:
                  const BorderSide(width: 1.5, color: AppColors.redColor),
            ),
            errorStyle: TextStyle(color: AppColors.redColor, fontSize: 15.sp),
          ),
        ),
      ],
    );
  }
}
