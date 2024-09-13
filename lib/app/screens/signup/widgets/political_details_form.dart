import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/sign_up_controller.dart';
import 'form_fields.dart';

class PoliticalDetailsForm extends GetView<SignUpController> {
  const PoliticalDetailsForm({super.key});

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
                  key: controller.politicalDetailsFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextView(
                        text: "Political Details",
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      MyFormField(
                        fieldName: controller.politicalDetailsFields.first,
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        required: true,
                        dropDownOptions: controller.mpCommitees
                            .map((element) => element.name)
                            .toList(),
                        initialValue: controller.mpCommitees
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.politicalDetails[
                                            "m_p_committee_id"] ??
                                        ""))
                                .toList()
                                .isEmpty
                            ? null
                            : controller.mpCommitees
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.politicalDetails[
                                            "m_p_committee_id"] ??
                                        ""))
                                .toList()
                                .first
                                .name,
                        onChanged: (value) {
                          controller.onMPCommiteeChanged(value);
                        },
                      ),
                      MyFormField(
                        fieldName:
                            controller.politicalDetailsFields.elementAt(1),
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        required: true,
                        dropDownOptions: controller.regionalCommitees
                            .map((element) => element.name)
                            .toList(),
                        initialValue: controller.regionalCommitees
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.politicalDetails[
                                            "regional_committee_id"] ??
                                        ""))
                                .toList()
                                .isEmpty
                            ? null
                            : controller.regionalCommitees
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.politicalDetails[
                                            "regional_committee_id"] ??
                                        ""))
                                .toList()
                                .first
                                .name,
                        onChanged: (value) {
                          controller.onRegionalCommiteeChanged(value);
                        },
                      ),
                      MyFormField(
                        fieldName:
                            controller.politicalDetailsFields.elementAt(2),
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        required: true,
                        dropDownOptions: controller.districtCommitees
                            .map((element) => element.name)
                            .toList(),
                        initialValue: controller.districtCommitees
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.politicalDetails[
                                            "district_committee_id"] ??
                                        ""))
                                .toList()
                                .isEmpty
                            ? null
                            : controller.districtCommitees
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.politicalDetails[
                                            "district_committee_id"] ??
                                        ""))
                                .toList()
                                .first
                                .name,
                        onChanged: (value) {
                          controller.onDistrictCommiteeChanged(value);
                        },
                      ),
                      MyFormField(
                        fieldName:
                            controller.politicalDetailsFields.elementAt(3),
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        required: true,
                        dropDownOptions: controller.talukaCommitees
                            .map((element) => element.name)
                            .toList(),
                        initialValue: controller.talukaCommitees
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.politicalDetails[
                                            "taluka_committee_id"] ??
                                        ""))
                                .toList()
                                .isEmpty
                            ? null
                            : controller.talukaCommitees
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.politicalDetails[
                                            "taluka_committee_id"] ??
                                        ""))
                                .toList()
                                .first
                                .name,
                        onChanged: (value) {
                          controller.onTalukaCommiteeChanged(value);
                        },
                      ),
                      MyFormField(
                        fieldName:
                            controller.politicalDetailsFields.elementAt(4),
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        required: true,
                        dropDownOptions: controller.villageWardCommitees
                            .map((element) => element.name)
                            .toList(),
                        initialValue: controller.villageWardCommitees
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.politicalDetails[
                                            "village_ward_committee_id"] ??
                                        ""))
                                .toList()
                                .isEmpty
                            ? null
                            : controller.villageWardCommitees
                                .where((p0) =>
                                    p0.id.toString() ==
                                    (controller.politicalDetails[
                                            "village_ward_committee_id"] ??
                                        ""))
                                .toList()
                                .first
                                .name,
                        onChanged: (value) {
                          controller.onVillageWardCommiteeChanged(value);
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
