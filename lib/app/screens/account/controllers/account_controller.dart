import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../views/my_profile.dart';

class AccountController extends GetxController {
  AccountController() {}

  bool fromRegister = false;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      fromRegister = Get.arguments["from_register"] ?? false;
    }
  }

  List<String> tabs = [
    "My Details",
    "RSD",
    "Preferences",
    "Bank Details",
    // "Notification settings",
    // "Languages",
    // "FAQs",
    // "Customer support"
  ];
  RxString selectedTab = "My Details".obs;

  Widget getSelectedTabView() {
    switch (selectedTab.value) {
      case "My Details":
        return MyProfileScreen();

      // case "RSD":
      //   return RSDScreen();
      // case "Preferences":
      //   return PreferencesScreen();

      // case "Bank Details":
      //   return BankAccountScreen();

      // case "Notification settings":
      //   break;
      // case "Languages":
      //   break;
      // case "FAQs":
      //   break;
      // case "Customer support":
      //   break;

      default:
        return MyProfileScreen();
    }
  }

  void onTabClicked(String tab) {
    switch (tab) {
      case "Profile":
        Get.offAndToNamed(Routes.MY_PROFILE);
        break;
      case "RSD & Adjustments":
        Get.toNamed(Routes.RSD);
        break;
      case "Preferences":
        Get.toNamed(Routes.PREFERENCES);
        break;
      case "Bank Details":
        Get.toNamed(Routes.BANK_ACCOUNT);
        break;
      case "Notification settings":
        break;
      case "Languages":
        break;
      case "FAQs":
        break;
      case "Customer support":
        break;

      default:
    }
  }

  // RSD

  RxList<Map<String, dynamic>> myRsds = <Map<String, dynamic>>[
    {
      "name": "AB RSD",
      "description": "RSD with AutoBazaar",
      "rsd_amt": "20000",
      "vehicle_limit": "20",
      "credit_limit": "20000000",
      "transactions": [
        {
          "vehicle_no": "MH FT1 589",
          "amt": "7,218.75",
          "status": "BID HOLD",
          "date": "October 12, 2023 at 8:34 PM"
        },
        {
          "vehicle_no": "MH FT1 589",
          "amt": "7,218.75",
          "status": "RELEASED",
          "date": "October 11, 2023 at 6:23 PM"
        },
      ]
    },
    {
      "name": "TATA RSD",
      "description": "RSD with TATA",
      "rsd_amt": "20000",
      "vehicle_limit": "20",
      "credit_limit": "20000000",
      "transactions": [
        {
          "vehicle_no": "MH FT1 589",
          "amt": "7,218.75",
          "status": "BID HOLD",
          "date": "October 12, 2023 at 8:34 PM"
        },
        {
          "vehicle_no": "MH FT1 589",
          "amt": "7,218.75",
          "status": "RELEASED",
          "date": "October 11, 2023 at 6:23 PM"
        },
      ]
    }
  ].obs;

  // PURCHASE RSD
  RxString selectedRsd = "".obs;
  List<Map<String, dynamic>> rsdList = [
    {
      "id": "1",
      "seller_type": "Bank",
      "rsd_amt": "10000",
      "vehicle_limit": "100",
      "credit_limit": "2000000"
    },
    {
      "id": "2",
      "seller_type": "Bank",
      "rsd_amt": "10000",
      "vehicle_limit": "100",
      "credit_limit": "2000000"
    },
    {
      "id": "3",
      "seller_type": "Bank",
      "rsd_amt": "10000",
      "vehicle_limit": "100",
      "credit_limit": "2000000"
    },
    {
      "id": "4",
      "seller_type": "Bank",
      "rsd_amt": "10000",
      "vehicle_limit": "100",
      "credit_limit": "2000000"
    },
    {
      "id": "5",
      "seller_type": "Bank",
      "rsd_amt": "10000",
      "vehicle_limit": "100",
      "credit_limit": "2000000"
    }
  ];

  RxBool isPaymentView = false.obs;
  void continueToPayment() {
    isPaymentView.value = true;
  }

  List<String> paymentOptions = ["UPI", "Credit/Debit Card"];
  RxString selectedPaymentOption = "UPI".obs;

  getSelectedPlanAmt() {
    var rsd =
        rsdList.firstWhere((element) => element["id"] == selectedRsd.value);
    return double.parse(rsd["rsd_amt"]);
  }

  void payNContinue() {
    isPaymentView.value = false;
    if (fromRegister) {
      Get.toNamed(Routes.PREFERENCES, arguments: {"from_register": true});
    } else {
      Get.back();
    }
  }

  //Preferences
  RxBool iDealAllBrands = false.obs;

  List<String> brands = [
    "Maruti",
    "KIA",
    "Tata",
    "Audi",
    "Suzuki",
    "Aston Martin",
    "Buggati",
    "Mahindra",
    "Hyundai",
    "Citron",
    "MG"
  ];

  RxList<String> selectedBrands = <String>[].obs;

  String getTotalAmount() {
    var amt = "0";
    if (selectedRsd.value != "") {
      amt = rsdList.firstWhere(
          (element) => element["id"] == selectedRsd.value)["rsd_amt"];
    }
    return amt.toString();
  }

  void toHome() {
    if (fromRegister) {
      fromRegister = false;
      Get.offAllNamed(
        Routes.HOME,
        predicate: (route) => Get.currentRoute == "/home",
      );
    } else {
      Get.back();
    }
  }

  void logout() {
    Get.find<AuthService>().removeCurrentUser();
    Get.offAndToNamed(Routes.AUTH);
  }
}
