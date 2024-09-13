import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/onBoard_model.dart';
import '../providers/api_provider.dart';

class OnBoardRepository {
  late ApiProvider apiProvider;

  OnBoardRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> getAllOnboardScreens() async {
    return await apiProvider.makeAPICall("GET", "slider/all", {}).then((value) {
      value.data = (value.data["data"] as List)
          .map((item) => OnBoard.fromJson(item))
          .toList();
      return value;
    });
  }

  Future<ApiResponse> fetchTodaysQuote(int day) async {
    return await apiProvider
        .makeAPICall("GET", "quote/get-next/${day}", {}).then((value) {
      value.data = value.data["text"];
      return value;
    });
  }
}
