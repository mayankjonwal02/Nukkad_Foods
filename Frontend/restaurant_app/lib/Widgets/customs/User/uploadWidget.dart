import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:file_picker/file_picker.dart';

typedef OnFilePicked = void Function(bool isPicked, String? base64File);

Widget uploadWidget({required OnFilePicked onFilePicked}) {
  return GestureDetector(
    onTap: () async {
      try {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'pdf', 'png'],
        );

        if (result != null) {
          File file = File(result.files.single.path!);
          List<int> fileBytes = await file.readAsBytes();
          String base64File = base64Encode(fileBytes);
          onFilePicked(true, base64File);
          print('Base64 file: $base64File');
        } else {
          // User canceled the picker
          onFilePicked(false, null);
          print('User canceled the file picking');
        }
      } catch (e) {
        print('File picking error: $e');
      }
    },
    child: Container(
      height: 15.h,
      width: 15.h,
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        color: textGrey2,
        border: Border.all(
          color: textGrey1,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 4.h,
        width: 4.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: textWhite,
        ),
        child: SvgPicture.asset(
          'assets/icons/add_icon.svg',
          height: 3.h,
        ),
      ),
    ),
  );
}