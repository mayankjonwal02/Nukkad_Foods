import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';


Future<List<int>> compressImage(File file) async {
  final result = await FlutterImageCompress.compressWithFile(
    file.absolute.path,
    minWidth: 800,
    minHeight: 600,
    quality: 85,
  );
  return result ?? file.readAsBytesSync();
}

// typedef OnFilePicked = void Function(bool isPicked, String? base64File);
typedef OnFilePicked = void Function(bool isPicked, List<int>? fileBytes);

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
          // List<int> fileBytes = await file.readAsBytes();
          List<int> fileBytes = await compressImage(file); // Compress the image
          // String base64File = base64Encode(fileBytes);
          onFilePicked(true, fileBytes);
          print('File bytes: $fileBytes');
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
