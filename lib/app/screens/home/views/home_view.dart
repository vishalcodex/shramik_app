import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          // appBar: PreferredSize(
          //     preferredSize: Size.fromHeight(50.0 * fem),
          //     child: CustomHomeAppBar(
          //       drawerContext: context,
          //       pageName: "",
          //     )),
          body: Obx(
            () => Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      controller.homeRefresh();
                      return Future.value();
                    },
                    child: MyListView(
                      scroll: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 10 * fem,
                              ),
                              _getImportantUpdates(controller, fem),
                              _buildCategories(controller, fem, context),
                              SizedBox(
                                height: 15 * fem,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getImportantUpdates(HomeController controller, double fem) {
    return MyListView(
      children: [
        const TextView(
          text: "Important Updates",
          color: ColorPallete.secondary,
          fontSize: 14,
          weight: FontWeight.bold,
        ),
        SizedBox(
          height: 10 * fem,
        ),
        controller.ads.isEmpty
            ? Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.white,
                child: const RoundedContainer(
                  radius: 10,
                  height: 175,
                  color: ColorPallete.grey,
                ),
              )
            : RoundedContainer(
                radius: 0,
                height: 175,
                child: PageView(
                  onPageChanged: (value) {
                    controller.selectedAd.value = value + 1;
                    controller.selectedAd.refresh();
                  },
                  children: controller.ads
                      .map((e) => InkWell(
                            onTap: () {
                              // Get.toNamed(Routes.ADVERTISEMENT, arguments: e);
                            },
                            child: RoundedContainer(
                              radius: 10,
                              clip: Clip.antiAliasWithSaveLayer,
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 0.5 * fem,
                                      blurRadius: 5 * fem,
                                      offset: Offset(0, 0 * fem),
                                      color: ColorPallete.grey.withOpacity(0.1))
                                ]),
                                child: Image.network(
                                  e.image!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
        SizedBox(
          height: 5 * fem,
        ),
        controller.ads.isEmpty
            ? Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.white,
                child: RoundedContainer(
                  radius: 0,
                  height: 7.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [1, 2, 3].map((element) {
                      bool isSelected = element == 1;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.5 * fem),
                        child: RoundedContainer(
                          color: isSelected
                              ? ColorPallete.grey
                              : ColorPallete.grey.withOpacity(0.5),
                          radius: 5,
                          height: 10,
                          width: isSelected ? 20 : 10,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            : RoundedContainer(
                radius: 0,
                height: 7.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.ads.map((element) {
                    bool isSelected = element.id == controller.selectedAd.value;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5 * fem),
                      child: RoundedContainer(
                        color: isSelected
                            ? ColorPallete.primary
                            : ColorPallete.grey.withOpacity(0.5),
                        radius: 5,
                        height: 10,
                        width: isSelected ? 20 : 10,
                      ),
                    );
                  }).toList(),
                ),
              ),
      ],
    );
  }

  _buildCategories(
      HomeController controller, double fem, BuildContext context) {
    return controller.categories.isEmpty
        ? Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.white,
            child: MyListView(
              children: [1, 2].map((category) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10 * fem),
                  child: RoundedContainer(
                    height: 120,
                    // color: ColorPallete.grey,
                    radius: 0,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            RoundedContainer(
                              radius: 5,
                              color: ColorPallete.grey,
                              width: 100,
                              height: 10,
                            ),
                            Spacer(),
                            TextView(
                              text: "Read More",
                              color: ColorPallete.grey,
                              weight: FontWeight.bold,
                              fontSize: 14,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 7.5 * fem,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: MyListView(
                                  isRow: true,
                                  scroll: true,
                                  children: [1, 2, 3]
                                      .map(
                                        (blog) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3 * fem),
                                          child: RoundedContainer(
                                            radius: 10,
                                            clip: Clip.antiAlias,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            color: ColorPallete.grey,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        : MyListView(
            children: controller.categories.map((category) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10 * fem),
                child: RoundedContainer(
                  height: 120,
                  // color: ColorPallete.grey,
                  radius: 0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextView(
                            text: category.catName!,
                            color: ColorPallete.secondary,
                            fontSize: 14,
                            weight: FontWeight.bold,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.BLOG,
                                  arguments: {"category": category});
                            },
                            child: const TextView(
                              text: "Read More",
                              color: ColorPallete.primary,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7.5 * fem,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: MyListView(
                                isRow: true,
                                scroll: true,
                                children: category.blogs!
                                    .map(
                                      (blog) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3 * fem),
                                        child: InkWell(
                                          onTap: () {
                                            Get.toNamed(Routes.BLOG_DETAILS,
                                                arguments: {"blog": blog});
                                          },
                                          child: RoundedContainer(
                                            radius: 10,
                                            clip: Clip.antiAlias,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            color: ColorPallete.primary
                                                .withOpacity(0.5),
                                            child: Image.network(
                                              blog.filename!,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          );
  }
}
