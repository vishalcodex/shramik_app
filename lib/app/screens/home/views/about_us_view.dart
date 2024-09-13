import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class AboutUsView extends GetView<HomeController> {
  const AboutUsView({Key? key}) : super(key: key);
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
                          padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 10 * fem,
                              ),
                              // const RoundedContainer(
                              //   radius: 15,
                              //   height: 150,
                              //   color: ColorPallete.disableGrey,
                              // ),
                              // SizedBox(
                              //   height: 10 * fem,
                              // ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              const TextView(
                                text: "लोकशाही पाठशाळा",
                                // color: ColorPallete.secondary,
                                alignment: TextAlign.center,
                                fontSize: 18,
                              ),
                              SizedBox(
                                height: 15 * fem,
                              ),
                              const TextView(
                                text:
                                    "     आपल्या लोकशाहीचा पाया आपल्या संविधानावर रचलेला आहे. संविधानीक मूल्याची जपवणूक करून लोकशाही समृध्द करण्यासाठी योग्य व्यासपीठ निर्माण करणे गरजेचे आहे. लोकसहभागातून जागृत नागरी नेतृत्व तयार करण्यासाठी लोकशाही पाठशाळा हे ऑनलाईन व ऑफलाईन व्यासपीठ निर्माण करीत आहोत. ",
                                // color: ColorPallete.secondary,
                                alignment: TextAlign.justify,
                                fontSize: 16,
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              const TextView(
                                text:
                                    "     लोकशाही पाठशाळा व्यासपीठावर संविधान, शासन व्यवस्था, शहरी - ग्रामीण विकास, आदिवासी विकास आदी विविध प्रकारची माहिती व प्रशिक्षण तज्ञ व्यक्तीद्वारे दिले जाणार आहे. महाराष्ट्रतील व देशातील लाखो तरुणानी सामाजिक मूल्याचा व संविधानाचा आदर्श समोर ठेवून राजकारणात कृतिशील, प्रभावी व सक्रिय सहभाग घ्यावा यासाठी सदर व्यासपीठ कार्य करणार आहे. आपण यामध्ये सहभाग घ्यावा, इतरांनी आपल्या अनुभवाच्या आधारे इतरांनाही जोडावे व त्याद्वारे समृध्द, संविधानाला मानणारा स समाज तयार करण्यास पुढाकार घ्यावा.",
                                // color: ColorPallete.secondary,
                                alignment: TextAlign.justify,
                                fontSize: 16,
                              ),
                              SizedBox(
                                height: 10 * fem,
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
}
