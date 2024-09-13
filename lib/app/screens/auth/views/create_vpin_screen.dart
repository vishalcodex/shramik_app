// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';

// import '../../../../common/utils.dart';
// import '../../../components/ui/my_list_view.dart';
// import '../../../components/ui/text_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../common/color_pallete.dart';
// import '../../../components/ui/rounded_container.dart';
// import '../controller/auth_controller.dart';

// class CreateVpinScreen extends GetView<AuthController> {
//   const CreateVpinScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 393;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     double ffem = fem * 0.97;
//     return Scaffold(
//       backgroundColor: ColorPallete.theme,
//       body: SafeArea(
//         child: Scaffold(
//           resizeToAvoidBottomInset: true,
//           backgroundColor: ColorPallete.theme,
//           appBar: AppBar(
//             backgroundColor: ColorPallete.theme,
//             leading: Padding(
//               padding: EdgeInsets.only(left: 10.0 * fem),
//               child: InkWell(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 5.0 * fem),
//                   child: Image.asset(
//                     "assets/ui/back.png",
//                     width: 10 * fem,
//                     color: ColorPallete.primary,
//                   ),
//                 ),
//               ),
//             ),
//             elevation: 0,
//           ),
//           body: WillPopScope(
//             onWillPop: () {
//               if (controller.viaPassword.value) {
//                 controller.viaPassword.value = false;
//                 controller.viaPassword.refresh();
//                 return Future.value(false);
//               }

//               return Future.value(true);
//             },
//             child: SingleChildScrollView(
//               child: RoundedContainer(
//                 radius: 0,
//                 height: MediaQuery.of(context).size.height * 0.75,
//                 color: ColorPallete.theme,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25.0 * fem),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: MyListView(
//                           // mainAxisSize: MainAxisSize.max,
//                           // mainAxisAlignment: MainAxisAlignment.start,
//                           // crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 20 * fem,
//                             ),
//                             SizedBox(
//                               height: 10 * fem,
//                             ),
//                             const TextView(
//                               text: "Create a VPIN",
//                               color: ColorPallete.secondary,
//                               fontSize: 32,
//                               weight: FontWeight.bold,
//                             ),
//                             SizedBox(
//                               height: 10 * fem,
//                             ),
//                             const TextView(
//                               text:
//                                   "A VPIN is important option to access your account frequently without entering customer Id & password.",
//                               color: ColorPallete.grey,
//                               fontSize: 12,
//                             ),
//                             SizedBox(
//                               height: 25 * fem,
//                             ),
//                             Row(
//                               children: [
//                                 const Icon(
//                                   Icons.info,
//                                   color: Color(0xffEEE948),
//                                 ),
//                                 SizedBox(
//                                   width: 10 * fem,
//                                 ),
//                                 const Expanded(
//                                   child: TextView(
//                                     text:
//                                         "VPIN will be consist of 4 digits. All will be numericals",
//                                     color: ColorPallete.grey,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 25 * fem,
//                             ),
//                             const TextView(
//                               text: "Enter VPIN",
//                               color: ColorPallete.secondary,
//                               fontSize: 16,
//                             ),
//                             SizedBox(
//                               height: 15 * fem,
//                             ),
//                             RoundedContainer(
//                               radius: 0,
//                               // height: 50,
//                               child: OTPTextField(
//                                 length: 4,
//                                 width: MediaQuery.of(context).size.width,
//                                 fieldWidth: 75 * fem,
//                                 style: SafeGoogleFont(
//                                   'Roboto',
//                                   fontSize: 25 * ffem,
//                                   fontWeight: FontWeight.w500,
//                                   height: 1.5 * ffem / fem,
//                                   letterSpacing: -0.349999994 * fem,
//                                   color: ColorPallete.secondary,
//                                 ),
//                                 contentPadding: EdgeInsets.all(15 * fem),
//                                 obscureText: true,
//                                 textFieldAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 fieldStyle: FieldStyle.box,
//                                 otpFieldStyle: OtpFieldStyle(
//                                   borderColor: ColorPallete.greyContainer,
//                                   enabledBorderColor:
//                                       ColorPallete.greyContainer,
//                                   backgroundColor: ColorPallete.greyContainer,
//                                   focusBorderColor: ColorPallete.greyContainer,
//                                 ),
//                                 onCompleted: (pin) {
//                                   controller.creds["vpin"] = pin;
//                                 },
//                                 onChanged: (value) {
//                                   controller.creds["vpin"] =
//                                       value.length > 3 ? value : "";
//                                 },
//                               ),
//                             ),

