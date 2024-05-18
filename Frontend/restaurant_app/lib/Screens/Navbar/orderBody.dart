import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:restaurant_app/Widgets/customs/OrderBody/sortingBar.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../../Widgets/customs/OrderBody/orderFilters.dart';
import '../../Widgets/customs/OrderBody/orderStatusSelector.dart';
import '../../Widgets/customs/OrderBody/orderWidget.dart';

class OrderBody extends StatefulWidget {
  const OrderBody({super.key});

  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  bool isOngoing = true;

  bool isLoading = false;

  late List<Map<String, dynamic>> myOrder;

  List<Map<String, dynamic>> responseDataList = [];
  @override
  void initState() {
    // TODO: implement initState
    // myOrder = responseDataList
    //     .where((order) => order['status'] == 'Pending')
    //     .toList();
    getOngoingData();
    super.initState();
  }

  Future<void> getOngoingData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var baseUrl = dotenv.env['BASE_URL'];
      final response = await http
          .get(Uri.parse('$baseUrl/order/orders/6643a1f3c6ff7f63f77f536c'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData is Map<String, dynamic>) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: Text("Get Ongoing Order Successfully")));
          setState(() {
            isLoading = false;
            responseDataList =
                List<Map<String, dynamic>>.from(responseData['orders']);
            myOrder = responseDataList
                .where((order) =>
                    order['status'] == 'Pending' ||
                    order['status'] == 'Canceled' ||
                    order['status'] == 'Accepted' ||
                    order['status'] == 'On the way' ||
                    order['status'] == 'Ready')
                .toList();
          });
        } else {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseData['message'])),
          );
        }
      } else {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to get ongoing order")));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error: Server Error")));
    }
  }

  void _handelSelectedTab(int idx) {
    switch (idx) {
      case 0:
      case 1:
        setState(() {
          myOrder = responseDataList
              .where((order) =>
                  order['status'] == 'Pending' ||
                  order['status'] == 'Canceled' ||
                  order['status'] == 'Accepted' ||
                  order['status'] == 'On the way' ||
                  order['status'] == 'Ready')
              .toList();
        });
        break;
      case 2:
        setState(() {
          myOrder = responseDataList
              .where((order) => order['status'] == 'Accepted')
              .toList();
        });
        break;
      case 3:
        setState(() {
          myOrder = responseDataList
              .where((order) => order['status'] == 'Ready')
              .toList();
        });
        break;
      case 4:
        setState(() {
          myOrder = responseDataList
              .where((order) => order['status'] == 'On the way')
              .toList();
        });
        break;
      default:
        setState(() {
          myOrder = responseDataList
              .where((order) =>
                  order['status'] == 'Pending' ||
                  order['status'] == 'Canceled' ||
                  order['status'] == 'Accepted' ||
                  order['status'] == 'On the way' ||
                  order['status'] == 'Ready')
              .toList();
        });
        break;
    }
  }

  void _handleOrderTypeChanged(bool newValue) {
    setState(() {
      isOngoing = newValue;
      if (isOngoing == true) {
        myOrder = responseDataList
            .where((order) =>
                order['status'] == 'Pending' ||
                order['status'] == 'Canceled' ||
                order['status'] == 'Accepted' ||
                order['status'] == 'On the way' ||
                order['status'] == 'Ready')
            .toList();
      } else {
        myOrder = responseDataList
            .where((order) =>
                order['status'] == 'Delivered' || order['status'] == 'Canceled')
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                child: OrderStatusSelector(
                  onOrderStatusChanged: _handleOrderTypeChanged,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SortingBar(type: isOngoing),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child:
                    OrderFilter(type: isOngoing, selected: _handelSelectedTab),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 2.h),
                child: SizedBox(
                  height: 70.h,
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                      : ListView.builder(
                          itemCount: myOrder.length,
                          itemBuilder: (context, index) {
                            return OrderWidget(
                                type: isOngoing, order: myOrder[index]);
                          }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
