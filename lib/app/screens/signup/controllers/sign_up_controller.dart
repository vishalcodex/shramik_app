import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shramik/app/models/caste_model.dart';
import 'package:shramik/app/models/sub_caste_model.dart';
import 'package:shramik/app/screens/membership/controllers/membership_controller.dart';

import '../../../../common/color_pallete.dart';
import '../../../models/city_model.dart';
import '../../../models/district_commitee_model.dart';
import '../../../models/district_model.dart';
import '../../../models/mp_commitee_model.dart';
import '../../../models/occupation_category.dart';
import '../../../models/occupation_sub_category_model.dart';
import '../../../models/regional_commitee_model.dart';
import '../../../models/taluka_commitee_model.dart';
import '../../../models/taluka_model.dart';
import '../../../models/user_model.dart';
import '../../../models/village_ward_commitee_model.dart';
import '../../../repositories/membership_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../../services/phonepe_gateway_service.dart';

class SignUpController extends GetxController {
  late MembershipRepository _membershipRepository;
  SignUpController() {
    _membershipRepository = MembershipRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchFormData();
    if (Get.arguments != null && Get.arguments["isLoggedIn"]) {
      isAuthenticated.value = true;
      personalDetails =
          Get.find<MembershipController>().personalDetails.value.toJson();
      politicalDetails =
          Get.find<MembershipController>().politicalDetails.value.toJson();
      workingDetails =
          Get.find<MembershipController>().workingDetails.value.toJson();
      familyDetails =
          Get.find<MembershipController>().familyDetails.value.toJson();
      schemeDetails =
          Get.find<MembershipController>().schemeDetails.value.toJson();
      usedSchemeBefore.value = schemeDetails["opt_govt_scheme_before"] == 1;
    } else {
      personalDetails["phone"] =
          Get.find<AuthService>().user.value.phoneNumber!;
      personalDetails["email"] = Get.find<AuthService>().user.value.email!;
      personalDetails["username"] = Get.find<AuthService>().user.value.name!;
      schemeDetails["opt_govt_scheme_before"] = "0";
    }
    // selectedTile.listen((p0) {
    //   switch (p0) {
    //     case 2:
    //       fetchMpCommitees();
    //       break;
    //     case 3:
    //       fetchOccupationCategories();
    //       break;
    //     default:
    //   }
    // });
  }

  RxBool isAuthenticated = false.obs;
  RxInt selectedTile = 1.obs;

  RxString image = "".obs;
  Map<String, dynamic> personalDetails = {};
  Map<String, dynamic> politicalDetails = {};
  Map<String, dynamic> workingDetails = {};
  Map<String, dynamic> familyDetails = {};
  Map<String, dynamic> schemeDetails = {};

  List<String> stepsLabel = [
    "Personal Details",
    "Political Details",
    "Working Details",
    "Family Details",
    "Scheme Details"
  ];

