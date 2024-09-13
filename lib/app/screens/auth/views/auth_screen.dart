import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../controller/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    // controller.showPassword.value = false;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
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
                          "assets/ui/otp1.jpg",
                          height: MediaQuery.of(context).size.height * 0.30,
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        const Center(
                          child: TextView(
                            text: "WELCOME",
                            color: ColorPallete.secondary,
                            fontSize: 18,
                            weight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        const Center(
                          child: TextView(
                            text: "Enter Your Number To Continue",
                            color: ColorPallete.secondary,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          cursorColor: ColorPallete.secondary,
                          decoration: InputDecoration().copyWith(
                            labelText: 'Phone Number',
                            labelStyle: const TextStyle(
                                fontSize: 14, color: ColorPallete.secondary),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPallete.secondary),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPallete.secondary),
                            ),
                          ),
                          onChanged: (value) {
                            // if (controller.emailValidation.hasMatch(value)) {
                            //   controller.errorMessage.value = "";
                            //   controller.creds["email"] = value;
                            // } else {
                            //   controller.errorMessage.value = "Invalid Email";
                            // }
                            controller.user.value.phoneNumber = value;
                          },
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                          child: const TextView(
                            text:
                                "A Six Digit OTP will be sent to your Phone to verify your Phone Number",
                            color: ColorPallete.secondary,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 20 * fem,
                        ),
                        InkWell(
                          onTap: () {
                            if (!controller.isLoading.value)
                              controller.sendOTP();
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
                                          text: "Send An OTP",
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

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = ColorPallete.primary;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.10);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.50);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
