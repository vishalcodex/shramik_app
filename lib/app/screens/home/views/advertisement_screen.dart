import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/ads_model.dart';

class AdvertisementScreen extends StatelessWidget {
  const AdvertisementScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    Ads ad = Get.arguments;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 50 * fem),
        child: CustomAppBar(pageName: "Advertising"),
      ),
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0 * fem),
          child: Column(
            children: [
              RoundedContainer(
                  radius: 15,
                  height: 150,
                  width: double.infinity,
                  clip: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                    ad.image.toString(),
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: 20 * fem,
              ),
              RoundedContainer(
                radius: 0,
                child: TextView(
                  text: ad.title.toString(),
                  color: ColorPallete.secondary,
                  fontSize: 18,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10 * fem,
              ),
              RoundedContainer(
                radius: 0,
                child: TextView(
                  text: ad.description.toString(),
                  fontSize: 14,
                  color: ColorPallete.secondary,
                  alignment: TextAlign.justify,
                ),
              ),
              const Spacer(),
              // InkWell(
              //   onTap: () {
              //     Get.back();
              //   },
              //   child: RoundedContainer(
              //     radius: 10,
              //     color: ColorPallete.primary,
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
              //       child: const Center(
              //           child: TextView(
              //         text: "Visit Advertiser's",
              //         color: ColorPallete.theme,
              //         fontSize: 16,
              //       )),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
