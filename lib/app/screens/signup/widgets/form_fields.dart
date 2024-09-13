import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common/color_pallete.dart';
import '../../../../common/utils.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_field.dart';
import '../../../components/ui/text_view.dart';

enum InputType {
  TEXT,
  DATE,
  DROP_DOWN,
}

class MyFormField extends StatelessWidget {
  final String fieldName;
  final String? initialValue;
  final InputType type;
  final TextInputType keyboard;
  final String? Function(String? value)? validator;
  final List? dropDownOptions;
  final Function(String value) onChanged;
  final bool? required;
  const MyFormField({
    super.key,
    required this.fieldName,
    required this.type,
    required this.keyboard,
    this.validator,
    this.dropDownOptions,
    required this.onChanged,
    this.required,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0 * fem, vertical: 7.5 * fem),
      child: MyListView(
        children: [
          if (initialValue != null && initialValue != "")
            Padding(
              padding: EdgeInsets.only(bottom: 2.5 * fem),
              child: TextView(text: fieldName),
            ),
          RoundedContainer(
            radius: 5,
            // borderColor: ColorPallete.grey,
            color: ColorPallete.grey.withOpacity(0.1),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
              child: type == InputType.DROP_DOWN
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: fieldName,
                                hintStyle: SafeGoogleFont('Roboto',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: ColorPallete.grey),
                                errorStyle: SafeGoogleFont('Roboto',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: ColorPallete.red),
                              ),
                              value: dropDownOptions!.contains(initialValue)
                                  ? initialValue
                                  : null,
                              style: const TextStyle(
                                color: ColorPallete.primary,
                              ),
                              items: dropDownOptions!
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: TextView(text: e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                onChanged(value!);
                              },
                              validator: required ?? false
                                  ? validator ??
                                      (value) {
                                        return value == null || value.isEmpty
                                            ? "$fieldName is required"
                                            : null;
                                      }
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    )
                  : type == InputType.DATE
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: 5 * fem),
                          child: DatePickerField(
                            intialValue: initialValue,
                            fieldName: fieldName,
                            isRequired: required ?? false,
                            onChanged: (value) {
                              onChanged(
                                  DateFormat("dd-MM-yyyy").format(value!));
                            },
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.5 * fem),
                          child: MyTextField(
                            initialValue: initialValue,
                            keyboardType: keyboard,
                            hintText: fieldName,
                            textColor: ColorPallete.primary,
                            hintColor: ColorPallete.grey,
                            onChanged: onChanged,
                            validator: required ?? false
                                ? keyboard == TextInputType.emailAddress
                                    ? (value) {
                                        return getEmailValidator(
                                            fieldName, value);
                                      }
                                    : keyboard == TextInputType.phone
                                        ? (value) {
                                            return getPhoneNumberValidator(
                                                fieldName, value);
                                          }
                                        : validator ??
                                            (value) {
                                              return value == null ||
                                                      value.isEmpty
                                                  ? "$fieldName is required"
                                                  : null;
                                            }
                                : null,
                          ),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}

class DatePickerField extends StatefulWidget {
  final String fieldName;
  final String? intialValue;
  final bool isRequired;
  final Function(DateTime? value) onChanged;
  const DatePickerField(
      {super.key,
      required this.fieldName,
      required this.isRequired,
      required this.onChanged,
      this.intialValue});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? date;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = widget.intialValue == null
        ? null
        : DateFormat("dd-MM-yyyy").parse(widget.intialValue!);
  }

  @override
  Widget build(BuildContext context) {
    date = widget.intialValue == null
        ? null
        : DateFormat("dd-MM-yyyy").parse(widget.intialValue!);
    return StatefulBuilder(
      builder: (context, updateState) {
        return InkWell(
          onTap: () async {
            var result = await showDatePicker(
                context: context,
                initialDate: date ?? DateTime.now(),
                firstDate:
                    DateTime.now().subtract(const Duration(days: 365 * 80)),
                lastDate: DateTime.now());
            date = result;
            widget.onChanged(date);
            updateState(() {});
            // if (Focus.of(context).hasFocus) Focus.of(context).unfocus();
          },
          child: MyListView(
            children: [
              MyTextField(
                enabled: false,
                initialValue:
                    date == null ? "" : DateFormat("dd MMM yyyy").format(date!),
                hintText: widget.fieldName,
                hintColor: ColorPallete.grey,
                textColor: ColorPallete.primary,
                onChanged: (value) {},
                validator: widget.isRequired
                    ? (value) {
                        return value!.isEmpty
                            ? "${widget.fieldName} is required"
                            : null;
                      }
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}

String? getEmailValidator(String fieldName, String? value) {
  RegExp emailValidation = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return value == null || value.isEmpty || !emailValidation.hasMatch(value)
      ? "Invalid $fieldName !"
      : null;
}

String? getPhoneNumberValidator(String fieldName, String? value) {
  return value == null || value.isEmpty || value.length != 10
      ? "Invalid $fieldName ! Must contain 10 digits !"
      : null;
}
