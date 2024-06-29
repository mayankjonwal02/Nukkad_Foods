import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/Controller/order/order_model.dart';
import 'package:user_app/Controller/order/orders_model.dart';
import 'package:user_app/Controller/order/update_order_response_model.dart';
import 'package:user_app/Widgets/constants/show_snack_bar_extension.dart';
import 'package:user_app/Widgets/constants/strings.dart';

class OrderController {
  static Future<Either<String, OrdersModel>> getAllOrders({
    required BuildContext context,
    required String uid,
  }) async {
    try {
      print("${AppStrings.getAllOrdersEndpoint}/$uid");
      final response =
          await http.get(Uri.parse("${AppStrings.getAllOrdersEndpoint}/$uid"));
      final jsonResponse = jsonDecode(response.body);
      if ((response.statusCode == 200 || response.statusCode == 201) &&
          (jsonResponse["orders"].length != 0)) {
        final ordersModel = OrdersModel.fromJson(jsonResponse);
        // return ordersModel;
        return Right(ordersModel);
      } else if ((response.statusCode == 200 || response.statusCode == 201) &&
          jsonResponse["orders"].length == 0) {
        // context.showSnackBar(message: AppStrings.noItemsFound);
        return Left(AppStrings.noOrdersFound);
      } else if (response.statusCode == 404) {
        // context.showSnackBar(message: json.decode(response.body)['message']);
        return Left(json.decode(response.body)['message']);
      } else if (response.statusCode == 500) {
        // context.showSnackBar(message: json.decode(response.body)['message']);
        return Left(AppStrings.noOrdersFound);
      } else {
        // context.showSnackBar(message: AppStrings.failedToLoadOrderItems);
        return Left(AppStrings.failedToLoadOrderItems);
      }
    } catch (e) {
      // context.showSnackBar(message: AppStrings.serverError);
      return Left(AppStrings.serverError);
    }
  }

  static Future<Either<String, OrderModel>> getOrderByID({
    required String uid,
    required String orderId,
    required BuildContext context,
  }) async {
    try {
      print("${AppStrings.getOrderByIDEndpoint}/$uid/$orderId");
      final response = await http
          .get(Uri.parse("${AppStrings.getOrderByIDEndpoint}/$uid/$orderId"));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        final orderModel = OrderModel.fromJson(jsonResponse);
        return Right(orderModel);
      } else if (response.statusCode == 404) {
        return Left(json.decode(response.body)['message']);
      } else {
        return Left(AppStrings.failedToLoadOrderItem);
      }
    } catch (e) {
      return Left(AppStrings.serverError);
    }
  }

  static Future<Either<String, UpdateOrderResponseModel>> updateOrder({
    required String uid,
    required String orderId,
    required String status,
    required BuildContext context,
  }) async {
    var reqData = {
      "updateData": {"status": status}
    };
    String requestBody = jsonEncode(reqData);
    try {
      print("${AppStrings.updateOrderEndpoint}/$uid/$orderId");
      final response = await http.put(
        Uri.parse("${AppStrings.updateOrderEndpoint}/$uid/$orderId"),
        headers: {AppStrings.contentType: AppStrings.applicationJson},
        body: requestBody,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        // context.showSnackBar(message: jsonResponse['message']);
        return Right(UpdateOrderResponseModel.fromJson(jsonResponse));
      } else if (response.statusCode == 404) {
        final jsonResponse = jsonDecode(response.body);
        // context.showSnackBar(message: jsonResponse['message']);
        return Left(jsonResponse['message']);
      } else {
        // context.showSnackBar(message: AppStrings.failedToUpdateOrderItem);
        return Left(AppStrings.failedToUpdateOrderItem);
      }
    } catch (e) {
      // context.showSnackBar(message: AppStrings.serverError);
      return Left(AppStrings.serverError);
    }
  }

  static Future<void> deleteOrder({
    required String uid,
    required String orderId,
    required BuildContext context,
  }) async {
    try {
      print("${AppStrings.deleteOrderEndpoint}/$uid/$orderId");
      final response = await http.delete(
        Uri.parse("${AppStrings.deleteOrderEndpoint}/$uid/$orderId"),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        context.showSnackBar(message: jsonResponse['message']);
      } else if (response.statusCode == 404) {
        final jsonResponse = jsonDecode(response.body);
        context.showSnackBar(message: jsonResponse['message']);
      } else {
        context.showSnackBar(message: AppStrings.failedToDeleteOrderItem);
      }
    } catch (e) {
      context.showSnackBar(message: AppStrings.serverError);
    }
  }
}
