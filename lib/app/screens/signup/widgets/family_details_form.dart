import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/sign_up_controller.dart';
import 'form_fields.dart';

class FamilyDetailsForm extends GetView<SignUpController> {
  const FamilyDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: controller.familyDetailsFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextView(
                      text: "Family Details",
                      color: ColorPallete.secondary,
                      fontSize: 18,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10 * fem,
                    ),
                    MyListView(
                      children: controller.familyDetailsFields.map(
                        (e) {
                          bool isRequired =
                              !controller.nonMandatoryFields.contains(e);
                          return MyFormField(
                            initialValue: controller.getfieldValue(e),
                            fieldName: e,
                            type: e.contains("DOB")
                                ? InputType.DATE
                                : e.contains("Type")
                                    ? InputType.DROP_DOWN
                                    : InputType.TEXT,
                            keyboard: e.contains("Number")
                                ? TextInputType.phone
                                : TextInputType.text,
                            dropDownOptions: const [
                              "Handicapped",
                              "Senior Citizen",
                              "Minor Senior Citizen"
                            ],
                            required: isRequired,
                            onChanged: (value) {
                              controller.savefieldValue(e, value);
                            },
                          );
                        },
                      ).toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
