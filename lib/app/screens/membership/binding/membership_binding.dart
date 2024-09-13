import 'package:get/get.dart';
import '../controllers/membership_controller.dart';

class MemebershipBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MembershipController>(MembershipController());
  }
}
