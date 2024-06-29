class FetchAllRestaurantsModel {
  FetchAllRestaurantsModel({
    this.message,
    this.executed,
    this.restaurants,
  });

  FetchAllRestaurantsModel.fromJson(dynamic json) {
    message = json['message'];
    executed = json['executed'];
    if (json['restaurants'] != null) {
      restaurants = [];
      json['restaurants'].forEach((v) {
        restaurants?.add(Restaurants.fromJson(v));
      });
    }
  }
  String? message;
  bool? executed;
  List<Restaurants>? restaurants;
  FetchAllRestaurantsModel copyWith({
    String? message,
    bool? executed,
    List<Restaurants>? restaurants,
  }) =>
      FetchAllRestaurantsModel(
        message: message ?? this.message,
        executed: executed ?? this.executed,
        restaurants: restaurants ?? this.restaurants,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['executed'] = executed;
    if (restaurants != null) {
      map['restaurants'] = restaurants?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Restaurants {
  Restaurants({
    this.id,
    this.nukkadName,
    this.nukkadAddress,
    this.latitude,
    this.longitude,
    this.pincode,
    this.city,
    this.landmark,
    this.phoneNumber,
    this.ownerPhoto,
    this.ownerEmail,
    this.ownerName,
    this.ownerContactNumber,
    this.currentAddress,
    this.permananetAddress,
    this.referred,
    this.signature,
    this.bankDetails,
    this.fssaiDetails,
    this.gstDetails,
    this.kycDetails,
    this.cuisines,
    this.operationalHours,
    this.restaurantMenuImages,
    this.restaurantImages,
    this.foodImages,
    this.status,
  });

  Restaurants.fromJson(dynamic json) {
    id = json['_id'];
    nukkadName = json['nukkadName'];
    nukkadAddress = json['nukkadAddress'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    pincode = json['pincode'];
    city = json['city'];
    landmark = json['landmark'];
    phoneNumber = json['phoneNumber'];
    ownerPhoto = json['ownerPhoto'];
    ownerEmail = json['ownerEmail'];
    ownerName = json['ownerName'];
    ownerContactNumber = json['ownerContactNumber'];
    currentAddress = json['currentAddress'];
    permananetAddress = json['permananetAddress'];
    referred = json['referred'];
    signature = json['signature'];
    bankDetails = json['bankDetails'] != null
        ? BankDetails.fromJson(json['bankDetails'])
        : null;
    fssaiDetails = json['fssaiDetails'] != null
        ? FssaiDetails.fromJson(json['fssaiDetails'])
        : null;
    gstDetails = json['gstDetails'] != null
        ? GstDetails.fromJson(json['gstDetails'])
        : null;
    kycDetails = json['kycDetails'] != null
        ? KycDetails.fromJson(json['kycDetails'])
        : null;
    cuisines = json['cuisines'] != null ? json['cuisines'].cast<String>() : [];
    operationalHours = json['operationalHours'] != null
        ? OperationalHours.fromJson(json['operationalHours'])
        : null;
    restaurantMenuImages = json['restaurantMenuImages'] != null
        ? json['restaurantMenuImages'].cast<String>()
        : [];
    restaurantImages = json['restaurantImages'] != null
        ? json['restaurantImages'].cast<String>()
        : [];
    foodImages =
        json['foodImages'] != null ? json['foodImages'].cast<String>() : [];
    status = json['status'];
  }
  String? id;
  String? nukkadName;
  String? nukkadAddress;
  num? latitude;
  num? longitude;
  String? pincode;
  String? city;
  String? landmark;
  String? phoneNumber;
  String? ownerPhoto;
  String? ownerEmail;
  String? ownerName;
  String? ownerContactNumber;
  String? currentAddress;
  String? permananetAddress;
  String? referred;
  String? signature;
  BankDetails? bankDetails;
  FssaiDetails? fssaiDetails;
  GstDetails? gstDetails;
  KycDetails? kycDetails;
  List<String>? cuisines;
  OperationalHours? operationalHours;
  List<String>? restaurantMenuImages;
  List<String>? restaurantImages;
  List<String>? foodImages;
  String? status;
  Restaurants copyWith({
    String? id,
    String? nukkadName,
    String? nukkadAddress,
    num? latitude,
    num? longitude,
    String? pincode,
    String? city,
    String? landmark,
    String? phoneNumber,
    String? ownerPhoto,
    String? ownerEmail,
    String? ownerName,
    String? ownerContactNumber,
    String? currentAddress,
    String? permananetAddress,
    String? referred,
    String? signature,
    BankDetails? bankDetails,
    FssaiDetails? fssaiDetails,
    GstDetails? gstDetails,
    KycDetails? kycDetails,
    List<String>? cuisines,
    OperationalHours? operationalHours,
    List<String>? restaurantMenuImages,
    List<String>? restaurantImages,
    List<String>? foodImages,
    String? status,
  }) =>
      Restaurants(
        id: id ?? this.id,
        nukkadName: nukkadName ?? this.nukkadName,
        nukkadAddress: nukkadAddress ?? this.nukkadAddress,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        pincode: pincode ?? this.pincode,
        city: city ?? this.city,
        landmark: landmark ?? this.landmark,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        ownerPhoto: ownerPhoto ?? this.ownerPhoto,
        ownerEmail: ownerEmail ?? this.ownerEmail,
        ownerName: ownerName ?? this.ownerName,
        ownerContactNumber: ownerContactNumber ?? this.ownerContactNumber,
        currentAddress: currentAddress ?? this.currentAddress,
        permananetAddress: permananetAddress ?? this.permananetAddress,
        referred: referred ?? this.referred,
        signature: signature ?? this.signature,
        bankDetails: bankDetails ?? this.bankDetails,
        fssaiDetails: fssaiDetails ?? this.fssaiDetails,
        gstDetails: gstDetails ?? this.gstDetails,
        kycDetails: kycDetails ?? this.kycDetails,
        cuisines: cuisines ?? this.cuisines,
        operationalHours: operationalHours ?? this.operationalHours,
        restaurantMenuImages: restaurantMenuImages ?? this.restaurantMenuImages,
        restaurantImages: restaurantImages ?? this.restaurantImages,
        foodImages: foodImages ?? this.foodImages,
        status: status ?? this.status,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['nukkadName'] = nukkadName;
    map['nukkadAddress'] = nukkadAddress;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['pincode'] = pincode;
    map['city'] = city;
    map['landmark'] = landmark;
    map['phoneNumber'] = phoneNumber;
    map['ownerPhoto'] = ownerPhoto;
    map['ownerEmail'] = ownerEmail;
    map['ownerName'] = ownerName;
    map['ownerContactNumber'] = ownerContactNumber;
    map['currentAddress'] = currentAddress;
    map['permananetAddress'] = permananetAddress;
    map['referred'] = referred;
    map['signature'] = signature;
    if (bankDetails != null) {
      map['bankDetails'] = bankDetails?.toJson();
    }
    if (fssaiDetails != null) {
      map['fssaiDetails'] = fssaiDetails?.toJson();
    }
    if (gstDetails != null) {
      map['gstDetails'] = gstDetails?.toJson();
    }
    if (kycDetails != null) {
      map['kycDetails'] = kycDetails?.toJson();
    }
    map['cuisines'] = cuisines;
    if (operationalHours != null) {
      map['operationalHours'] = operationalHours?.toJson();
    }
    map['restaurantMenuImages'] = restaurantMenuImages;
    map['restaurantImages'] = restaurantImages;
    map['foodImages'] = foodImages;
    map['status'] = status;
    return map;
  }
}

class OperationalHours {
  OperationalHours({
    this.monday,
    this.wednesday,
    this.thursday,
  });

  OperationalHours.fromJson(dynamic json) {
    monday = json['Monday'];
    wednesday = json['Wednesday'];
    thursday = json['Thursday'];
  }
  String? monday;
  String? wednesday;
  String? thursday;
  OperationalHours copyWith({
    String? monday,
    String? wednesday,
    String? thursday,
  }) =>
      OperationalHours(
        monday: monday ?? this.monday,
        wednesday: wednesday ?? this.wednesday,
        thursday: thursday ?? this.thursday,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Monday'] = monday;
    map['Wednesday'] = wednesday;
    map['Thursday'] = thursday;
    return map;
  }
}

class KycDetails {
  KycDetails({
    this.aadhar,
    this.pan,
  });

  KycDetails.fromJson(dynamic json) {
    aadhar = json['aadhar'];
    pan = json['pan'];
  }
  String? aadhar;
  String? pan;
  KycDetails copyWith({
    String? aadhar,
    String? pan,
  }) =>
      KycDetails(
        aadhar: aadhar ?? this.aadhar,
        pan: pan ?? this.pan,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aadhar'] = aadhar;
    map['pan'] = pan;
    return map;
  }
}

class GstDetails {
  GstDetails({
    this.gstNumber,
    this.gstCertificate,
  });

  GstDetails.fromJson(dynamic json) {
    gstNumber = json['gstNumber'];
    gstCertificate = json['gstCertificate'];
  }
  String? gstNumber;
  String? gstCertificate;
  GstDetails copyWith({
    String? gstNumber,
    String? gstCertificate,
  }) =>
      GstDetails(
        gstNumber: gstNumber ?? this.gstNumber,
        gstCertificate: gstCertificate ?? this.gstCertificate,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gstNumber'] = gstNumber;
    map['gstCertificate'] = gstCertificate;
    return map;
  }
}

class FssaiDetails {
  FssaiDetails({
    this.certificateNumber,
    this.expiryDate,
    this.certificate,
  });

  FssaiDetails.fromJson(dynamic json) {
    certificateNumber = json['certificateNumber'];
    expiryDate = json['expiryDate'];
    certificate = json['certificate'];
  }
  String? certificateNumber;
  String? expiryDate;
  String? certificate;
  FssaiDetails copyWith({
    String? certificateNumber,
    String? expiryDate,
    String? certificate,
  }) =>
      FssaiDetails(
        certificateNumber: certificateNumber ?? this.certificateNumber,
        expiryDate: expiryDate ?? this.expiryDate,
        certificate: certificate ?? this.certificate,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['certificateNumber'] = certificateNumber;
    map['expiryDate'] = expiryDate;
    map['certificate'] = certificate;
    return map;
  }
}

class BankDetails {
  BankDetails({
    this.accountNo,
    this.iFSCcode,
    this.bankBranch,
  });

  BankDetails.fromJson(dynamic json) {
    accountNo = json['accountNo'];
    iFSCcode = json['IFSCcode'];
    bankBranch = json['bankBranch'];
  }
  String? accountNo;
  String? iFSCcode;
  String? bankBranch;
  BankDetails copyWith({
    String? accountNo,
    String? iFSCcode,
    String? bankBranch,
  }) =>
      BankDetails(
        accountNo: accountNo ?? this.accountNo,
        iFSCcode: iFSCcode ?? this.iFSCcode,
        bankBranch: bankBranch ?? this.bankBranch,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accountNo'] = accountNo;
    map['IFSCcode'] = iFSCcode;
    map['bankBranch'] = bankBranch;
    return map;
  }
}
