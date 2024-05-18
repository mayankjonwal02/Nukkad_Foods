import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:restaurant_app/Controller/Profile/profile_controller.dart';
import 'package:restaurant_app/Screens/User/documentationScreen.dart';
import 'package:restaurant_app/Screens/User/registerScreen.dart';
import 'package:restaurant_app/Widgets/buttons/mainButton.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/customs/User/registrationTimeline.dart';
import 'package:restaurant_app/Widgets/customs/User/uploadWidget.dart';
import 'package:restaurant_app/Widgets/input_fields/phoneField.dart';
import 'package:restaurant_app/Widgets/input_fields/textInputField.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';

class OwnerDetailsScreen extends StatefulWidget {
  const OwnerDetailsScreen({super.key});

  @override
  State<OwnerDetailsScreen> createState() => _OwnerDetailsScreenState();
}

class _OwnerDetailsScreenState extends State<OwnerDetailsScreen> {
  File? _image;
  // final ImagePicker imagebannerpath = ImagePicker();
  late String imagebannerpath;
  String? imageSignaturePath;
  String ownerName = '';
  String ownerEmail = '';
  String ownerPhone = '';
  String currentAddress = '';
  String permanentAddress = '';

  final ownerNameController = TextEditingController();
  final ownerEmailController = TextEditingController();
  final ownerPhoneController = TextEditingController();
  final currentAddressController = TextEditingController();
  final permanentAddressController = TextEditingController();

  String aadharNumber = '';
  String panNumber = '';

  final aadharNumberController = TextEditingController();
  final panNumberController = TextEditingController();

  int? _selectedOption;
  bool whatsappConfirmation = false;
  bool isSignatureUploaded = false;

  LocalController _getSavedData = LocalController();
  late Map<String, dynamic> userInfo;
  @override
  void initState() {
    super.initState();
    _checkPermission();
    getUserData();
  }

  Future<void> _checkPermission() async {
    PermissionStatus status = await Permission.camera.status;
    // setState(() {
    //   _status = status;
    // });
    print('Camera Permission Status: $status');

    if (status != PermissionStatus.granted) {
      // If the camera permission is not granted, request it
      await _requestPermission();
    }
  }

  Future<void> _requestPermission() async {
    try {
      PermissionStatus status = await Permission.camera.request();
      if (status == PermissionStatus.granted) {
        // Permission granted, proceed with camera usage
        print('Camera Permission Granted');
      } else {
        // Permission denied, handle accordingly
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Camera Permission Denied")));
        print('Camera Permission Denied');
      }
    } catch (e) {
      // Handle any exceptions that occur during the permission request
      print('Error requesting camera permission: $e');
    }
  }

