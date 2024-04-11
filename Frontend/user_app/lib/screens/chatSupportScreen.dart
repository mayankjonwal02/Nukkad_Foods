import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

class ChatSupportScreen extends StatefulWidget {
  const ChatSupportScreen({Key? key}) : super(key: key);

  @override
  _ChatSupportScreenState createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  final TextEditingController _messageController = TextEditingController();

  List<Map<String, dynamic>> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: textBlack),
        ),
        title: h4Text('Chat with Us', textBlack),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isSupport = message['isSupport'] as bool;
                final color = isSupport ? Colors.grey : primaryColor2;
                final textColor = isSupport ? textBlack : Colors.white;
                final borderRadius = BorderRadius.circular(15);
                return Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 5.w),
                  child: Align(
                    alignment: isSupport
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 75.w),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: borderRadius,
                        ),
                        child: Text(
                          message['text'] as String,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Start typing your query...',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: textBlack,
                ),
                suffixIcon: IconButton(
                  icon: Image.asset('assets/icons/message_send.png'),
                  onPressed: () {
                    final text = _messageController.text;
                    if (text.isNotEmpty) {
                      setState(() {
                        _messages.add({'text': text, 'isSupport': false});
                        _messageController.clear();

                        _messages.add(
                            {'text': 'Support message', 'isSupport': true});
                      });
                    }
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: primaryColor2, width: 0.1.h),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: primaryColor2, width: 0.1.h),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
