import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class ContactUsView extends GetView<HomeController> {
  const ContactUsView({Key? key}) : super(key: key);
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
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Column(
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
                          padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 10 * fem,
                              ),
                              RoundedContainer(
                                radius: 15,
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                // color: ColorPallete.disableGrey,
                                child: Image.asset(
                                  "assets/ui/logo.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              SizedBox(
                                height: 15 * fem,
                              ),
                              const RoundedContainer(
                                radius: 0,
                                child: TextView(
                                  text:
                                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.\n\n Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC.\n\n   This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where can I get some? There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                                  color: ColorPallete.secondary,
                                  fontSize: 14,
                                  alignment: TextAlign.justify,
                                ),
                              ),
                              // SizedBox(
                              //   height: 10 * fem,
                              // ),
                              // const RoundedContainer(
                              //   radius: 0,
                              //   child: TextView(
                              //     text: "Mr. Raju bhise",
                              //     // color: ColorPallete.secondary,
                              //     // alignment: TextAlign.center,
                              //     weight: FontWeight.bold,
                              //     fontSize: 16,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 25 * fem,
                              // ),
                              // const RoundedContainer(
                              //   radius: 0,
                              //   child: TextView(
                              //     text: "Address :",
                              //     color: ColorPallete.secondary,
                              //     fontSize: 14,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10 * fem,
                              // ),
                              // const RoundedContainer(
                              //   radius: 0,
                              //   child: TextView(
                              //     text:
                              //         "A 103, Dhanraj Apartment, Diwanman, Vasai West, Palghar 401208",
                              //     // color: ColorPallete.secondary,
                              //     // alignment: TextAlign.center,
                              //     weight: FontWeight.bold,
                              //     fontSize: 16,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 25 * fem,
                              // ),
                              // const RoundedContainer(
                              //   radius: 0,
                              //   child: TextView(
                              //     text: "Phone Number :",
                              //     color: ColorPallete.secondary,
                              //     fontSize: 14,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10 * fem,
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     final Uri telLaunchUri = Uri(
                              //       scheme: 'tel',
                              //       path: "+91 9960464430",
                              //     );
                              //     launchUrl(telLaunchUri);
                              //   },
                              //   child: const RoundedContainer(
                              //     radius: 0,
                              //     child: TextView(
                              //       text: "+91 99604 64430",
                              //       // color: ColorPallete.secondary,
                              //       // alignment: TextAlign.center,
                              //       weight: FontWeight.bold,
                              //       fontSize: 16,
                              //     ),
                              //   ),
                              // ),
                              // const RoundedContainer(
                              //   radius: 0,
                              //   height: 75,
                              //   child: Center(
                              //     child: TextView(
                              //       text: "Email Id",
                              //       color: ColorPallete.secondary,
                              //       fontSize: 16,
                              //     ),
                              //   ),
                              // ),
                              // const RoundedContainer(
                              //   radius: 0,
                              //   height: 75,
                              //   child: Center(
                              //     child: TextView(
                              //       text: "Whatsapp Number",
                              //       color: ColorPallete.secondary,
                              //       fontSize: 16,
                              //     ),
                              //   ),
                              // ),
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
}
