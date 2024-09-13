import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/color_pallete.dart';
import '../../routes/app_routes.dart';
import '../../screens/home/controllers/home_controller.dart';
import '../../services/auth_service.dart';
import 'my_list_view.dart';
import 'rounded_container.dart';
import 'text_view.dart';

class CustomDrawer extends GetView<HomeController> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Container(
      decoration: const BoxDecoration(
        color: ColorPallete.accent,
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(30 * fem),
        //     bottomLeft: Radius.circular(30 * fem)),
      ),
      height: double.infinity,
      width: baseWidth * 0.75 * fem,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10 * fem, horizontal: 15 * fem),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User

              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0 * fem, vertical: 2.5 * fem),
                      child: Icon(
                        Icons.close,
                        color: ColorPallete.secondary,
                        size: 25 * fem,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5 * fem,
              ),
              Image.asset(
                "assets/images/profile.png",
                height: 75 * fem,
              ),

              SizedBox(
                height: 10 * fem,
              ),
              TextView(
                text: controller.user.value.name!,
                color: ColorPallete.secondary,
                fontSize: 18,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 10 * fem,
              ),
              TextView(
                text: controller.user.value.email!,
                color: ColorPallete.secondary,
                fontSize: 14,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: 20 * fem,
              ),

              Expanded(
                child: MyListView(
                  scroll: true,
                  children: [
                    DrawerItem(
                      image: "assets/ui/home_icon.png",
                      title: "Home",
                      onPressed: () {
                        controller.setTabIndex.value = 0;
                      },
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                      image: "assets/ui/user.png",
                      title: "Profile",
                      onPressed: () {
                        Get.back();
                        Get.toNamed(Routes.SIGN_UP,
                            arguments: {"isLoggedIn": true});
                        // controller.setTabIndex.value = 1;
                      },
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                      image: "assets/ui/settings.png",
                      title: "About Us",
                      onPressed: () {
                        controller.setTabIndex.value = 2;
                      },
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                        image: "assets/ui/certificates.png",
                        title: "Terms & Conditions",
                        onPressed: () {}),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    // Divider(
                    //   thickness: 1 * fem,
                    //   height: 10 * fem,
                    //   color: ColorPallete.grey,
                    // ),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    DrawerItem(
                        image: "assets/ui/contact_us.png",
                        title: "Contact Us",
                        onPressed: () {}),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                        image: "assets/ui/events.png",
                        title: "Follow Us",
                        onPressed: () {}),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                        image: "assets/ui/settings.png",
                        title: "Change Language",
                        onPressed: () {
                          controller.showLanguagePopUp(context);
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    // DrawerItem(
                    //     image: "assets/ui/settings.png",
                    //     title: "FAQs",
                    //     onPressed: () {}),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                  ],
                ),
              ),

              SizedBox(
                height: 5 * fem,
              ),
              InkWell(
                onTap: () async {
                  await Get.find<AuthService>()
                      .removeCurrentUser()
                      .then((value) {
                    // Get.offAndToNamed(Routes.AUTH);
                    Get.offAllNamed(
                      Routes.SPLASH,
                      predicate: (route) => Get.currentRoute == "/splash",
                    );
                  });
                },
                child: RoundedContainer(
                  radius: 10 * fem,
                  color: ColorPallete.primary,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0 * fem),
                    child: const Center(
                      child: TextView(
                        text: "Log Out",
                        color: ColorPallete.theme,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String title;
  final Function() onPressed;
  const DrawerItem(
      {super.key,
      this.icon,
      this.image,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return InkWell(
      onTap: () {
        Get.back();
        onPressed();
        // controller.setTabIndex.value = 1;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.5 * fem),
        child: RoundedContainer(
          // height: 45,
          radius: 10,
          color: ColorPallete.primary.withOpacity(0.1),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 15.0 * fem, vertical: 7.5 * fem),
            child: Center(
              child: Row(
                children: [
                  if (image != null)
                    Image.asset(
                      image!,
                      color: ColorPallete.primary,
                      height: 25 * fem,
                    ),
                  SizedBox(
                    width: 10 * fem,
                  ),
                  Center(
                    child: TextView(
                      text: title,
                      fontSize: 14,
                      weight: FontWeight.w500,
                      color: ColorPallete.secondary,
                    ),
                  ),
                  const Spacer(),
                  Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      "assets/ui/back.png",
                      width: 25 * fem,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
