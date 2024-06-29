import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/Controller/food/fetch_all_restaurants_model.dart';
import 'package:user_app/Controller/food/menu_model.dart';
import 'package:user_app/widgets/constants/strings.dart';

class FoodController {
  static Future<Either<String, FetchAllRestaurantsModel>> fetchAllRestaurants({
    required BuildContext context,
  }) async {
    try {
      print("${AppStrings.fetchAllRestaurantsEndpoint}");
      final response =
          await http.get(Uri.parse(AppStrings.fetchAllRestaurantsEndpoint));
      final jsonResponse = jsonDecode(response.body);
      if ((response.statusCode == 200 || response.statusCode == 201) &&
          (jsonResponse["restaurants"].length != 0) &&
          (jsonResponse["executed"] == true)) {
        final ordersModel = FetchAllRestaurantsModel.fromJson(jsonResponse);
        // return ordersModel;
        return Right(ordersModel);
      } else if ((response.statusCode == 200 || response.statusCode == 201) &&
              (jsonResponse["restaurants"].length == 0) ||
          (jsonResponse["executed"] == true)) {
        // context.showSnackBar(message: AppStrings.noItemsFound);
        return Left(AppStrings.noRestaurantsFound);
      } else if (response.statusCode == 404) {
        // context.showSnackBar(message: json.decode(response.body)['message']);
        return Left(json.decode(response.body)['message']);
      } else if (response.statusCode == 500) {
        // context.showSnackBar(message: json.decode(response.body)['message']);
        return Left(AppStrings.noRestaurantsFound);
      } else {
        // context.showSnackBar(message: AppStrings.failedToLoadOrderItems);
        return Left(AppStrings.failedToLoadOrderItems);
      }
    } catch (e) {
      // context.showSnackBar(message: AppStrings.serverError);
      return Left(AppStrings.serverError);
    }
  }

  static Future<Either<String, dynamic>> getMenuItems({
    required String uid,
    required BuildContext context,
    String? category,
    String? subCategory,
  }) async {
    try {
      print("${AppStrings.getMenuItemEndpoint}/$uid");
      final response = await http.post(
        Uri.parse("${AppStrings.getMenuItemEndpoint}/$uid").replace(
          queryParameters: {
            if (category != null) 'category': category,
            if (subCategory != null) 'subCategory': subCategory,
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        if (category == null && subCategory == null) {
          final menuModel = FullMenuModel.fromJson(jsonResponse);
          return Right(menuModel);
        } else if (category != null && subCategory == null) {
          final menuModel = CategoryMenuModel.fromJson(jsonResponse);
          return Right(menuModel);
        } else {
          final menuModel = SimpleMenuModel.fromJson(jsonResponse);
          return Right(menuModel);
        }
      } else if (response.statusCode == 404) {
        return Left(json.decode(response.body)['message']);
      } else {
        return Left(AppStrings.failedToLoadMenuItems);
      }
    } catch (e) {
      return Left(AppStrings.serverError);
    }
  }
}
