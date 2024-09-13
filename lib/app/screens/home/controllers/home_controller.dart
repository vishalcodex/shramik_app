import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/ads_model.dart';
import '../../../models/api_response.dart';
import '../../../models/category_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/category_repository.dart';
import '../../../repositories/slider_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../membership/controllers/membership_controller.dart';
import '../../membership/views/membership_view.dart';
import '../views/contact_us_view.dart';
import '../views/home_view.dart';

class HomeController extends GetxController {
  Rx<User> user = User().obs;
  // User(
  //         name: "Omkar Mhatre",
  //         coins: 1500,
  //         happiness: 25,
  //         email: "karomhatre@gmail.com",
  //         phoneNumber: "+919969383542")
  //     .obs;

  RxInt setTabIndex = 0.obs;
  RxBool isLiveAuction = true.obs;
  RxBool showMoreOptions = false.obs;
  List<String> moreOptions = ["Profile", "Logout"];
  RxString itemView = "LIST".obs;

  late var scaffoldKey = GlobalKey<ScaffoldState>();
  late UserRepository _userRepository;
  late SliderRepository _sliderRepository;
  late CategoryRepository _categoryRepository;

  HomeController() {
    // Get.find<AuthService>().user.listen((updatedUser) {
    //   user.value = updatedUser;
    // });

    _userRepository = UserRepository();
    _sliderRepository = SliderRepository();
    _categoryRepository = CategoryRepository();
  }

  RxBool searchedClicked = false.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = false;

    user.value = Get.find<AuthService>().user.value;
    user.listen((updatedUser) {
      Get.find<AuthService>().user.value = updatedUser;
    });

    // if (Get.arguments != null) {
    //   setTabIndex.value = int.parse(Get.arguments["tabIndex"] as String);
    // }
    super.onInit();
    setTabIndex.listen((p0) {
      if (p0 == 1) {
        Get.find<MembershipController>().fetchData();
      }
    });

    homeRefresh();
  }

  // TABS
  final List bottomTabs = [
    {
      "title": "Home",
      "icon": "assets/ui/home_icon.png",
      "pos": "0",
      "view": const HomeView()
    },
    {
      "title": "Membership Card",
      "icon": "assets/ui/certificates.png",
      "pos": "1",
      "view": const MemebrshipScreen()
    },
    {
      "title": "Contact Us",
      "icon": "assets/ui/contact_us.png",
      "pos": "2",
      "view": const ContactUsView()
    },
    // {
    //   "title": "Alerts",
    //   "icon": "assets/ui/bell_notification_icon.png",
    //   "pos": "3",
    //   "view": Container()
    // },
    // {
    //   "title": "Settings",
    //   "icon": "assets/ui/setting_icon.png",
    //   "pos": "4",
    //   "view": Container()
    // }
  ];

  getTabScreen(index) {
    return bottomTabs[index]["view"];
  }

  void updateHome() async {
    // await _userRepository.fetchUser().then((value) {
    //   user.value = value;
    //   user.refresh();
    // });
  }

  void updateUser() async {
    await _userRepository.fetchUserDetails().then((value) {
      if (value.status == Status.COMPLETED) {
        user = User().obs;
        user.value = value.data;
        // user.value.membershipId = u0.membershipId;
        // user.value.balance = u0.balance;
        user.refresh();
      } else {
        Get.find<AuthService>().removeCurrentUser();
        Get.toNamed(Routes.AUTH);
      }
    });
  }

  DateFormat formater = DateFormat("dd/MM/yy");
  String getWeekDay(String date) {
    DateTime dateTime = formater.parse(date);
    return DateFormat("EEE").format(dateTime);
  }

  String getDate(String date) {
    DateTime dateTime = formater.parse(date);
    return DateFormat("d").format(dateTime);
  }

  RxList<Ads> ads = <Ads>[].obs;
  RxInt selectedAd = 1.obs;

  RxBool isGridView = true.obs;

  void homeRefresh() async {
    // updateUser();
    fetchSliders();
    fetchCategories();
  }

  fetchSliders() async {
    ads.value = [];
    await _sliderRepository.fetchSliders().then((value) {
      if (value.data != []) {
        ads.value = value.data;
        selectedAd.value = ads.first.id!;
      } else {}
      ads.refresh();
    });
  }

  RxList<Category> categories = <Category>[].obs;

  Rx<Category> selectedCategory = Category().obs;
  fetchCategories() async {
    categories.value = [];
    await _categoryRepository.fetchCategories().then((value) {
      // if (value.data != []) {
      categories.value = value.data;
      // } else {}
      categories.refresh();
    });
  }

  void goToService(Category element) {
    selectedCategory = Category().obs;
    selectedCategory.value = element;
    selectedCategory.refresh();
    Get.toNamed(Routes.BLOG, arguments: {"category": selectedCategory.value});
  }

  void showLanguagePopUp(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyListView(
              children: [
                const Center(
                  child: TextView(
                    text: "Choose Language",
                    color: ColorPallete.primary,
                    fontSize: 16,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15 * fem,
                ),
                SizedBox(
                  height: 100 * fem,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Get.updateLocale(const Locale("en", "EN"));
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/ui/english.png",
                                height: 80 * fem,
                                width: 80 * fem,
                                color: Color(0xff6e61b7),
                              ),
                              const Spacer(),
                              const Center(
                                child: TextView(
                                  text: "English",
                                  color: ColorPallete.primary,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Get.updateLocale(const Locale("mr", "MAR"));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    "assets/ui/marathi.png",
                                    height: 65 * fem,
                                    width: 65 * fem,
                                    // color: Color(0xff6e61b7),
                                  ),
                                ),
                              ),
                              const Center(
                                child: TextView(
                                  text: "Marathi",
                                  color: ColorPallete.primary,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