//                             SizedBox(
//                               height: 25 * fem,
//                             ),
//                             const TextView(
//                               text: "Confirm VPIN",
//                               color: ColorPallete.secondary,
//                               fontSize: 16,
//                             ),
//                             SizedBox(
//                               height: 10 * fem,
//                             ),
//                             RoundedContainer(
//                               radius: 0,
//                               // height: 50,
//                               child: OTPTextField(
//                                 length: 4,
//                                 width: MediaQuery.of(context).size.width,
//                                 fieldWidth: 75 * fem,
//                                 style: SafeGoogleFont(
//                                   'Roboto',
//                                   fontSize: 25 * ffem,
//                                   fontWeight: FontWeight.w500,
//                                   height: 1.5 * ffem / fem,
//                                   letterSpacing: -0.349999994 * fem,
//                                   color: ColorPallete.secondary,
//                                 ),
//                                 contentPadding: EdgeInsets.all(15 * fem),
//                                 obscureText: true,
//                                 textFieldAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 fieldStyle: FieldStyle.box,
//                                 otpFieldStyle: OtpFieldStyle(
//                                   borderColor: ColorPallete.greyContainer,
//                                   enabledBorderColor:
//                                       ColorPallete.greyContainer,
//                                   backgroundColor: ColorPallete.greyContainer,
//                                   focusBorderColor: ColorPallete.greyContainer,
//                                 ),
//                                 onCompleted: (pin) {
//                                   controller.creds["confirm_vpin"] = pin;
//                                   controller.checkVpin();
//                                 },
//                                 onChanged: (value) {
//                                   controller.creds["confirm_vpin"] =
//                                       value.length > 3 ? value : "";
//                                   if (value.length > 3) {
//                                     controller.checkVpin();
//                                   }
//                                 },
//                               ),
//                             ),
//                             // SizedBox(
//                             //   height: 20 * fem,
//                             // ),

//                             // SizedBox(
//                             //   height: 25 * fem,
//                             // ),
//                             // if (controller.errorMessage.value != "")
//                             //   TextView(
//                             //     text: controller.errorMessage.value,
//                             //     color: ColorPallete.red,
//                             //     fontSize: 14,
//                             //     weight: FontWeight.bold,
//                             //   ),
//                             // if (controller.errorMessage.value != "")
//                             //   SizedBox(
//                             //     height: 25 * fem,
//                             //   ),
//                           ],
//                         ),
//                       ),
//                       Obx(
//                         () => InkWell(
//                           onTap: () {
//                             if (controller.validVpin.value) {
//                               if (!controller.isLoading.value)
//                                 controller.createVpin();
//                             }
//                           },
//                           child: RoundedContainer(
//                             radius: 10,
//                             height: 55,
//                             color: controller.validVpin.value
//                                 ? ColorPallete.primary
//                                 : ColorPallete.primary.withOpacity(0.2),
//                             child: controller.isLoading.value
//                                 ? const RoundedContainer(
//                                     radius: 0,
//                                     height: 50,
//                                     width: 50,
//                                     child: Center(
//                                       child: CircularProgressIndicator(
//                                         color: ColorPallete.theme,
//                                       ),
//                                     ),
//                                   )
//                                 : const Center(
//                                     child: TextView(
//                                       text: "Create VPIN",
//                                       color: ColorPallete.theme,
//                                       fontSize: 22,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10 * fem,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
