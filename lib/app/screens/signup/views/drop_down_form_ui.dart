import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_field.dart';
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
                return Future.value(false);
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
                  Expanded(
                    child: MyListView(
                      scroll: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.5 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 20 * fem,
                              ),
                              const Center(
                                child: TextView(
                                  text: "Register Account",
                                  color: ColorPallete.secondary,
                                  fontSize: 22,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 30 * fem,
                              ),
                              MyStepper(
                                  currentStep:
                                      controller.selectedTile.value - 1,
                                  labels: controller.stepsLabel),
                              Form(
                                key: controller.personalDetailsFormKey,
                                child: ExpansionTile(
                                  controller: controller
                                      .expansionTileControllers
                                      .elementAt(0),
                                  initiallyExpanded:
                                      controller.selectedTile.value == 1,
                                  title: const TextView(
                                    text: "Personal Details",
                                    color: ColorPallete.secondary,
                                    fontSize: 18,
                                    weight: FontWeight.bold,
                                  ),
                                  children:
                                      controller.personalDetailsFields.map((e) {
                                    return TextFieldEntryWidget(
                                      fieldName: e,
                                      controller: controller,
                                    );
                                  }).toList(),
                                ),
                              ),
                              Form(
                                key: controller.politicalDetailsFormKey,
                                child: ExpansionTile(
                                  controller: controller
                                      .expansionTileControllers
                                      .elementAt(1),
                                  initiallyExpanded:
                                      controller.selectedTile.value == 2,
                                  title: const TextView(
                                    text: "Political Details",
                                    color: ColorPallete.secondary,
                                    fontSize: 18,
                                    weight: FontWeight.bold,
                                  ),
                                  children: controller.politicalDetailsFields
                                      .map((e) {
                                    return TextFieldEntryWidget(
                                      fieldName: e,
                                      controller: controller,
                                    );
                                  }).toList(),
                                ),
                              ),
                              Form(
                                key: controller.workingDetailsFormKey,
                                child: ExpansionTile(
                                  controller: controller
                                      .expansionTileControllers
                                      .elementAt(2),
                                  initiallyExpanded:
                                      controller.selectedTile.value == 3,
                                  title: const TextView(
                                    text: "Working Details",
                                    color: ColorPallete.secondary,
                                    fontSize: 18,
                                    weight: FontWeight.bold,
                                  ),
                                  children:
                                      controller.workingDetailsFields.map((e) {
                                    return TextFieldEntryWidget(
                                      fieldName: e,
                                      controller: controller,
                                    );
                                  }).toList(),
                                ),
                              ),
                              Form(
                                key: controller.familyDetailsFormKey,
                                child: ExpansionTile(
                                  controller: controller
                                      .expansionTileControllers
                                      .elementAt(3),
                                  initiallyExpanded:
                                      controller.selectedTile.value == 4,
                                  title: const TextView(
                                    text: "Family Details",
                                    color: ColorPallete.secondary,
                                    fontSize: 18,
                                    weight: FontWeight.bold,
                                  ),
                                  children:
                                      controller.familyDetailsFields.map((e) {
                                    return TextFieldEntryWidget(
                                      fieldName: e,
                                      controller: controller,
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0 * fem),
                    child: InkWell(
                      onTap: () {
                        controller.validateAndContinue(context);
                      },
                      child: RoundedContainer(
                        radius: 10,
                        color: ColorPallete.primary,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
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

class TextFieldEntryWidget extends StatelessWidget {
  final String fieldName;
  final SignUpController controller;
  const TextFieldEntryWidget({
    super.key,
    required this.fieldName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    TextInputType keyBoard = fieldName.contains("No.") ||
            fieldName.contains("Code") ||
            fieldName.contains("Number")
        ? TextInputType.number
        : fieldName.contains("Email")
            ? TextInputType.emailAddress
            : TextInputType.name;
    List<String> genders = ["Select Gender", "Male", "Female", "Other"];
    List<String> bloodGroup = [
      "Select Blood Group",
      "A-",
      "B-",
      "AB-",
      "O-",
      "A+",
      "B+",
      "AB+",
      "O+"
    ];
    DateTime? date = null;
    bool mandatory = !controller.nonMandatoryFields.contains(fieldName);
    // bool mandatory = false;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0 * fem, vertical: 5 * fem),
      child: RoundedContainer(
        radius: 5,
        borderColor: ColorPallete.grey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
          child: ["Gender", "Blood Group"].contains(fieldName)
              ? Row(
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: (fieldName == "Gender" ? genders : bloodGroup)
                              .first,
                          items: (fieldName == "Gender" ? genders : bloodGroup)
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: TextView(text: e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                )
              : fieldName.contains("DOB") || fieldName.contains("Date")
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 5 * fem),
                      child: StatefulBuilder(
                        builder: (context, updateState) {
                          return InkWell(
                            onTap: fieldName.contains("DOB") ||
                                    fieldName.contains("Date")
                                ? () async {
                                    var result = await showDatePicker(
                                        context: context,
                                        initialDate: date ?? DateTime.now(),
                                        firstDate: DateTime.now().subtract(
                                            const Duration(days: 365 * 30)),
                                        lastDate: DateTime.now());
                                    date = result;

                                    // error = null;
                                    updateState(() {});
                                    if (Focus.of(context).hasFocus)
                                      Focus.of(context).unfocus();
                                  }
                                : null,
                            child: MyListView(
                              children: [
                                MyTextField(
                                  enabled: !fieldName.contains("DOB"),
                                  keyboardType: keyBoard,
                                  initialValue: date == null
                                      ? ""
                                      : DateFormat("dd MMM yyyy").format(date!),
                                  hintText: fieldName,
                                  hintColor: ColorPallete.grey,
                                  onChanged: (value) {},
                                  validator: mandatory
                                      ? (value) {
                                          return value!.isEmpty
                                              ? "$fieldName is required"
                                              : null;
                                        }
                                      : null,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.5 * fem),
                      child: MyTextField(
                        enabled: !fieldName.contains("DOB"),
                        keyboardType: keyBoard,
                        hintText: fieldName,
                        hintColor: ColorPallete.grey,
                        onChanged: (value) {},
                        validator: mandatory
                            ? (value) {
                                return value!.isEmpty
                                    ? "$fieldName is required"
                                    : null;
                              }
                            : null,
                      ),
                    ),
        ),
      ),
    );
  }
}
