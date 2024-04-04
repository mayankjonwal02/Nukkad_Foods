import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

Widget phoneField(Function(String) onPhoneNumberChanged) {
  TextEditingController controller = TextEditingController();
  controller.addListener(() {
    onPhoneNumberChanged(controller.text);
  });

  return Material(
    elevation: 3.0,
    borderRadius: BorderRadius.circular(7.0),
    child: Container(
        padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.black, width: 0.1.h),
        ),
        height: 8.5.h,
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            onPhoneNumberChanged(number.phoneNumber.toString());
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            useBottomSheetSafeArea: true,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black),
          textFieldController: controller,
          formatInput: true,
          keyboardType: TextInputType.phone,
          inputBorder: InputBorder.none,
        )),
  );
}


