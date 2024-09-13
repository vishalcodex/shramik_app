import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../home/controllers/home_controller.dart';

// ignore: must_be_immutable
class MyProfileScreen extends GetView<HomeController> {
  MyProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
          child: Scaffold(
        backgroundColor: ColorPallete.theme,
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(50.0 * fem),
        //   child: CustomAppBar(
        //     pageName: "My Profile",
        //     onBackPressed: () {
        //       Get.back();
        //     },
        //   ),
        // ),
        body: SingleChildScrollView(child: Obx(
          () {
            return Container(
                height: 550 * fem,
                padding: EdgeInsets.all(20 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10 * fem,
                    ),
                    // NAME
                    Container(
                      // frame778391C (277:29591)
                      // margin: EdgeInsets.fromLTRB(
                      //     0 * fem, 0 * fem, 1 * fem, 13 * fem),
                      padding: EdgeInsets.symmetric(
                          horizontal: 70 * fem, vertical: 35 * fem),
                      width: 320 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xfffafaff),
                        borderRadius: BorderRadius.circular(20 * fem),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   width: double.infinity,
                          //   height: 80 * fem,
                          //   child: Stack(
                          //     alignment: Alignment.center,
                          //     children: [
                          //       Positioned(
                          //         child: Container(
                          //           width: 70 * fem,
                          //           height: 70 * fem,
                          //           clipBehavior: Clip.antiAliasWithSaveLayer,
                          //           decoration: BoxDecoration(
                          //               border: Border.all(
                          //                   color: ColorPallete.primaryAccent,
                          //                   width: 3 * fem),
                          //               borderRadius:
                          //                   BorderRadius.circular(50 * fem)),
                          //           child: controller.user.value.image != null
                          //               ? Container(
                          //                   clipBehavior:
                          //                       Clip.antiAliasWithSaveLayer,
                          //                   decoration: BoxDecoration(
                          //                       borderRadius:
                          //                           BorderRadius.circular(
                          //                               50 * fem)),
                          //                   child: Image.network(
                          //                     width: 120 * fem,
                          //                     height: 80 * fem,
                          //                     (controller.user.value.image!),
                          //                     fit: BoxFit.cover,
                          //                   ),
                          //                 )
                          //               : const Center(
                          //                   child: TextView(
                          //                     text: "OM",
                          //                     fontSize: 24,
                          //                     weight: FontWeight.w600,
                          //                     color: ColorPallete.primaryAccent,
                          //                   ),
                          //                 ),
                          //         ),
                          //       ),
                          //       Positioned(
                          //         // ellipse95Eyg (277:29595)
                          //         right: 50 * fem,
                          //         top: 50 * fem,
                          //         child: ImageInput(
                          //           callback: (img) {
                          //             controller.user.value.image = img;
                          //             controller.updateUser();
                          //             // controller.update();
                          //           },
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 10 * fem,
                          // ),
                          // Container(
                          //   // frame2608882kKk (277:29607)
                          //   width: double.infinity,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //     children: [
                          //       Container(
                          //           // color: Colors.red,
                          //           // hassaankhan578 (277:29601)

                          //           child: const TextView(text: "")),
                          //       SizedBox(
                          //         height: 5 * fem,
                          //       ),
                          //       // TextView(
                          //       //   text: '${controller.user.value.id} (ID)',
                          //       //   alignment: TextAlign.center,
                          //       //   fontSize: 14,
                          //       //   color: ColorPallete.primary,
                          //       // )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30 * fem,
                    ),
                    // MOBILE
                    // if (controller.user.value.phoneNumber != null &&
                    //     controller.user.value.phoneNumber != "")
                    Container(
                      // color: Colors.yellow,
                      height: 50 * fem,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 30 * fem,
                              height: 30 * fem,
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: ColorPallete.primary.withOpacity(0.2),
                                borderRadius: BorderRadius.circular((5 * fem)),
                              ),
                              child: const Icon(
                                Icons.phone,
                                color: ColorPallete.primary,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10 * fem,
                          ),
                          const Expanded(
                            child: RoundedContainer(
                              radius: 0,
                              child: TextView(
                                text: "Mobile",
                                fontSize: 16,
                                weight: FontWeight.w600,
                                color: ColorPallete.primary,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10 * fem),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const RoundedContainer(
                                  radius: 0,
                                  child: TextView(
                                    text: "+91 9969383542",
                                    alignment: TextAlign.right,
                                    fontSize: 14,
                                    color: ColorPallete.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 10 * fem,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10 * fem,
                    ),
                    // EMAIL

                    Container(
                      // color: Colors.yellow,
                      height: 50 * fem,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 30 * fem,
                              height: 30 * fem,
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: ColorPallete.primary.withOpacity(0.2),
                                borderRadius: BorderRadius.circular((5 * fem)),
                              ),
                              child: const Icon(
                                Icons.email,
                                color: ColorPallete.primary,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10 * fem,
                          ),
                          const Expanded(
                            child: RoundedContainer(
                              radius: 0,
                              child: TextView(
                                text: "Email",
                                fontSize: 16,
                                weight: FontWeight.w600,
                                color: ColorPallete.primary,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10 * fem),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const RoundedContainer(
                                  radius: 0,
                                  child: TextView(
                                    text: "karomhatre@gmail.com",
                                    alignment: TextAlign.right,
                                    fontSize: 14,
                                    color: ColorPallete.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 10 * fem,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ));
          },
        )),
      )),
    );
  }

  String getInitials(String name) {
    String initials = "";
    if (name != "") {
      var names = name.split(" ");
      int numWords = 2;
      if (numWords < names.length) {
        numWords = names.length;
      }
      for (var i = 0; i < numWords; i++) {
        initials += '${names[i][0]}';
      }
    }
    return initials;
  }
}
