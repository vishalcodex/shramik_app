import 'package:flutter/material.dart';

import '../../../../common/utils.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: 360 * fem,
      height: 13 * fem,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // line17gg2 (I223:24787;220:22019)
            margin: EdgeInsets.fromLTRB(0 * fem, 2 * fem, 6 * fem, 0 * fem),
            width: baseWidth * 0.4 * fem,
            height: 1 * fem,
            decoration: BoxDecoration(
              color: Color(0xffbbbbbb),
            ),
          ),
          Center(
            // oramQ (I223:24787;220:22017)
            child: Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 7 * fem, 0 * fem),
              child: Text(
                'OR',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Montserrat',
                  fontSize: 12 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2175 * ffem / fem,
                  letterSpacing: -0.3 * fem,
                  color: Color(0xffbbbbbb),
                ),
              ),
            ),
          ),
          Container(
            // line16pQr (I223:24787;220:22018)
            margin: EdgeInsets.fromLTRB(0 * fem, 2 * fem, 0 * fem, 0 * fem),
            width: baseWidth * 0.4 * fem,
            height: 1 * fem,
            decoration: BoxDecoration(
              color: Color(0xffbbbbbb),
            ),
          ),
        ],
      ),
    );
  }
}
