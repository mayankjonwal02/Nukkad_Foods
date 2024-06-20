import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/Controller/order/order_model.dart';
import 'package:restaurant_app/Controller/order/orders_model.dart';
import 'package:restaurant_app/Widgets/constants/show_snack_bar_extension.dart';
import 'package:restaurant_app/Widgets/constants/strings.dart';

class OrderController {
  static Future<Either<String, OrdersModel>> getAllOrders({
    required BuildContext context,
  }) async {
    try {
      print("${AppStrings.getAllOrdersEndpoint}");
      final response =
          await http.get(Uri.parse("${AppStrings.getAllOrdersEndpoint}"));
      final jsonResponse = jsonDecode(response.body);
      if ((response.statusCode == 200 || response.statusCode == 201) &&
          (jsonResponse["orders"][0] != null)) {
        final ordersModel = OrdersModel.fromJson(jsonResponse);
        // return ordersModel;
        return Right(ordersModel);
      } else if ((response.statusCode == 200 || response.statusCode == 201) &&
          (jsonResponse["orders"][0] == null)) {
        // context.showSnackBar(message: AppStrings.noItemsFound);
        return Left(AppStrings.noItemsFound);
      } else if (response.statusCode == 404) {
        // context.showSnackBar(message: json.decode(response.body)['message']);
        return Left(json.decode(response.body)['message']);
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

  static Future<void> updateOrder({
    required String uid,
    required String orderId,
    required OrderModel orderModel,
    required BuildContext context,
  }) async {
    try {
      print("${AppStrings.updateOrderEndpoint}/$uid/$orderId");
      final response = await http.put(
        Uri.parse("${AppStrings.updateOrderEndpoint}/$uid/$orderId"),
        body: json.encode(orderModel.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        context.showSnackBar(message: jsonResponse['message']);
      } else if (response.statusCode == 404) {
        final jsonResponse = jsonDecode(response.body);
        context.showSnackBar(message: jsonResponse['message']);
      } else {
        context.showSnackBar(message: AppStrings.failedToUpdateOrderItem);
      }
    } catch (e) {
      context.showSnackBar(message: AppStrings.serverError);
    }
  }

  static Future<void> deleteOrder({
    required String uid,
    required String orderId,
    required BuildContext context,
  }) async {
    try {
      print("${AppStrings.updateOrderEndpoint}/$uid/$orderId");
      final response = await http.put(
        Uri.parse("${AppStrings.updateOrderEndpoint}/$uid/$orderId"),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
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
