import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Controller/food/fetch_all_restaurants_model.dart';
import 'package:user_app/Controller/food/food_controller.dart';
import 'package:user_app/Controller/order/order_controller.dart';
import 'package:user_app/Controller/order/orders_model.dart';
import 'package:user_app/Screens/Support/helpSupportScreen.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/shared_preferences.dart';
import 'package:user_app/widgets/constants/show_snack_bar_extension.dart';
import 'package:user_app/widgets/constants/strings.dart';
import 'package:user_app/widgets/constants/texts.dart';
import 'package:user_app/widgets/customs/Orders/orderStatusSelector.dart';
import 'package:user_app/widgets/customs/Orders/placedOrderDetails.dart';

class OrdersBody extends StatefulWidget {
  const OrdersBody({Key? key}) : super(key: key);

  @override
  State<OrdersBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  bool _isOngoing = true;
  bool isLoading = false;
  OrdersModel? ordersModel;
  List<Orders>? pendingOrCancelledOrders;
  List<Orders>? deliveredOrCancelledOrders;
  bool isAllRestaurantsLoaded = false;
  FetchAllRestaurantsModel? fetchAllRestaurantsModel;

  @override
  void initState() async {
    super.initState();
    await Future.wait([
      getOrders(),
      fetchAllRestaurants(),
    ]);
  }

  Future getOrders() async {
    if (!mounted) {
      return; // Widget is not mounted, do nothing
    }
    setState(() {
      isLoading = true;
      pendingOrCancelledOrders = [];
      deliveredOrCancelledOrders = [];
    });
    var result = await OrderController.getAllOrders(
      context: context,
      uid: SharedPrefsUtil().getString(AppStrings.userId) ?? "",
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
        }
        isLoading = false;
      });
    });
  }

  Future fetchAllRestaurants() async {
    setState(() {
      isAllRestaurantsLoaded = false;
    });
    var result = await FoodController.fetchAllRestaurants(context: context);
    result.fold((String text) {
      setState(() {
        isAllRestaurantsLoaded = true;
        context.showSnackBar(message: text);
      });
    }, (FetchAllRestaurantsModel allRestaurantsModel) {
      setState(() {
        fetchAllRestaurantsModel = allRestaurantsModel;
        isAllRestaurantsLoaded = true;
        print("allRestaurantsModel: $fetchAllRestaurantsModel");
      });
    });
  }

  void _handleOrderTypeChanged(bool isOngoing) {
    setState(() {
      _isOngoing = isOngoing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Column(
        children: [
          Center(
            child: Text(
              'Orders',
              style: h1TextStyle,
            ),
          ),
          OrderStatusSelector(onOrderStatusChanged: _handleOrderTypeChanged),
          SizedBox(height: 2.h),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: isLoading || !isAllRestaurantsLoaded
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                      : Center(
                          child: _isOngoing
                              ? pendingOrCancelledOrders!.length == 0
                                  ? Text(AppStrings.noOrdersFound)
                                  : _buildOrderList(
                                      context: context,
                                      orderList: pendingOrCancelledOrders!,
                                      isOngoing: _isOngoing)
                              : deliveredOrCancelledOrders!.length == 0
                                  ? Text(AppStrings.noOrdersFound)
                                  : _buildOrderList(
                                      context: context,
                                      orderList: deliveredOrCancelledOrders!,
                                      isOngoing: _isOngoing),
                        ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 6.h,
                    width: 100.w,
                    color: Colors.white,
                    child: Center(
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HelpSupportScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Need help with the orders?',
                          style: body4TextStyle.copyWith(color: primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderList({
    required List<Orders?> orderList,
    required bool isOngoing,
    required BuildContext context,
  }) =>
      SingleChildScrollView(
        child: SizedBox(
          height: 71.5.h,
          child: ListView.builder(
            itemCount: orderList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: placedOrderDetails(
                  isOngoing: isOngoing,
                  context: context,
                  order: orderList[index]!,
                  // restaurant: fetchAllRestaurantsModel!.restaurants!
                  //     .where((element) =>
                  //         element.id == orderList[index]!.restaurantId),
                ),
              );
            },
          ),
        ),
      );
}
// Widget previousOrders(isOngoing) {
//   return SingleChildScrollView(
//     child: SizedBox(
//       height: 71.5.h,
//       child: ListView.builder(
//         itemCount: 5,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.only(bottom: 2.h),
//             child: placedOrderDetails(isOngoing, context),
//           );
//         },
//       ),
//     ),
//   );
// }
//
// Widget ongoingOrders(isOngoing) {
//   return SingleChildScrollView(
//     child: SizedBox(
//       height: 71.5.h,
//       child: ListView.builder(
//         itemCount: 2,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.only(bottom: 2.h),
//             child: placedOrderDetails(isOngoing, context),
//           );
//         },
//       ),
//     ),
//   );
// }
