import 'package:flutter/material.dart';
import 'package:restaurant_app/Controller/order/order_controller.dart';
import 'package:restaurant_app/Controller/order/orders_model.dart';
import 'package:restaurant_app/Widgets/constants/show_snack_bar_extension.dart';
import 'package:restaurant_app/Widgets/constants/strings.dart';
import 'package:restaurant_app/Widgets/customs/OrderBody/sortingBar.dart';
import 'package:sizer/sizer.dart';

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

  // String? uid;

  // List<Map<String, dynamic>> myOrder = [];

  // List<Map<String, dynamic>> responseDataList = [];
  Map<String, List<Orders>>? groupedOrders;
  OrdersModel? ordersModel;
  List<Orders> myOrder = [];
  List<Orders> allOrder = [];
  List<Orders>? pendingOrCancelledOrders;
  List<Orders>? deliveredOrCancelledOrders;
  @override
  void initState() {
    // TODO: implement initState
    // myOrder = responseDataList
    //     .where((order) => order['status'] == 'Pending')
    //     .toList();

    super.initState();
    // getUid();
    getAllOrders();
  }

  getAllOrders() async {
    if (!mounted) {
      return; // Widget is not mounted, do nothing
    }
    setState(() {
      isLoading = true;
      groupedOrders = {};
      allOrder = [];
      pendingOrCancelledOrders = [];
      deliveredOrCancelledOrders = [];
    });
    var result = await OrderController.getAllOrders(
      context: context,
    );
    result.fold((String message) {
      setState(() {
        isLoading = false;
      });
      context.showSnackBar(message: message);
    }, (OrdersModel getAllOrders) {
      setState(() {
        ordersModel = getAllOrders;
        if (ordersModel!.orders!.length != 0) {
          groupedOrders = ordersModel!.groupOrdersByStatus();
          pendingOrCancelledOrders = ordersModel!
              .groupOrdersByStatus()
              .values
              .where((ordersList) => ordersList.any((order) =>
                  order.status == 'Pending' ||
                  order.status == 'Canceled' ||
                  order.status == 'Accepted' ||
                  order.status == 'On the way' ||
                  order.status == 'Ready'))
              .expand((ordersList) => ordersList)
              .toList();
          deliveredOrCancelledOrders = ordersModel!
              .groupOrdersByStatus()
              .values
              .where((ordersList) => ordersList.any((order) =>
                  order.status == 'Delivered' || order.status == 'Canceled'))
              .expand((ordersList) => ordersList)
              .toList();
          allOrder = ordersModel!
              .groupOrdersByStatus()
              .values
              .expand((order) => order)
              .toList();

          myOrder = pendingOrCancelledOrders ?? [];
        }
        isLoading = false;
      });
    });
  }

  // Future<void> getUid() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     uid = prefs.getString('User_id');
  //   });
  //   getOngoingData();
  // }

  // Future<void> getOngoingData() async {
  //   if (!mounted) {
  //     return; // Widget is not mounted, do nothing
  //   }
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     var baseUrl = dotenv.env['BASE_URL'];
  //     final response = await http
  //         .get(Uri.parse('$baseUrl/order/orders/6643a1f3c6ff7f63f77f536c'));
  //     if (response.statusCode == 200) {
  //       final responseData = jsonDecode(response.body);
  //       if (responseData is Map<String, dynamic>) {
  //         // ScaffoldMessenger.of(context).showSnackBar(
  //         //     const SnackBar(content: Text("Get Ongoing Order Successfully")));
  //         setState(() {
  //           isLoading = false;
  //           responseDataList =
  //               List<Map<String, dynamic>>.from(responseData['orders']);
  //           myOrder = responseDataList
  //               .where((order) =>
  //                   order['status'] == 'Pending' ||
  //                   order['status'] == 'Canceled' ||
  //                   order['status'] == 'Accepted' ||
  //                   order['status'] == 'On the way' ||
  //                   order['status'] == 'Ready')
  //               .toList();
  //         });
  //       } else {
  //         setState(() {
  //           isLoading = false;
  //         });
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //               backgroundColor: colorFailure,
  //               content: Text(responseData['message'])),
  //         );
  //       }
  //     } else {
  //       setState(() {
  //         isLoading = false;
  //       });
  //
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           backgroundColor: colorFailure,
  //           content: Text("Failed to get ongoing order")));
  //     }
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         backgroundColor: colorFailure, content: Text("Error: Server Error")));
  //   }
  // }

  void _handelSelectedTab(int idx) {
    if (isOngoing) {
      switch (idx) {
        case 0:
          setState(() {
            myOrder = pendingOrCancelledOrders ?? [];
            // myOrder = responseDataList
            //     .where((order) =>
            //         order['status'] == 'Pending' ||
            //         order['status'] == 'Canceled' ||
            //         order['status'] == 'Accepted' ||
            //         order['status'] == 'On the way' ||
            //         order['status'] == 'Ready')
            //     .toList();
          });
        case 1:
          setState(() {
            myOrder = groupedOrders!["Pending"] ?? [];
            // myOrder = responseDataList
            //     .where((order) => order['status'] == 'Pending')
            //     .toList();
          });
          break;
        case 2:
          setState(() {
            myOrder = groupedOrders!["Accepted"] ?? [];
            // myOrder = responseDataList
            //     .where((order) => order['status'] == 'Accepted')
            //     .toList();
          });
          break;
        case 3:
          setState(() {
            myOrder = groupedOrders!["Ready"] ?? [];
            // myOrder = responseDataList
            //     .where((order) => order['status'] == 'Ready')
            //     .toList();
          });
          break;
        case 4:
          setState(() {
            myOrder = groupedOrders!["On the way"] ?? [];
            // myOrder = responseDataList
            //     .where((order) => order['status'] == 'On the way')
            //     .toList();
          });
          break;
        default:
          setState(() {
            myOrder = pendingOrCancelledOrders ?? [];
            // myOrder = responseDataList
            //     .where((order) =>
            //         order['status'] == 'Pending' ||
            //         order['status'] == 'Canceled' ||
            //         order['status'] == 'Accepted' ||
            //         order['status'] == 'On the way' ||
            //         order['status'] == 'Ready')
            //     .toList();
          });
          break;
      }
    } else {
      List<Orders> responseDataListPrv = deliveredOrCancelledOrders ?? [];
      // List<Map<String, dynamic>> responseDataListPrv = responseDataList
      //     .where((order) =>
      //         order['status'] == 'Delivered' || order['status'] == 'Canceled')
      //     .toList();
      ;
      switch (idx) {
        case 0:
          setState(() {
            myOrder = deliveredOrCancelledOrders ?? [];
            // myOrder = responseDataListPrv
            //     .where((order) =>
            //         order['status'] == 'Delivered' ||
            //         order['status'] == 'Canceled')
            //     .toList();
          });
        case 1:
          DateTime now = DateTime.now();
          TimeOfDay currentTime = TimeOfDay.fromDateTime(now);

          setState(() {
            myOrder = responseDataListPrv.where((order) {
              DateTime orderDateTime = DateTime.parse(order.date!);
              TimeOfDay orderTime = TimeOfDay.fromDateTime(orderDateTime);
              return orderTime.hour < currentTime.hour ||
                  (orderTime.hour == currentTime.hour &&
                      orderTime.minute <= currentTime.minute);
            }).toList();
            // myOrder = responseDataListPrv.where((order) {
            //   DateTime orderDateTime = DateTime.parse(order['date']);
            //   TimeOfDay orderTime = TimeOfDay.fromDateTime(orderDateTime);
            //   return orderTime.hour < currentTime.hour ||
            //       (orderTime.hour == currentTime.hour &&
            //           orderTime.minute <= currentTime.minute);
            // }).toList();
          });
          break;
        case 2:
          setState(() {
            myOrder = groupedOrders!["Canceled"] ?? [];
            // myOrder = responseDataList
            //     .where((order) => order['status'] == 'Canceled')
            //     .toList();
          });
          break;
        case 3:
          DateTime now = DateTime.now();
          DateTime today = DateTime(now.year, now.month, now.day);

          setState(() {
            myOrder = responseDataListPrv.where((order) {
              DateTime orderDate = DateTime.parse(order.date!);
              DateTime orderDateOnly =
                  DateTime(orderDate.year, orderDate.month, orderDate.day);
              return orderDateOnly.isAtSameMomentAs(today);
            }).toList();
            // myOrder = responseDataListPrv.where((order) {
            //   DateTime orderDate = DateTime.parse(order['date']);
            //   DateTime orderDateOnly =
            //       DateTime(orderDate.year, orderDate.month, orderDate.day);
            //   return orderDateOnly.isAtSameMomentAs(today);
            // }).toList();
          });
          break;
        case 4:
          setState(() {
            DateTime now = DateTime.now();
            DateTime today = DateTime(now.year, now.month, now.day);

            setState(() {
              myOrder = responseDataListPrv.where((order) {
                DateTime orderDate = DateTime.parse(order.date!);
                DateTime orderDateOnly =
                    DateTime(orderDate.year, orderDate.month, orderDate.day);
                return orderDateOnly.isBefore(today);
              }).toList();
            });
            // myOrder = responseDataListPrv.where((order) {
            //     DateTime orderDate = DateTime.parse(order['date']);
            //     DateTime orderDateOnly =
            //         DateTime(orderDate.year, orderDate.month, orderDate.day);
            //     return orderDateOnly.isBefore(today);
            //   }).toList();
            // });
          });
          break;
        default:
          setState(() {
            myOrder = deliveredOrCancelledOrders ?? [];
            // myOrder = responseDataListPrv
            //     .where((order) =>
            //         order['status'] == 'Delivered' ||
            //         order['status'] == 'Canceled')
            //     .toList();
          });
          break;
      }
    }
  }

  void _handelOrderFilter(String text) {
    if (isOngoing) {
      switch (text) {
        case 'Newest First':
          DateTime now = DateTime.now();
          DateTime today = DateTime(now.year, now.month, now.day);

          setState(() {
            myOrder = ordersModel!.orders!.where((order) {
              DateTime orderDate = DateTime.parse(order.date!);
              DateTime orderDateOnly =
                  DateTime(orderDate.year, orderDate.month, orderDate.day);
              return orderDateOnly.isAtSameMomentAs(today);
            }).toList();
          });
        // myOrder = responseDataList.where((order) {
        //     DateTime orderDate = DateTime.parse(order['date']);
        //     DateTime orderDateOnly =
        //         DateTime(orderDate.year, orderDate.month, orderDate.day);
        //     return orderDateOnly.isAtSameMomentAs(today);
        //   }).toList();
        // });
        case 'Oldest First':
          DateTime now = DateTime.now();
          DateTime today = DateTime(now.year, now.month, now.day);

          setState(() {
            myOrder = ordersModel!.orders!.where((order) {
              DateTime orderDate = DateTime.parse(order.date!);
              DateTime orderDateOnly =
                  DateTime(orderDate.year, orderDate.month, orderDate.day);
              return !orderDateOnly.isAtSameMomentAs(today);
            }).toList();
            // myOrder = responseDataList.where((order) {
            //   DateTime orderDate = DateTime.parse(order['date']);
            //   DateTime orderDateOnly =
            //       DateTime(orderDate.year, orderDate.month, orderDate.day);
            //   return !orderDateOnly.isAtSameMomentAs(today);
            // }).toList();
          });
          break;

        default:
          setState(() {
            myOrder = pendingOrCancelledOrders ?? [];
            // myOrder = responseDataList
            //     .where((order) =>
            //         order['status'] == 'Pending' ||
            //         order['status'] == 'Canceled' ||
            //         order['status'] == 'Accepted' ||
            //         order['status'] == 'On the way' ||
            //         order['status'] == 'Ready')
            //     .toList();
          });
          break;
      }
    } else {
      List<Orders> responseDataListPrv = deliveredOrCancelledOrders ?? [];
      // List<Map<String, dynamic>> responseDataListPrv = responseDataList
      //     .where((order) =>
      //         order['status'] == 'Delivered' || order['status'] == 'Canceled')
      //     .toList();
      ;
      switch (text) {
        case 'Newest First':
          DateTime now = DateTime.now();
          DateTime today = DateTime(now.year, now.month, now.day);

          setState(() {
            myOrder = responseDataListPrv.where((order) {
              DateTime orderDate = DateTime.parse(order.date!);
              DateTime orderDateOnly =
                  DateTime(orderDate.year, orderDate.month, orderDate.day);
              return orderDateOnly.isAtSameMomentAs(today);
            }).toList();
            // myOrder = responseDataListPrv.where((order) {
            //   DateTime orderDate = DateTime.parse(order['date']);
            //   DateTime orderDateOnly =
            //       DateTime(orderDate.year, orderDate.month, orderDate.day);
            //   return orderDateOnly.isAtSameMomentAs(today);
            // }).toList();
          });
        case 'Oldest First':
          DateTime now = DateTime.now();
          DateTime today = DateTime(now.year, now.month, now.day);

          setState(() {
            myOrder = responseDataListPrv.where((order) {
              DateTime orderDate = DateTime.parse(order.date!);
              DateTime orderDateOnly =
                  DateTime(orderDate.year, orderDate.month, orderDate.day);
              return !orderDateOnly.isAtSameMomentAs(today);
            }).toList();
            // myOrder = responseDataListPrv.where((order) {
            //   DateTime orderDate = DateTime.parse(order['date']);
            //   DateTime orderDateOnly =
            //       DateTime(orderDate.year, orderDate.month, orderDate.day);
            //   return !orderDateOnly.isAtSameMomentAs(today);
            // }).toList();
          });
          break;
        // case '':
        //   DateTime now = DateTime.now();
        //   TimeOfDay currentTime = TimeOfDay.fromDateTime(now);

        //   setState(() {
        //     myOrder = responseDataListPrv.where((order) {
        //       DateTime orderDateTime = DateTime.parse(order['date']);
        //       TimeOfDay orderTime = TimeOfDay.fromDateTime(orderDateTime);
        //       return orderTime.hour < currentTime.hour ||
        //           (orderTime.hour == currentTime.hour &&
        //               orderTime.minute <= currentTime.minute);
        //     }).toList();
        //   });
        //   break;

        // case '':
        //   DateTime now = DateTime.now();
        //   DateTime today = DateTime(now.year, now.month, now.day);

        //   setState(() {
        //     myOrder = responseDataListPrv.where((order) {
        //       DateTime orderDate = DateTime.parse(order['date']);
        //       DateTime orderDateOnly =
        //           DateTime(orderDate.year, orderDate.month, orderDate.day);
        //       return orderDateOnly.isAtSameMomentAs(today);
        //     }).toList();
        //   });
        //   break;

        default:
          setState(() {
            myOrder = deliveredOrCancelledOrders ?? [];
            // myOrder = responseDataListPrv
            //     .where((order) =>
            //         order['status'] == 'Delivered' ||
            //         order['status'] == 'Canceled')
            //     .toList();
          });
          break;
      }
    }
  }

  void _handleOrderTypeChanged(bool newValue) {
    setState(() {
      isOngoing = newValue;
      if (isOngoing == true) {
        myOrder = pendingOrCancelledOrders ?? [];
        // myOrder = responseDataList
        //     .where((order) =>
        //         order['status'] == 'Pending' ||
        //         order['status'] == 'Canceled' ||
        //         order['status'] == 'Accepted' ||
        //         order['status'] == 'On the way' ||
        //         order['status'] == 'Ready')
        //     .toList();
      } else {
        myOrder = deliveredOrCancelledOrders ?? [];
        // myOrder = responseDataList
        //     .where((order) =>
        //         order['status'] == 'Delivered' || order['status'] == 'Canceled')
        //     .toList();
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
                child: SortingBar(
                    type: isOngoing, onOrderFilterChanged: _handelOrderFilter),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child:
                    OrderFilter(type: isOngoing, selected: _handelSelectedTab),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 2.h),
                child: SizedBox(
                  height: 62.h,
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                      : myOrder.length == 0
                          ? Center(
                              child: Text(AppStrings.noOrdersFound),
                            )
                          : ListView.builder(
                              itemCount: myOrder.length,
                              itemBuilder: (context, index) {
                                return OrderWidget(
                                    type: isOngoing,
                                    uid: ordersModel.,
                                    order: myOrder[index]);
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
