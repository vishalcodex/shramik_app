import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/sign_up_controller.dart';
import 'form_fields.dart';

class SchemeDetailsForm extends GetView<SignUpController> {
  const SchemeDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
      child: Column(
        children: [
          Obx(
            () => Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.schemeDetailsFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextView(
                        text: "Scheme Details",
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      const TextView(
                        text: "Have you applied for any Govt. Schemes before ?",
                        fontSize: 14,
                        color: ColorPallete.secondary,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                controller.usedSchemeBefore.value = true;
                                controller.schemeDetails[
                                    "opt_govt_scheme_before"] = "1";
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    controller.usedSchemeBefore.value
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off,
                                    color: controller.usedSchemeBefore.value
                                        ? ColorPallete.primary
                                        : ColorPallete.grey,
                                  ),
                                  SizedBox(
                                    width: 5 * fem,
                                  ),
                                  const TextView(
                                    text: "Yes",
                                    fontSize: 14,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                controller.usedSchemeBefore.value = false;
                                controller.schemeDetails[
                                    "opt_govt_scheme_before"] = "0";
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    !controller.usedSchemeBefore.value
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off,
                                    color: !controller.usedSchemeBefore.value
                                        ? ColorPallete.primary
                                        : ColorPallete.grey,
                                  ),
                                  SizedBox(
                                    width: 5 * fem,
                                  ),
                                  const TextView(
                                    text: "No",
                                    fontSize: 14,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5 * fem,
                      ),
                      if (controller.usedSchemeBefore.value)
                        MyFormField(
                          fieldName: "Scheme Name",
                          type: InputType.TEXT,
                          keyboard: TextInputType.text,
                          initialValue: controller.schemeDetails["name"],
                          onChanged: (value) {
                            controller.schemeDetails["name"] = value;
                          },
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
