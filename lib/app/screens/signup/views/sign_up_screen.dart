import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shramik/app/screens/signup/widgets/scheme_details_form.dart';
import '../widgets/family_details_form.dart';
import '../widgets/personal_details_form.dart';
import '../widgets/political_details_form.dart';
import '../widgets/working_details_form.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/sign_up_controller.dart';
import '../widgets/my_stepper.dart';

// ignore: must_be_immutable
class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          resizeToAvoidBottomInset: true,
          body: WillPopScope(
            onWillPop: () {
              if (controller.selectedTile.value == 1) {
                return Future.value(true);
              } else {
                controller.selectedTile.value =
                    controller.selectedTile.value - 1;
                controller.selectedTile.refresh();
              }
              return Future.value(false);
            },
            child: Obx(
              () => Column(
                children: [
                  SizedBox(
                    height: 20 * fem,
                  ),
                  Center(
                    child: TextView(
                      text: controller.isAuthenticated.value
                          ? "Update Profile Details"
                          : "Register Account",
                      color: ColorPallete.secondary,
                      fontSize: 22,
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30 * fem,
                  ),
                  MyStepper(
                      currentStep: controller.selectedTile.value - 1,
                      labels: controller.stepsLabel),
                  Expanded(
                      child: controller.selectedTile.value == 1
                          ? PersonalDetailsForm()
                          : controller.selectedTile.value == 2
                              ? PoliticalDetailsForm()
                              : controller.selectedTile.value == 3
                                  ? WorkingDetailsForm()
                                  : controller.selectedTile.value == 4
                                      ? FamilyDetailsForm()
                                      : SchemeDetailsForm()),
                  Padding(
                    padding: EdgeInsets.all(10.0 * fem),
                    child: InkWell(
                      onTap: () {
                        if (!controller.isLoading.value) {
                          controller.validateAndContinue(context);
                        }
                      },
                      child: RoundedContainer(
                        radius: 10,
                        height: 50,
                        color: ColorPallete.primary,
                        child: controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: ColorPallete.theme,
                                ),
                              )
                            : Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 15.0 * fem),
                                child: Center(
                                  child: TextView(
                                    text: controller.selectedTile.value > 3
                                        ? "Submit"
                                        : "Next",
                                    color: ColorPallete.theme,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                      ),
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
