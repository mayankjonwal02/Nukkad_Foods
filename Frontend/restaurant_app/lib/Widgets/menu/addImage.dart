import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/customs/User/uploadWidget.dart';

class AddImage extends StatefulWidget {
  const AddImage({Key? key, required this.onFilePicked, required this.context,this.isImageUploaded= false,this.imagePath})
      : super(key: key ?? const Key('default'));
  final OnFilePicked onFilePicked;
  final BuildContext context;
  final bool? isImageUploaded;
  final String? imagePath;

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  String _base64Image = '';

  void _handleFilePicked(bool isPicked, String? base64File) {
    if (isPicked && base64File != null) {
      setState(() {
        _base64Image = base64File;
      });
      // You can now send _base64Image to your backend or use it as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFCACACA))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Image (optional)',
            style: h5TextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: uploadWidget(
              onFilePicked: widget.onFilePicked, context: widget.context,
              // onTap: () async {
              //   // Use uploadWidget to pick a file
              //   uploadWidget(
              //       onFilePicked: widget.onFilePicked, context: widget.context);
              // },
              child: DottedBorder(
                strokeWidth: 2,
                dashPattern: [6, 3],
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                color: Color(0xFFB8B8B8),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    // border: Border.all(color: Color(0xFFB8B8B8)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          widget.isImageUploaded!
              ? Text(
            '${widget.imagePath?.split('/').last} selected!',
            style: body4TextStyle.copyWith(color: colorSuccess),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
