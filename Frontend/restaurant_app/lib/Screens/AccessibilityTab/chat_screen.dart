import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/Widgets/buttons/mainButton.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:sizer/sizer.dart';

class ChatScreenWidget extends StatefulWidget {
  const ChatScreenWidget({Key? key}) : super(key: key);

  @override
  State<ChatScreenWidget> createState() => _ChatScreenWidgetState();
}

class _ChatScreenWidgetState extends State<ChatScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Us', style: h4TextStyle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 19.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: ListView(
                  children: [
                    // Container for other user messages
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 1.43,
                      decoration: BoxDecoration(
                        color: textGrey3,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          "Hi Apeksha, I am your costumer care representive, Vinod. How can I help you today?"),
                    ),
                    // Container for current user messages
                    Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Your Message",
                        style: body6TextStyle.copyWith(
                          letterSpacing: 0.7,
                          fontSize: 15,
                          color: textWhite,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.w),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Handle send message action
                    },
                    icon: Icon(Icons.send),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
