import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_field.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/sign_up_controller.dart';

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
