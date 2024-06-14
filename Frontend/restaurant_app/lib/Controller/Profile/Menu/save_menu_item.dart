class SaveMenuItem {
  SaveMenuItem({
    this.uid,
    this.category,
    this.subCategory,
    this.menuItem,
  });

  SaveMenuItem.fromJson(dynamic json) {
    uid = json['uid'];
    category = json['category'];
    subCategory = json['subCategory'];
    menuItem = json['menuItem'] != null
        ? SaveMenuItemModel.fromJson(json['menuItem'])
        : null;
  }
  String? uid;
  String? category;
  String? subCategory;
  SaveMenuItemModel? menuItem;
  SaveMenuItem copyWith({
    String? uid,
    String? category,
    String? subCategory,
    SaveMenuItemModel? menuItem,
  }) =>
      SaveMenuItem(
        uid: uid ?? this.uid,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        menuItem: menuItem ?? this.menuItem,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = uid;
    map['category'] = category;
    map['subCategory'] = subCategory;
    if (menuItem != null) {
      map['menuItem'] = menuItem?.toJson();
    }
    return map;
  }
}

class SaveMenuItemModel {
  String? menuItemName;
  dynamic menuItemImageURL;
  String? servingInfo;
  num? menuItemCost;
  bool? inStock;
  num? timeToPrepare;
  String? id;

  SaveMenuItemModel({
    this.menuItemName,
    this.menuItemImageURL,
    this.servingInfo,
    this.menuItemCost,
    this.inStock,
    this.timeToPrepare,
  });

  factory SaveMenuItemModel.fromJson(Map<String, dynamic> json) {
    return SaveMenuItemModel(
      menuItemName: json['menuItemName'] as String?,
      menuItemImageURL: json['menuItemImageURL'],
      servingInfo: json['servingInfo'] as String?,
      menuItemCost: json['menuItemCost'] as num?,
      inStock: json['inStock'] as bool?,
      timeToPrepare: json['timeToPrepare'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuItemName': menuItemName,
      'menuItemImageURL': menuItemImageURL,
      'servingInfo': servingInfo,
      'menuItemCost': menuItemCost,
      'inStock': inStock,
      'timeToPrepare': timeToPrepare,
    };
  }

  SaveMenuItemModel copyWith({
    String? menuItemName,
    dynamic menuItemImageURL,
    String? servingInfo,
    num? menuItemCost,
    bool? inStock,
    num? timeToPrepare,
  }) {
    return SaveMenuItemModel(
      menuItemName: menuItemName ?? this.menuItemName,
      menuItemImageURL: menuItemImageURL ?? this.menuItemImageURL,
      servingInfo: servingInfo ?? this.servingInfo,
      menuItemCost: menuItemCost ?? this.menuItemCost,
      inStock: inStock ?? this.inStock,
      timeToPrepare: timeToPrepare ?? this.timeToPrepare,
    );
  }
}