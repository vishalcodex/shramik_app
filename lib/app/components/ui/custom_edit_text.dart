import 'package:flutter/material.dart';

import '../../../common/utils.dart';

// ignore: must_be_immutable
class CustomEditTextBox extends StatefulWidget {
  Function(String value) onTextChanged;
  Widget? leading;
  Widget? trailing;
  bool isObscured;
  String? hintText;
  String? errorText;
  String? initialValue;
  TextInputType? type;

  CustomEditTextBox(
      {super.key,
      required this.onTextChanged,
      this.hintText,
      this.leading,
      this.trailing,
      this.errorText,
      this.type,
      this.initialValue,
      this.isObscured = false});

  @override
  State<CustomEditTextBox> createState() => _CustomEditTextBoxState();
}

class _CustomEditTextBoxState extends State<CustomEditTextBox> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
        // textfieldM3Y (233:23051)
        // padding: EdgeInsets.fromLTRB(12 * fem, 12 * fem, 12 * fem, 12 * fem),
        padding: EdgeInsets.symmetric(horizontal: 10 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffeaeaea)),
          borderRadius: BorderRadius.circular(6.4499998093 * fem),
        ),
        child: Row(
          children: [
            widget.leading ?? SizedBox.shrink(),
            widget.leading != null
                ? SizedBox(width: 10 * fem)
                : SizedBox.shrink(),
            Expanded(
              child: TextFormField(
                keyboardType: widget.type ?? TextInputType.name,
                initialValue: widget.initialValue ?? "",
                onChanged: (value) {
                  widget.onTextChanged(value);
                },
                obscureText: widget.isObscured,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:
                      widget.initialValue != null && widget.initialValue != ""
                          ? null
                          : widget.hintText ?? "",
                  errorText: widget.errorText,
                  errorStyle: SafeGoogleFont(
                    'Montserrat',
                    fontSize: 12 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.5 * ffem / fem,
                    letterSpacing: -0.349999994 * fem,
                    color: Colors.red,
                  ),
                  hintStyle: SafeGoogleFont(
                    'Montserrat',
                    fontSize: 12 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.5 * ffem / fem,
                    letterSpacing: -0.349999994 * fem,
                    color: Color(0xff76869a),
                  ),
                ),
                style: SafeGoogleFont(
                  'Montserrat',
                  fontSize: 12 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5 * ffem / fem,
                  letterSpacing: -0.349999994 * fem,
                  color: Color(0xff76869a),
                ),
              ),
            ),
            widget.trailing != null
                ? SizedBox(width: 10 * fem)
                : SizedBox.shrink(),
            widget.trailing ?? SizedBox.shrink(),
          ],
        ));
  }
}