  List<String> personalDetailsFields = [
    "Name",
    "WhatsApp No.",
    "Telegram No.",
    "Email",
    "DOB",
    "Marriage Anniversary Date",
    "Gender",
    "Blood Group",
    "Aadhaar Card No.",
    "PAN Card No.",
    "Resedential Address",
    "Resedential Pin Code",
    "Native Place",
    "Native Place Pin Code",
    "Nominee Name",
    "Nominee Relation",
    "Nominee DOB",
    "Nominee Contact",
    "Nominee Education",
  ];
  List<String> politicalDetailsFields = [
    "Maharashtra Pardeshi Commitee",
    "Regional Commitee",
    "District/City Commitee",
    "Taluka/Vidhansabha Commitee",
    "Village/Ward Commitee",
  ];
  List<String> workingDetailsFields = [
    "MIDC Name",
    "Working Category",
    "Work Place Name / Company Name",
    "Work Place Address",
    "Work Place Pin Code",
    "Accountable Person Name",
    "Accountable Person Contact Number",
    "Provident Fund Number",
    "State Labour Insurance Scheme (E.S.I.C.) "
  ];
  List<String> familyDetailsFields = [
    "Father Name",
    "Father DOB",
    "Father Contact Number",
    "Father Education",
    "Father Person Type",
    "Mother Name",
    "Mother DOB",
    "Mother Contact Number",
    "Mother Education",
    "Mother Person Type",
    "Wife Name",
    "Wife DOB",
    "Wife Contact Number",
    "Wife Education",
    "Wife Person Type",
    "Children 1 Name",
    "Children 1 DOB",
    "Children 1 Contact Number",
    "Children 1 Education",
    "Children 1 Person Type",
    "Children 2 Name",
    "Children 2 DOB",
    "Children 2 Contact Number",
    "Children 2 Education",
    "Children 2 Person Type",
  ];
  List<String> nonMandatoryFields = [
    //Personal
    "Telegram No.",
    "Email",
    "Blood Group",
    "Marriage Anniversary Date",
    "PAN Card No.",
    //Political
    //Working
    "MIDC Name",
    "Work Place Name / Company Name",
    "Accountable Person Name",
    "Accountable Person Contact Number",
    "Provident Fund Number",
    "State Labour Insurance Scheme (E.S.I.C.) ",
    //Family
    "Father Person Type",
    "Mother Person Type",
    "Wife Name",
    "Wife DOB",
    "Wife Contact Number",
    "Wife Education",
    "Wife Person Type",
    "Children 1 Name",
    "Children 1 DOB",
    "Children 1 Contact Number",
    "Children 1 Education",
    "Children 1 Person Type",
    "Children 2 Name",
    "Children 2 DOB",
    "Children 2 Contact Number",
    "Children 2 Education",
    "Children 2 Person Type"
  ];
  List<ExpansionTileController> expansionTileControllers = [
    ExpansionTileController(),
    ExpansionTileController(),
    ExpansionTileController(),
    ExpansionTileController(),
  ];
  GlobalKey<FormState> personalDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> politicalDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> workingDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> familyDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> schemeDetailsFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  void validateAndContinue(context) async {
    // selectedTile.value = 5;
    GlobalKey<FormState> key = selectedTile.value == 1
        ? personalDetailsFormKey
        : selectedTile.value == 2
            ? politicalDetailsFormKey
            : selectedTile.value == 3
                ? workingDetailsFormKey
                : selectedTile.value == 4
                    ? familyDetailsFormKey
                    : schemeDetailsFormKey;
    if (key.currentState!.validate()) {
      var result = false;
      isLoading.value = true;
      switch (selectedTile.value) {
        case 1:
          result = await _membershipRepository
              .savePersonalDetails(
                personalDetails,
              )
              .then((value) => value.data);
          break;
        case 2:
          result = await _membershipRepository
              .savePoliticalDetails(politicalDetails)
              .then((value) => value.data);
          break;
        case 3:
          result = await _membershipRepository
              .saveWorkingDetails(workingDetails)
              .then((value) => value.data);
          break;
        case 4:
          result = await _membershipRepository
              .saveFamilyDetails(familyDetails)
              .then((value) => value.data);
          break;
        case 5:
          result = await _membershipRepository
              .saveSchemeDetails(schemeDetails)
              .then((value) => value.data);
          break;
        default:
          result = false;
      }
      isLoading.value = false;
      if (result) {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: ColorPallete.primary,
          duration: const Duration(seconds: 2),
          message:
              "Details ${isAuthenticated.value ? "Updated" : "Submitted"} Successfully !!",
        ));
        if (selectedTile.value == 1) {
          onMPCommiteeChanged(politicalDetails["mp_committee"]["name"]);
        }
        if (selectedTile.value == 2) {
          onOccupationCategoryChanged(
              workingDetails["occupation_category"]["name"]);
        }
        if (selectedTile.value == stepsLabel.length) {
          if (!isAuthenticated.value) {
            Get.showSnackbar(
              const GetSnackBar(
                duration: Duration(seconds: 2),
                message: "Seting Up App ..\nAnd Going to Home Screen",
              ),
            );
          }

          Future.delayed(const Duration(seconds: 1), () {
            Get.offAllNamed(
              Routes.HOME,
              predicate: (route) => Get.currentRoute == "/home",
            );
            // paymentGateway(context).then((value) {});
          });
        }
        selectedTile.value = selectedTile.value + 1 > stepsLabel.length
            ? stepsLabel.length
            : selectedTile.value + 1;
        selectedTile.refresh();
      } else {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: ColorPallete.red,
          duration: Duration(seconds: 2),
          message: "Error Occured while Updating Details !",
        ));
      }
    }
  }

  Future<bool> paymentGateway(context) async {
    return await PhonePePG()
        .getInstance
        .startPGTransaction(context, "1", 123456789, "8459510732");
  }

  void savefieldValue(String fieldValue, String value) {
    switch (fieldValue) {
      //Political
      case "Maharashtra Pardeshi Commitee":
        politicalDetails["mh_pardeshi_commitee"] = value;
        break;
      case "Regional Commitee":
        politicalDetails["regional_commitee"] = value;
        break;
      case "District/City Commitee":
        politicalDetails["district_city_commitee"] = value;
        break;
      case "Taluka/Vidhansabha Commitee":
        politicalDetails["taluka_vidhansabha_commitee"] = value;
        break;
      case "Village/Ward Commitee":
        politicalDetails["village_ward_commitee"] = value;
        break;
      //Working
      case "MIDC Name":
        workingDetails["midc_name"] = value;
        break;
      case "Working Category":
        workingDetails["working_category"] = value;
        break;
      case "Work Place Name / Company Name":
        workingDetails["company_name"] = value;
        break;
      case "Work Place Address":
        workingDetails["work_address"] = value;
        break;
      case "Work Place Pin Code":
        workingDetails["work_pin_code"] = value;
        break;
      case "Accountable Person Name":
        workingDetails["accountable_person_name"] = value;
        break;
      case "Accountable Person Contact Number":
        workingDetails["accountable_person_contact"] = value;
        break;
      case "Provident Fund Number":
        workingDetails["pf_number"] = value;
        break;
      case "State Labour Insurance Scheme (E.S.I.C.)":
        workingDetails["esic"] = value;
        break;
      // Family
      case "Father Name":
        familyDetails["father_name"] = value;
        break;
      case "Father DOB":
        familyDetails["father_dob"] = value;
        break;
      case "Father Contact Number":
        familyDetails["father_contact_number"] = value;
        break;
      case "Father Education":
        familyDetails["father_education"] = value;
        break;
      case "Father Person Type":
        familyDetails["father_person_type"] = value;
        break;
      case "Mother Name":
        familyDetails["mother_name"] = value;
        break;
      case "Mother DOB":
        familyDetails["mother_dob"] = value;
        break;
      case "Mother Contact Number":
        familyDetails["mother_contact_number"] = value;
        break;
      case "Mother Education":
        familyDetails["mother_education"] = value;
        break;
      case "Mother Person Type":
        familyDetails["mother_person_type"] = value;
        break;
      case "Wife Name":
        familyDetails["wife_name"] = value;
        break;
      case "Wife DOB":
        familyDetails["wife_dob"] = value;
        break;
      case "Wife Contact Number":
        familyDetails["wife_contact_number"] = value;
        break;
      case "Wife Education":
        familyDetails["wife_education"] = value;
        break;
      case "Wife Person Type":
        familyDetails["wife_person_type"] = value;
        break;
      case "Children 1 Name":
        familyDetails["child1_name"] = value;
        break;
      case "Children 1 DOB":
        familyDetails["child1_dob"] = value;
        break;
      case "Children 1 Contact Number":
        familyDetails["child1_contact_number"] = value;
        break;
      case "Children 1 Education":
        familyDetails["child1_education"] = value;
        break;
      case "Children 1 Person Type":
        familyDetails["child1_person_type"] = value;
        break;
      case "Children 2 Name":
        familyDetails["child2_name"] = value;
        break;
      case "Children 2 DOB":
        familyDetails["child2_dob"] = value;
        break;
      case "Children 2 Contact Number":
        familyDetails["child2_contact_number"] = value;
        break;
      case "Children 2 Education":
        familyDetails["child2_education"] = value;
        break;
      case "Children 2 Person Type":
        familyDetails["child2_person_type"] = value;
        break;
      default:
    }
  }

  String? getfieldValue(String fieldValue) {
    String? value;
    switch (fieldValue) {
      //Political
      case "Maharashtra Pardeshi Commitee":
        value = politicalDetails["mh_pardeshi_commitee"];
        break;
      case "Regional Commitee":
        value = politicalDetails["regional_commitee"];
        break;
      case "District/City Commitee":
        value = politicalDetails["district_city_commitee"];
        break;
      case "Taluka/Vidhansabha Commitee":
        value = politicalDetails["taluka_vidhansabha_commitee"];
        break;
      case "Village/Ward Commitee":
        value = politicalDetails["village_ward_commitee"];
        break;
      //Working
      case "MIDC Name":
        value = workingDetails["midc_name"];
        break;
      case "Working Category":
        value = workingDetails["working_category"];
        break;
      case "Work Place Name / Company Name":
        value = workingDetails["company_name"];
        break;
      case "Work Place Address":
        value = workingDetails["work_address"];
        break;
      case "Work Place Pin Code":
        value = workingDetails["work_pin_code"];
        break;
      case "Accountable Person Name":
        value = workingDetails["accountable_person_name"];
        break;
      case "Accountable Person Contact Number":
        value = workingDetails["accountable_person_contact"];
        break;
      case "Provident Fund Number":
        value = workingDetails["pf_number"];
        break;
      case "State Labour Insurance Scheme (E.S.I.C.)":
        value = workingDetails["esic"];
        break;
      //Family
      case "Father Name":
        value = familyDetails["father_name"];
        break;
      case "Father DOB":
        value = familyDetails["father_dob"];
        break;
      case "Father Contact Number":
        value = familyDetails["father_contact_number"];
        break;
      case "Father Education":
        value = familyDetails["father_education"];
        break;
      case "Father Person Type":
        value = familyDetails["father_person_type"];
        break;
      case "Mother Name":
        value = familyDetails["mother_name"];
        break;
      case "Mother DOB":
        value = familyDetails["mother_dob"];
        break;
      case "Mother Contact Number":
        value = familyDetails["mother_contact_number"];
        break;
      case "Mother Education":
        value = familyDetails["mother_education"];
        break;
      case "Mother Person Type":
        value = familyDetails["mother_person_type"];
        break;
      case "Wife Name":
        value = familyDetails["wife_name"];
        break;
      case "Wife DOB":
        value = familyDetails["wife_dob"];
        break;
      case "Wife Contact Number":
        value = familyDetails["wife_contact_number"];
        break;
      case "Wife Education":
        value = familyDetails["wife_education"];
        break;
      case "Wife Person Type":
        value = familyDetails["wife_person_type"];
        break;
      case "Children 1 Name":
        value = familyDetails["child1_name"];
        break;
      case "Children 1 DOB":
        value = familyDetails["child1_dob"];
        break;
      case "Children 1 Contact Number":
        value = familyDetails["child1_contact_number"];
        break;
      case "Children 1 Education":
        value = familyDetails["child1_education"];
        break;
      case "Children 1 Person Type":
        value = familyDetails["child1_person_type"];
        break;
      case "Children 2 Name":
        value = familyDetails["child2_name"];
        break;
      case "Children 2 DOB":
        value = familyDetails["child2_dob"];
        break;
      case "Children 2 Contact Number":
        value = familyDetails["child2_contact_number"];
        break;
      case "Children 2 Education":
        value = familyDetails["child2_education"];
        break;
      case "Children 2 Person Type":
        value = familyDetails["child2_person_type"];
        break;
      default:
    }
    return value;
  }

  void register() {
    Get.showSnackbar(const GetSnackBar(
      duration: Duration(seconds: 2),
      message: "Registration Complete!\nDetails Submitted Succesfully !",
    ));
    Future.delayed(const Duration(seconds: 2), () {
      User user = User();
      user.token = "Authorised";
      Get.find<AuthService>().saveUser(user).then((value) {
        Get.offAndToNamed(Routes.HOME);
      });
    });
  }

  void fetchFormData() async {
    fetchDistricts();
    fetchCaste();
    fetchMpCommitees();
    fetchOccupationCategories();
  }

  RxList<District> districts = <District>[].obs;
  fetchDistricts() async {
    await _membershipRepository.fetchDistricts().then((value) {
      districts.value = value.data;
      onDistrictChanged(
          personalDetails["current_district"]["name"].toString(), true);
      onDistrictChanged(
          personalDetails["native_district"]["name"].toString(), false);
      districts.refresh();
    });
  }

  Future onDistrictChanged(String value, bool isCurrent) async {
    District selectedDistrict = districts.where((p0) => p0.name == value).first;
    personalDetails[isCurrent ? 'current_district_id' : "native_district_id"] =
        selectedDistrict.id.toString();
    await fetchTalukasByDistrict(selectedDistrict, isCurrent);
  }

  RxList<Taluka> currentTalukas = <Taluka>[].obs;
  RxList<Taluka> nativeTalukas = <Taluka>[].obs;
  fetchTalukasByDistrict(District selectedDistrict, bool isCurrent) async {
    await _membershipRepository
        .fetchTalukasByDistrict(selectedDistrict)
        .then((value) {
      if (isCurrent) {
        currentTalukas.value = value.data;
        currentTalukas.refresh();
      } else {
        nativeTalukas.value = value.data;
        nativeTalukas.refresh();
      }
      onTalukaChanged(
          personalDetails[isCurrent ? "current_taluka" : "native_taluka"]
              ["name"],
          isCurrent);
    });
  }

  void onTalukaChanged(String value, bool isCurrent) async {
    Taluka selectedTaluka = (isCurrent ? currentTalukas : nativeTalukas)
        .where((p0) => p0.name == value)
        .first;
    personalDetails[isCurrent ? 'current_taluka_id' : "native_taluka_id"] =
        selectedTaluka.id.toString();
    await fetchCitiesByTaluka(selectedTaluka, isCurrent);
  }

  RxList<City> currentCities = <City>[].obs;
  RxList<City> nativeCities = <City>[].obs;
  fetchCitiesByTaluka(Taluka selectedTaluka, bool isCurrent) async {
    await _membershipRepository
        .fetchCitiesByTaluka(selectedTaluka)
        .then((value) {
      if (isCurrent) {
        currentCities.value = value.data;
        currentCities.refresh();
      } else {
        nativeCities.value = value.data;
        nativeCities.refresh();
      }
      // onCityChanged(cities.first.name!, isCurrent: isCurrent);
    });
  }

  void onCityChanged(String value, bool isCurrent) {
    City selectedCity = (isCurrent ? currentCities : nativeCities)
        .where((p0) => p0.name == value)
        .first;
    personalDetails[isCurrent ? 'current_city_id' : "native_city_id"] =
        selectedCity.id.toString();
    refresh();
  }

  RxList<Caste> caste = <Caste>[].obs;
  fetchCaste() async {
    await _membershipRepository.fetchCaste().then((value) {
      caste.value = value.data;
      // onCasteChanged(caste.first.name);
      caste.refresh();
    });
  }

  Future<void> onCasteChanged(String? name) async {
    Caste selectedCaste = caste.where((p0) => p0.name == name).first;
    personalDetails["caste_id"] = selectedCaste.id.toString();
    personalDetails["sub_caste_id"] = "";
    await fetchSubCaste(selectedCaste);
  }

  RxList<SubCaste> subCaste = <SubCaste>[].obs;
  fetchSubCaste(Caste caste) async {
    await _membershipRepository.fetchSubCaste(caste).then((value) {
      subCaste.value = value.data;
      // onSubCasteChanged(subCaste.first.name);
      subCaste.refresh();
    });
  }

  onSubCasteChanged(String? name) {
    SubCaste selectedCategory = subCaste.where((p0) => p0.name == name).first;
    personalDetails["sub_caste_id"] = selectedCategory.id.toString();
  }

  //POLITICAL
  RxList<MPCommitee> mpCommitees = <MPCommitee>[].obs;
  fetchMpCommitees() async {
    await _membershipRepository.fetchMPCommitees().then((value) {
      mpCommitees.value = value.data;
      onMPCommiteeChanged(politicalDetails["mp_committee"]["name"]);
      mpCommitees.refresh();
    });
  }

  void onMPCommiteeChanged(String? name) async {
    MPCommitee selectedCommitee =
        mpCommitees.where((p0) => p0.name == name).first;
    politicalDetails["m_p_committee_id"] = selectedCommitee.id.toString();
    await fetchRegionalCommitees(selectedCommitee);
  }

  RxList<RegionalCommitee> regionalCommitees = <RegionalCommitee>[].obs;
  fetchRegionalCommitees(MPCommitee commitee) async {
    await _membershipRepository.fetchRegionalCommitees(commitee).then((value) {
      regionalCommitees.value = value.data;
      onRegionalCommiteeChanged(politicalDetails["regional_committee"]["name"]);
      regionalCommitees.refresh();
    });
  }

  Future<void> onRegionalCommiteeChanged(String? name) async {
    RegionalCommitee selectedCommitee =
        regionalCommitees.where((p0) => p0.name == name).first;
    politicalDetails["regional_committee_id"] = selectedCommitee.id.toString();
    await fetchDistrictCommitees(selectedCommitee);
  }

  RxList<DistrictCommitee> districtCommitees = <DistrictCommitee>[].obs;
  fetchDistrictCommitees(RegionalCommitee commitee) async {
    await _membershipRepository.fetchDistrictCommitees(commitee).then((value) {
      districtCommitees.value = value.data;
      onDistrictCommiteeChanged(politicalDetails["district_committee"]["name"]);
      districtCommitees.refresh();
    });
  }

  Future<void> onDistrictCommiteeChanged(String? name) async {
    DistrictCommitee selectedCommitee =
        districtCommitees.where((p0) => p0.name == name).first;
    politicalDetails["district_committee_id"] = selectedCommitee.id.toString();
    await fetchTalukaCommitees(selectedCommitee);
  }

  RxList<TalukaCommitee> talukaCommitees = <TalukaCommitee>[].obs;
  fetchTalukaCommitees(DistrictCommitee commitee) async {
    await _membershipRepository.fetchTalukaCommitees(commitee).then((value) {
      talukaCommitees.value = value.data;
      onTalukaCommiteeChanged(politicalDetails["taluka_committee"]["name"]);
      talukaCommitees.refresh();
    });
  }

  Future<void> onTalukaCommiteeChanged(String? name) async {
    TalukaCommitee selectedCommitee =
        talukaCommitees.where((p0) => p0.name == name).first;
    politicalDetails["taluka_committee_id"] = selectedCommitee.id.toString();
    await fetchVillageWardCommitees(selectedCommitee);
  }

  RxList<VillageWardCommitee> villageWardCommitees =
      <VillageWardCommitee>[].obs;
  fetchVillageWardCommitees(TalukaCommitee commitee) async {
    await _membershipRepository
        .fetchVillageWardCommitees(commitee)
        .then((value) {
      villageWardCommitees.value = value.data;
      onVillageWardCommiteeChanged(
          politicalDetails["village_ward_committee"]["name"]);
      villageWardCommitees.refresh();
    });
  }

  Future<void> onVillageWardCommiteeChanged(String? name) async {
    VillageWardCommitee selectedCommitee =
        villageWardCommitees.where((p0) => p0.name == name).first;
    politicalDetails["village_ward_committee_id"] =
        selectedCommitee.id.toString();
  }

  // WORKING
  RxList<OccupationCategory> occupationCategories = <OccupationCategory>[].obs;
  fetchOccupationCategories() async {
    await _membershipRepository.fetchOccupationCategories().then((value) {
      occupationCategories.value = value.data;
      onOccupationCategoryChanged(
          workingDetails["occupation_category"]["name"]);
      occupationCategories.refresh();
    });
  }

  Future<void> onOccupationCategoryChanged(String? name) async {
    OccupationCategory selectedCategory =
        occupationCategories.where((p0) => p0.name == name).first;
    workingDetails["occupation_category_id"] = selectedCategory.id.toString();
    await fetchOccupationSubCategories(selectedCategory);
  }

  RxList<OccupationSubCategory> occupationSubCategories =
      <OccupationSubCategory>[].obs;
  fetchOccupationSubCategories(OccupationCategory commitee) async {
    await _membershipRepository
        .fetchOccupationSubCategories(commitee)
        .then((value) {
      occupationSubCategories.value = value.data;
      onOccupationSubCategoryChanged(
          workingDetails["occupation_subcategory"]["name"]);
      occupationSubCategories.refresh();
    });
  }

  Future<void> onOccupationSubCategoryChanged(String? name) async {
    OccupationSubCategory selectedCategory =
        occupationSubCategories.where((p0) => p0.name == name).first;
    workingDetails["occupation_subcategory_id"] =
        selectedCategory.id.toString();
  }

  //SCHEME
  RxBool usedSchemeBefore = false.obs;
}
