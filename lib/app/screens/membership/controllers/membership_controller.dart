import 'dart:io';

import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shramik/app/services/auth_service.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../../models/api_response.dart';
import '../../../models/family_details_model.dart';
import '../../../models/personal_details_model.dart';
import '../../../models/political_details_model.dart';
import '../../../models/scheme_details_model.dart';
import '../../../models/working_details_model.dart';
import '../../../repositories/membership_repository.dart';
import '../widgets/membership_card.dart';

class MembershipController extends GetxController {
  late MembershipRepository _membershipRepository;
  MembershipController() {
    _membershipRepository = MembershipRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    fetchMemberDetails();
    fetchPoliticalDetails();
    fetchWorkingDetails();
    fetchFamilyDetails();
    fetchSchemeDetails();
  }

  Rx<PersonalDetails> personalDetails = PersonalDetails().obs;
  fetchMemberDetails() async {
    await _membershipRepository.fetchPersonalDetails().then((value) {
      if (value.status == Status.COMPLETED) {
        personalDetails = PersonalDetails().obs;
        personalDetails.value = value.data;
        personalDetails.refresh();
      }
    });
  }

  Rx<PoliticalDetails> politicalDetails = PoliticalDetails().obs;
  fetchPoliticalDetails() async {
    await _membershipRepository.fetchPoliticalDetails().then((value) {
      if (value.status == Status.COMPLETED) {
        politicalDetails = PoliticalDetails().obs;
        politicalDetails.value = value.data;
        politicalDetails.refresh();
      }
    });
  }

  Rx<WorkingDetails> workingDetails = WorkingDetails().obs;
  fetchWorkingDetails() async {
    await _membershipRepository.fetchWorkingDetails().then((value) {
      if (value.status == Status.COMPLETED) {
        workingDetails = WorkingDetails().obs;
        workingDetails.value = value.data;
        workingDetails.refresh();
      }
    });
  }

  Rx<FamilyDetails> familyDetails = FamilyDetails().obs;
  fetchFamilyDetails() async {
    await _membershipRepository.fetchFamilyDetails().then((value) {
      if (value.status == Status.COMPLETED) {
        familyDetails = FamilyDetails().obs;
        familyDetails.value = value.data;
        familyDetails.refresh();
      }
    });
  }

  Rx<SchemeDetails> schemeDetails = SchemeDetails().obs;
  fetchSchemeDetails() async {
    await _membershipRepository.fetchSchemeDetails().then((value) {
      if (value.status == Status.COMPLETED) {
        schemeDetails = SchemeDetails().obs;
        schemeDetails.value = value.data;
        schemeDetails.refresh();
      }
    });
  }

  RxBool isLoading = false.obs;
  WidgetsToImageController frontCardController = WidgetsToImageController();
  void downloadMembershipCard() async {
    isLoading.value = true;
    return frontCardController.capture().then((value) async {
      pw.Document pdf = await MembershipCard.createStatement(value);

      var fileName =
          "${Get.find<AuthService>().user.value.name} Shramik Membership Card.pdf";
      final output = await getDownloadsDirectory();
      final file = File("${output!.path}/$fileName");
      await file.create().then((value) async {
        value.writeAsBytes(await pdf.save());
        isLoading.value = false;
        OpenFilex.open(value.path);
      });
    });
  }
}
