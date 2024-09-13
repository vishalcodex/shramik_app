// import '../../../components/ui/my_list_view.dart';
// import '../../../components/ui/text_field.dart';
// import '../../../components/ui/text_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../common/color_pallete.dart';
// import '../../../components/ui/rounded_container.dart';
// import '../controller/auth_controller.dart';

// class CreatePasswordScreen extends GetView<AuthController> {
//   const CreatePasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 393;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     // double ffem = fem * 0.97;
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
//                 onTap: () {},
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

//               return Future.value(false);
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
//                               text: "Create Password",
//                               color: ColorPallete.secondary,
//                               fontSize: 32,
//                               weight: FontWeight.bold,
//                             ),
//                             SizedBox(
//                               height: 10 * fem,
//                             ),
//                             const TextView(
//                               text:
//                                   "Please enter password for security purpose.",
//                               color: ColorPallete.grey,
//                               fontSize: 12,
//                             ),
//                             SizedBox(
//                               height: 25 * fem,
//                             ),
//                             // Row(
//                             //   children: [
//                             //     const Icon(
//                             //       Icons.info,
//                             //       color: Color(0xffEEE948),
//                             //     ),
//                             //     SizedBox(
//                             //       width: 10 * fem,
//                             //     ),
//                             //     const Expanded(
//                             //       child: TextView(
//                             //         text:
//                             //             "VPIN will be consist of 4 digits. All will be numericals",
//                             //         color: ColorPallete.grey,
//                             //         fontSize: 12,
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                             SizedBox(
//                               height: 25 * fem,
//                             ),
//                             const TextView(
//                               text: "Enter Password *",
//                               color: ColorPallete.secondary,
//                               fontSize: 16,
//                             ),
//                             SizedBox(
//                               height: 15 * fem,
//                             ),
//                             Obx(
//                               () => RoundedContainer(
//                                 radius: 7.5,
//                                 // borderColor: ColorPallete.grey,
//                                 color: ColorPallete.grey.withOpacity(0.15),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(
//                                       width: 15 * fem,
//                                     ),
//                                     Expanded(
//                                       child: MyTextField(
//                                         // initialValue:
//                                         //     controller.creds["password"],
//                                         hintText: "Enter Password here",
//                                         fontSize: 16,
//                                         obscureText:
//                                             !controller.showPassword.value,
//                                         onChanged: (value) {
//                                           controller.creds["password"] = value;
//                                           controller.checkPassword();
//                                           // controller
//                                           //     .errorMessage.value = "";
//                                         },
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 15.0 * fem),
//                                       child: InkWell(
//                                         onTap: () {
//                                           controller.showPassword.value =
//                                               !controller.showPassword.value;
//                                         },
//                                         child: Icon(
//                                           controller.showPassword.value
//                                               ? Icons.visibility
//                                               : Icons.visibility_off,
//                                           color: ColorPallete.grey
//                                               .withOpacity(0.5),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10 * fem,
//                             ),
//                             Obx(
//                               () => controller.creds["password"] != "" ||
//                                       controller.creds["password"] != null
//                                   ? Row(
//                                       children: [
//                                         TextView(
//                                           text: "Password Strength : ",
//                                           fontSize: 12 * fem,
//                                           weight: FontWeight.w400,
//                                           color: ColorPallete.grey
//                                               .withOpacity(0.5),
//                                         ),
//                                         TextView(
//                                           text: controller.validPassword.value
//                                               ? controller.creds["password"]
//                                                           .toString()
//                                                           .length >
//                                                       8
//                                                   ? "Strong"
//                                                   : "Good"
//                                               : "Weak",
//                                           color: controller.validPassword.value
//                                               ? controller.creds["password"]
//                                                           .toString()
//                                                           .length >
//                                                       8
//                                                   ? Colors.green
//                                                   : ColorPallete.primary
//                                               : ColorPallete.red,
//                                           fontSize: 12 * fem,
//                                           weight: FontWeight.w400,
//                                         ),
//                                       ],
//                                     )
//                                   : const SizedBox.shrink(),
//                             ),
//                             SizedBox(
//                               height: 20 * fem,
//                             ),
//                             Obx(
//                               () => MyListView(
//                                 children:
//                                     controller.passwordCriterias.map((element) {
//                                   bool isValid = element["isValid"];
//                                   return Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(vertical: 5 * fem),
//                                     child: RoundedContainer(
//                                       radius: 0,
//                                       child: Row(
//                                         children: [
//                                           Icon(
//                                             Icons.check_circle,
//                                             color: isValid
//                                                 ? Colors.green
//                                                 : ColorPallete.grey
//                                                     .withOpacity(0.5),
//                                           ),
//                                           SizedBox(
//                                             width: 10 * fem,
//                                           ),
//                                           TextView(
//                                             text: element["criteria"],
//                                             color: isValid
//                                                 ? ColorPallete.secondary
//                                                 : ColorPallete.grey
//                                                     .withOpacity(0.5),
//                                             weight: FontWeight.w400,
//                                             fontSize: 14,
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 25 * fem,
//                             ),
//                             if (controller.errorMessage.value != "")
//                               TextView(
//                                 text: controller.errorMessage.value,
//                                 color: ColorPallete.red,
//                                 fontSize: 14,
//                                 weight: FontWeight.bold,
//                               ),
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
//                             if (controller.validPassword.value) {
//                               if (!controller.isLoading.value)
//                                 controller.createPassword();
//                             }
//                           },
//                           child: RoundedContainer(
//                             radius: 10,
//                             height: 55,
//                             color: controller.validPassword.value
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
//                                       text: "Confirm",
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