  Future<void> getUserData() async {
    try {
      Map<String, dynamic>? getData = await _getSavedData.getUserInfo();
      setState(() {
        userInfo = getData!;
        aadharNumberController.text = userInfo['kycDetails']['aadharNumber'];
        panNumberController.text = userInfo['kycDetails']['panNumber'];
        ownerEmailController.text = userInfo['ownerEmail'];
        ownerPhoneController.text = userInfo['ownerContactNumber'];
        currentAddressController.text = userInfo['currentAddress'];
        permanentAddressController.text = userInfo['permananetAddress'];
        // isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  Future<void> saveUserInfo(Map<String, dynamic> userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_info', jsonEncode(userInfo));
    print(prefs.getString('user_info'));
  }

  routeDocumentation() {
    if (aadharNumber.isNotEmpty &&
        panNumber.isNotEmpty &&
        ownerEmail.isNotEmpty &&
        ownerName.isNotEmpty) {
      userInfo['ownerPhoto'] = imagebannerpath;
      userInfo['ownerName'] = ownerName;
      userInfo['ownerEmail'] = ownerEmail;
      userInfo['ownerContactNumber'] = ownerPhone;
      userInfo['currentAddress'] = currentAddress;
      userInfo['permananetAddress'] = permanentAddress;
      userInfo['signature'] = imageSignaturePath;
      // userInfo['nukkadAddress'] = whatsappConfirmation;
      userInfo['kycDetails'] = {
        'aadharNumber': aadharNumber,
        'panNumber': panNumber,
      };
      saveUserInfo(userInfo);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DocumentationScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Name, email, Aadhar and pan is required")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20.sp,
          ),
        ),
        title: Text('Owner\'s Photo', style: h4TextStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RegistrationTimeline(pageIndex: 1),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 2.h),
                child:
                    Text('Owner Details'.toUpperCase(), style: titleTextStyle),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: _image != null
                      ? FileImage(_image!) as ImageProvider<Object>?
                      : AssetImage('assets/images/owner.png'),
                ),
                // _image == null
                //     ? Image.asset('assets/images/owner.png')
                //     : Image.file(_image!),
                // Image.asset('assets/images/owner.png'),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()),
                      );
                    },
                    child: Container(
                        width: 45, // Adjust the width and height as needed
                        height: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red
                            // .red, // Adjust the color as needed
                            ),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          // size: 15,
                          color: Colors.white,
                        )),
                  ),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 3.h, left: 3.w, right: 3.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: textGrey2, width: 0.2.w),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: textInputField(
                        'Owner\'s Full Name', ownerNameController,
                        (String input) {
                      setState(() {
                        ownerName = input;
                      });
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: textInputField(
                        'Owner\'s Email Address', ownerEmailController,
                        (String input) {
                      setState(() {
                        ownerEmail = input;
                      });
                    }),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child:
                          buildRadioButton(0, 'Same as restaurant mobile no.')),
                  phoneField((String input) {
                    setState(() {
                      ownerPhone = input;
                    });
                  }),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CheckboxListTile(
                      value: whatsappConfirmation,
                      onChanged: (value) {
                        setState(() {
                          whatsappConfirmation = value ?? false;
                          print('Whatsapp confirmation: $whatsappConfirmation');
                        });
                      },
                      title: Text('Yes, this is my whatsapp no.',
                          style: body4TextStyle),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: colorSuccess,
                    ),
                  ),
                  textInputField('Current Address', currentAddressController,
                      (String input) {
                    setState(() {
                      currentAddress = input;
                    });
                  }),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                        width: 80.w,
                        child: buildRadioButton(1, 'Same as current address.')),
                  ),
                  SizedBox(width: 5.w),
                  textInputField(
                      'Permanent Address', permanentAddressController,
                      (String input) {
                    setState(() {
                      permanentAddress = input;
                    });
                  }),
                  SizedBox(height: 3.h),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child: Text('KYC Details'.toUpperCase(), style: titleTextStyle),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 3.w, right: 3.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: textGrey2, width: 0.2.w),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0.5.h),
                    child:
                        textInputField('Aadhaar Number', aadharNumberController,
                            (String input) {
                      setState(() {
                        aadharNumber = input;
                      });
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Spacer(),
                      verified(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0.5.h),
                    child: textInputField('PAN Number', panNumberController,
                        (String input) {
                      setState(() {
                        panNumber = input;
                      });
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Spacer(),
                      verified(),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3.h, left: 3.w, right: 3.w),
              padding: EdgeInsets.only(left: 3.w, bottom: 5.h, right: 3.w),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Signature'.toUpperCase(),
                            style: titleTextStyle,
                          ),
                          SizedBox(width: 1.w),
                          SvgPicture.asset('assets/icons/upload_icon.svg'),
                        ],
                      ),
                    ),
                  ),
                  uploadWidget(onFilePicked: _handleSignaturePicked),
                  isSignatureUploaded
                      ? Text(
                          '${imageSignaturePath?.split('/').last} selected!',
                          style: body4TextStyle.copyWith(color: colorSuccess),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              child: mainButton('Save Details', textWhite, routeDocumentation),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignaturePicked(bool isPicked, String? filePath) {
    setState(() {
      isSignatureUploaded = isPicked;
      imageSignaturePath = filePath;
    });
  }

  Widget buildRadioButton(int value, String title) {
    return RadioListTile<int>(
      value: value,
      groupValue: _selectedOption,
      onChanged: (newValue) {
        setState(() {
          _selectedOption = newValue;
        });
      },
      toggleable: true,
      title: Text(
        title,
        style: body4TextStyle.copyWith(
            fontSize: 11.sp, fontWeight: FontWeight.w400),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: primaryColor,
    );
  }

  Widget verified() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/verified_icon.svg',
            color: colorSuccess,
          ),
          Text(
            'Verified',
            style: body5TextStyle.copyWith(
              color: colorSuccess,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.camera),
                  onPressed: () {
                    // pickImage();
                    pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  label: const Text("Camera"),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.image),
                  onPressed: () {
                    // pickImage();
                    pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  label: const Text("Gallery"),
                ),
              ])
        ],
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    final pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 80);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        imagebannerpath = _image!.path;
      });
      // setState(() {
      //   _image = File(pickedFile.path);
      // });
    }
  }
}
