import 'dart:convert';
// import 'dart:developer' as dev;
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class PhonePePG {
  var result = "";
  String environment = "UAT_SIM";
  // String environment = "PRODUCTION";
  String appId = "null";
  // String merchantId = "PHONEPEPGUAT8";
  String merchantId = "PHONEPEPGUAT8";
  bool enableLogging = true;
  //
  String callbackUrl = "https://infonexus.in/phonepe/payment/callback";
  String endpoint = "/pg/v1/pay";

  String body = "";
  String checksum = "";

  // String saltKey = "aeed1568-1a76-4fa4-9f47-3e1c81232660";
  String saltKey = "aeed1568-1a76-4fa4-9f47-3e1c81232660";
  String saltIndex = "1";
  bool isInitialised = false;
  static late PhonePePG? _instance = null;

  PhonePePG get getInstance {
    _instance ??= PhonePePG();
    return _instance!;
  }

  // static getInstance() {
  //   if (instance == null) {
  //     instance = PhonePePG();
  //   }

  //   return instance;
  // }

  Future<bool> startPGTransaction(
    BuildContext context,
    String amount,
    int userId,
    String phone,
  ) async {
    if (!isInitialised) {
      return await phonePeInit(context).then((value) async {
        if (value) {
          return await startPGTransaction(context, amount, userId, phone);
        } else {
          return Future.value(false);
        }
      });
    } else {
      body = getChecksum(amount, userId, phone);
      try {
        return await PhonePePaymentSdk.startTransaction(
                body, callbackUrl, checksum, "")
            .then((val) {
          bool isSuccess = false;
          if (val != null) {
            String status = val["status"].toString();
            String error = val["error"].toString();

            if (status == "SUCCESS") {
              result = "Flow Complete status -Success";
              isSuccess = true;
            } else {
              result = "Flow Complete status - $status & error - $error";
              isSuccess = false;
            }
          } else {
            result = "Flow Imcomplete";
            isSuccess = false;
          }
          return isSuccess;
        }).catchError((error) {
          handleError(error);
          return Future.value(false);
        });
      } catch (error) {
        handleError(error);
        return Future.value(false);
      }
    }
    // return Future.value(false);
  }

  void handleError(error) {}

  Future<bool> phonePeInit(BuildContext context) async {
    return await PhonePePaymentSdk.init(
            environment, appId, merchantId, enableLogging)
        .then((value) {
      isInitialised = value;
      // PhonePePaymentSdk.getPackageSignatureForAndroid().then((value) {
      //   if (value != null) {
      //     print("ANDROID SIGNATURE: " + value);
      //     dev.log("ANDROID SIGNATURE: " + value);
      //   }
      //   Utils.globalWarningDialog(
      //       context, 'Signature', value!.toString(), true, false, '');
      // });
      return value;
    }).catchError((error) {
      return Future.value(false);
    });
  }

  String getChecksum(String amount, int userId, String phone) {
    var _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    var transactionId = String.fromCharCodes(Iterable.generate(
        15, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

    final reqData = {
      "merchantId": merchantId,
      "merchantTransactionId": transactionId,
      "merchantUserId": userId,
      "amount": double.parse(amount) * 100,
      "mobileNumber": phone,
      "callbackUrl": callbackUrl,
      "paymentInstrument": {"type": "PAY_PAGE"},
    };
    String base64Body = base64.encode(utf8.encode(json.encode(reqData)));
    checksum =
        "${sha256.convert(utf8.encode(base64Body + endpoint + saltKey)).toString()}###$saltIndex";

    return base64Body;
  }
}
