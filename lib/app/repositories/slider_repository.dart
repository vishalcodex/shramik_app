import 'package:get/get.dart';

import '../models/ads_model.dart';
import '../models/api_response.dart';
import '../providers/api_provider.dart';

class SliderRepository {
  late ApiProvider apiProvider;

  SliderRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchSliders() async {
    return await apiProvider.makeAPICall("GET", "banners", {}).then((value) {
      List<Ads> sliders = [];
      if (value.status == Status.COMPLETED) {
        // if (value.data["data"]) {
        // sliders = [
        //   {
        //     "id": "1",
        //     "image": "assets/images/Slider/slider1.jpeg",
        //     "title": "HDFC First Credit Card | Amazon Voucher",
        //     "description":
        //         "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
        //   },
        //   {
        //     "id": "2",
        //     "image": "assets/images/Slider/Slider2.jpg",
        //     "title": "HDFC First Credit Card | Amazon Voucher",
        //     "description":
        //         "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
        //   },
        //   {
        //     "id": "3",
        //     "image": "assets/images/Slider/Slider3.png",
        //     "title": "HDFC First Credit Card | Amazon Voucher",
        //     "description":
        //         "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
        //   },
        // ].map((e) => Ads.fromJson(e)).toList();
        // } else {
        sliders =
            (value.data["data"] as List).map((e) => Ads.fromJson(e)).toList();
        // }
      }
      value.data = sliders;
      return value;
    });
  }
}
