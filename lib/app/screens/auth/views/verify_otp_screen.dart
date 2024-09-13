import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../common/color_pallete.dart';
import '../../../../common/utils.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controller/auth_controller.dart';

class VerifyOTPScreen extends GetView<AuthController> {
  const VerifyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          resizeToAvoidBottomInset: true,
          body: Column(children: [
            Expanded(
              child: MyListView(
                scroll: true,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0 * fem, vertical: 20 * fem),
                    child: MyListView(
                      children: [
                        Image.asset(
                          "assets/ui/otp2.png",
                          height: MediaQuery.of(context).size.height * 0.30,
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        // const Center(
                        //   child: TextView(
                        //     text: "WELCOME",
                        //     color: ColorPallete.secondary,
                        //     fontSize: 18,
                        //     weight: FontWeight.bold,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20 * fem,
                        // ),
                        const Center(
                          child: TextView(
                            text:
                                "A 6-Digit OTP set to you phone number please enter otp to verify your phone number",
                            color: ColorPallete.secondary,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        RoundedContainer(
                          radius: 0,
                          // height: 50,
                          child: OTPTextField(
                            length: 6,
                            width: MediaQuery.of(context).size.width,
                            fieldWidth: 50 * fem,
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 25 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.5 * ffem / fem,
                              letterSpacing: -0.349999994 * fem,
                              color: ColorPallete.secondary,
                            ),
                            contentPadding: EdgeInsets.all(15 * fem),
                            // obscureText: true,
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.box,
                            otpFieldStyle: OtpFieldStyle(
                              borderColor: ColorPallete.greyContainer,
                              enabledBorderColor: ColorPallete.greyContainer,
                              backgroundColor: ColorPallete.greyContainer,
                              focusBorderColor: ColorPallete.greyContainer,
                            ),
                            onCompleted: (pin) {
                              controller.creds["otp"] = pin;
                            },
                            onChanged: (value) {
                              controller.creds["otp"] =
                                  value.length > 5 ? value : "";
                            },
                          ),
                        ),

                        SizedBox(
                          height: 20 * fem,
                        ),

                        InkWell(
                          onTap: () {
                            if (!controller.isLoading.value)
                              controller.verifyOTP();
                          },
                          child: RoundedContainer(
                            radius: 10,
                            height: 50,
                            color: ColorPallete.primary,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 10.0 * fem),
                              child: Obx(
                                () => controller.isLoading.value
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: ColorPallete.theme,
                                        ),
                                      )
                                    : const Center(
                                        child: TextView(
                                          text: "Verify OTP",
                                          fontSize: 16,
                                          color: ColorPallete.theme,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
