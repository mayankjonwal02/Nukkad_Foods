import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppStrings {
  //networking
  static const contentType = 'Content-Type';
  static const applicationJson = 'application/json; charset=UTF-8';
  // static const baseURL = "http://192.168.1.5:3000/api/";
  static String baseURL = "${dotenv.env['BASE_URL']}";
  static String loginEndpoint = "${baseURL}/auth/login";
  static String menuEndpoint = "${baseURL}/menu/";
  static String saveMenuItemEndpoint = "${menuEndpoint}/menu/saveMenuItem";
  static String getMenuItemEndpoint = "${menuEndpoint}/menu/getMenuItem";
  static String updateMenuItemEndpoint = "${menuEndpoint}/menu/updateMenuItem";
  static String deleteMenuItemEndpoint = "${menuEndpoint}/menu/deleteMenuItem";

  //categories api
  // static String deleteMenuItemEndpoint = "${menuEndpoint}/deleteMenuItem";
  // static String deleteMenuItemEndpoint = "${menuEndpoint}/deleteMenuItem";
  // static String deleteMenuItemEndpoint = "${menuEndpoint}/deleteMenuItem";
  // static String deleteMenuItemEndpoint = "${menuEndpoint}/deleteMenuItem";


  //errors
  static const loginError = 'Login failed';
  static const menuLoadError = "Menu items not found";
  static const serverError = "Server error. Please try again later.";
  static const other = "Other";
  static const failedToUpdateMenuItem = "Failed to update menu item.";
  static const failedToDeleteMenuItem = "Failed to delete menu item.";
  static const allFieldsRequired = "All Fields are required";
  static const failedToFetchCategories = "Failed to fetch categories";
  static const failedToAddSubCategory = "Failed to Add Sub categories";


  //shared preferences
  static const userId = "User_id";
  static const userInfo = "userInfo";

  //menu screen
  static const noItemsFound = "No Items Found";
  static const failedToLoadMenuItems = "Failed to load menu items.";
  static const List<String> subCategory = [
    'Veg',
    'Non-Veg',
    'Vegan',
    'Gluten-Free',
    'Dairy Free',
  ];

  //registration screen
  static const List<String> cuisinesList = [
    "Chinese",
    "Momos",
    "Mughlai",
    "Mexican",
    "Arabic",
    "Bihari",
    "North Indian",
    "Thai",
    "South Indian",
    "Chaat",
    "Italian",
    "Cakes",
    "Bakery",
    "Sweets",
    "Himachali",
    "Bengali",
    "Nepali",
    "Continental",
    "Hyderabadi",
    "Gujrati",
    "Maharastrian"
  ];

  static List<String> daysOfWeek = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
}