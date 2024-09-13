import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/sign_up_controller.dart';
import 'form_fields.dart';

class WorkingDetailsForm extends GetView<SignUpController> {
  const WorkingDetailsForm({super.key});

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
                  key: controller.workingDetailsFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextView(
                        text: "Working Details",
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      MyFormField(
                        fieldName: "MIDC Name",
                        type: InputType.TEXT,
                        keyboard: TextInputType.text,
                        required: false,
                        initialValue: controller.workingDetails["midc_name"],
                        onChanged: (value) {
                          controller.workingDetails["midc_name"] = value;
                        },
                      ),
                      MyFormField(
                        fieldName: "Occupation Category",
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.text,
                        required: true,
                        dropDownOptions: controller.occupationCategories
                            .map((element) => element.name)
                            .toList(),
                        initialValue: controller.occupationCategories
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.workingDetails[
                                            "occupation_category_id"] ??
                                        ""))
                                .toList()
                                .isEmpty
                            ? null
                            : controller.occupationCategories
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.workingDetails[
                                            "occupation_category_id"] ??
                                        ""))
                                .toList()
                                .first
                                .name,
                        onChanged: (value) {
                          controller.onOccupationCategoryChanged(value);
                        },
                      ),
                      MyFormField(
                        fieldName: "Sub Occupation Category",
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.text,
                        required: true,
                        dropDownOptions: controller.occupationSubCategories
                            .map((element) => element.name)
                            .toList(),
                        initialValue: controller.occupationSubCategories
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.workingDetails[
                                            "occupation_subcategory_id"] ??
                                        ""))
                                .toList()
                                .isEmpty
                            ? null
                            : controller.occupationSubCategories
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.workingDetails[
                                            "occupation_subcategory_id"] ??
                                        ""))
                                .toList()
                                .first
                                .name,
                        onChanged: (value) {
                          controller.onOccupationSubCategoryChanged(value);
                        },
                      ),
                      MyFormField(
                        fieldName: "Work Place Name / Company Name",
                        type: InputType.TEXT,
                        keyboard: TextInputType.text,
                        required: false,
                        initialValue: controller.workingDetails["company_name"],
                        onChanged: (value) {
                          controller.workingDetails["company_name"] = value;
                        },
                      ),
                      MyFormField(
                        fieldName: "Work Place Address",
                        type: InputType.TEXT,
                        keyboard: TextInputType.text,
                        required: true,
                        initialValue:
                            controller.workingDetails["company_address"],
                        onChanged: (value) {
                          controller.workingDetails["company_address"] = value;
                        },
                      ),
                      MyFormField(
                          fieldName: "Work Place Pin Code",
                          type: InputType.TEXT,
                          keyboard: TextInputType.number,
                          required: true,
                          initialValue:
                              controller.workingDetails["company_pincode"],
                          onChanged: (value) {
                            controller.workingDetails["company_pincode"] =
                                value;
                          },
                          validator: (value) {
                            return value == null ||
                                    value.isEmpty ||
                                    value.length != 6
                                ? "Invalid Pin Code"
                                : null;
                          }),
                      MyFormField(
                        fieldName: "Accountable Person Name",
                        type: InputType.TEXT,
                        keyboard: TextInputType.text,
                        required: false,
                        initialValue: controller
                            .workingDetails["accountable_person_name"],
                        onChanged: (value) {
                          controller.workingDetails["accountable_person_name"] =
                              value;
                        },
                      ),
                      MyFormField(
                        fieldName: "Accountable Person Contact Number",
                        type: InputType.TEXT,
                        keyboard: TextInputType.phone,
                        required: false,
                        initialValue: controller.workingDetails[
                            "accountable_person_contact_number"],
                        onChanged: (value) {
                          controller.workingDetails[
                              "accountable_person_contact_number"] = value;
                        },
                      ),
                      MyFormField(
                        fieldName: "Provident Fund Number",
                        type: InputType.TEXT,
                        keyboard: TextInputType.number,
                        required: false,
                        initialValue: controller.workingDetails["pf_number"],
                        onChanged: (value) {
                          controller.workingDetails["pf_number"] = value;
                        },
                      ),
                      MyFormField(
                        fieldName: "State Labour Insurance Scheme (E.S.I.C.) ",
                        type: InputType.TEXT,
                        keyboard: TextInputType.text,
                        required: false,
                        initialValue: controller
                            .workingDetails["state_labor_insurance_scheme"],
                        onChanged: (value) {
                          controller.workingDetails[
                              "state_labor_insurance_scheme"] = value;
                        },
                      ),
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
