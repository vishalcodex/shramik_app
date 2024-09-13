import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/onBoard_model.dart';
import '../../../services/auth_service.dart';

class OnBoardingController extends GetxController {
  RxList<OnBoard> onboardsScreens = <OnBoard>[].obs;

  RxInt selectedIndex = 0.obs;
  RxString quote = "".obs;
  PageController pageController = PageController();
  // WidgetsToImageController widgetsToImageController =
  //     WidgetsToImageController();

  // late OnBoardRepository _onBoardRepository;

  OnBoardingController() {
    // _onBoardRepository = OnBoardRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchOnboardingScreens();
  }

  void onBoardingFinished() {
    Get.find<AuthService>().setOnBoarding(true);
  }

  void letsStart() {
    // Get.offAndToNamed(Routes.CHAT);
  }

  void fetchOnboardingScreens() async {
    onboardsScreens.assignAll([
      {
        "id": "0",
        "title": "Easy, Fast & Trusted",
        "description":
            "Fast money transfer and gauranted safe transaction with others.",
        "image": "assets/ui/onboard/onboard_1.png"
      },
      {
        "id": "1",
        "title": "Saving Your Money",
        "description":
            "Track the progress of your savings and start a habit of saving with Vasai Pragati.",
        "image": "assets/ui/onboard/onboard_2.png"
      },
      {
        "id": "2",
        "title": "VPIN Login",
        "description": "Safely Log in using VPIN on Vasai Pragati.",
        "image": "assets/ui/onboard/onboard_3.png"
      }
    ].map((e) => OnBoard.fromJson(e)).toList());
    onboardsScreens.refresh();
    // await _onBoardRepository.getAllOnboardScreens().then((value) {
    //   // onboardsScreens.assignAll(value.data as List<OnBoard>);
    // });
  }

  void fetchTodaysQuote() async {
    // DateFormat formatter = DateFormat('yyyy-MM-dd');
    // var day = await _box.read('quote_day') ?? 1;
    // var date = await _box.read('date');

    // date ??= await updateDate();
    // var today = formatter.format(DateTime.now());
    // // date = formatter.format(DateTime.parse(date));
    // var compare = DateTime.parse(date).difference(DateTime.parse(today)).inDays;
    // // Check if Previous date
    // if (compare < 0) {
    //   // day = day + 1;
    //   await updateDate();
    // }
    // await _box.write('quote_day', day);
    // print("Quote Day : ${day.toString()}");
    // await _onBoardRepository.fetchTodaysQuote(day).then((value) {
    //   quote.value = value.data as String;
    // });
    // await _box.write('day', day);
  }

  updateDate() async {
    // DateFormat formatter = DateFormat('yyyy-MM-dd');
    // var date = formatter.format(DateTime.now());
    // await _box.write("date", date);
    // return date;
  }

  saveImage(BuildContext context) async {
    // return await widgetsToImageController.capture().then((value) async {
    //   // var image = MemoryImage(value!);

    //   Map<Permission, PermissionStatus> statuses = await [
    //     Permission.storage,
    //     //add more permission to request here.
    //   ].request();

    //   if (statuses[Permission.storage]!.isGranted) {
    //     var dir = await DownloadsPathProvider.downloadsDirectory;
    //     if (dir != null) {
    //       String savename = "quote_of_the_day.jpeg";
    //       String savePath = dir.path + "/$savename";
    //       print(savePath);
    //       //output:  /storage/emulated/0/Download/banner.png
    //       await File(savePath).writeAsBytes(value!).then((value) {
    //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //             content:
    //                 Text("Image Saved to Downloads Folder Successfully!")));
    //       });

    //       // file.open();
    //     }
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text("Storage Permission Required")));
    //     // print("No permission to read and write.");
    //   }
    // });
  }
}
