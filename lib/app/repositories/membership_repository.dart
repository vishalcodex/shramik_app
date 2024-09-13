import 'dart:developer';

import 'package:get/get.dart';
import 'package:shramik/app/models/family_details_model.dart';

import '../models/api_response.dart';
import '../models/caste_model.dart';
import '../models/city_model.dart';
import '../models/district_commitee_model.dart';
import '../models/district_model.dart';
import '../models/mp_commitee_model.dart';
import '../models/occupation_category.dart';
import '../models/personal_details_model.dart';
import '../models/political_details_model.dart';
import '../models/regional_commitee_model.dart';
import '../models/occupation_sub_category_model.dart';
import '../models/scheme_details_model.dart';
import '../models/sub_caste_model.dart';
import '../models/taluka_commitee_model.dart';
import '../models/taluka_model.dart';
import '../models/village_ward_commitee_model.dart';
import '../models/working_details_model.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;

class MembershipRepository {
  late ApiProvider apiProvider;

  MembershipRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  //PERSONAL
  Future<ApiResponse> fetchDistricts() async {
    // var body = dio.FormData.fromMap(data);
    return await apiProvider.makeAPICall("GET", "districts", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = (value.data["data"] as List)
            .map((e) => District.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchTalukasByDistrict(District district) async {
    // var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("GET", "talukas/${district.id}", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = (value.data["data"] as List)
            .map((e) => Taluka.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchCitiesByTaluka(Taluka taluka) async {
    // var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("GET", "cities/${taluka.id}", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data =
            (value.data["data"] as List).map((e) => City.fromJson(e)).toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchCaste() async {
    // var body = dio.FormData.fromMap(data);
    return await apiProvider.makeAPICall("GET", "caste", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data =
            (value.data["data"] as List).map((e) => Caste.fromJson(e)).toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchSubCaste(Caste caste) async {
    // var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("GET", "subcaste/${caste.id}", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = (value.data["data"] as List)
            .map((e) => SubCaste.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> savePersonalDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    body.fields.removeWhere((element) => element.key == "image");
    if (!data["image"].toString().contains("http")) {
      body.files.add(
        MapEntry(
          "image",
          await dio.MultipartFile.fromFile(data["image"],
              filename: data["image"].toString().split("/").last),
        ),
      );
    }
    return await apiProvider
        .makeAPICall("POST", "update/member-details", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchPersonalDetails() async {
    return await apiProvider
        .makeAPICall("GET", "member-details", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = PersonalDetails.fromJson(value.data["data"]);
      } else {}
      return value;
    });
  }

  //POLITICAL
  Future<ApiResponse> fetchMPCommitees() async {
    // var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("GET", "mp-committees", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = (value.data["data"] as List)
            .map((e) => MPCommitee.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchRegionalCommitees(MPCommitee commitee) async {
    return await apiProvider.makeAPICall(
        "GET", "regional-committees/${commitee.id}", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = (value.data["data"] as List)
            .map((e) => RegionalCommitee.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchDistrictCommitees(RegionalCommitee commitee) async {
    return await apiProvider.makeAPICall(
        "GET", "district-committees/${commitee.id}", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = (value.data["data"] as List)
            .map((e) => DistrictCommitee.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchTalukaCommitees(DistrictCommitee commitee) async {
    return await apiProvider.makeAPICall(
        "GET", "taluka-committees/${commitee.id}", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = (value.data["data"] as List)
            .map((e) => TalukaCommitee.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchVillageWardCommitees(TalukaCommitee commitee) async {
    return await apiProvider.makeAPICall(
        "GET", "village-ward-committees/${commitee.id}", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = (value.data["data"] as List)
            .map((e) => VillageWardCommitee.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> savePoliticalDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "update/political-details", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchPoliticalDetails() async {
    return await apiProvider
        .makeAPICall("GET", "political-details", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = PoliticalDetails.fromJson(value.data["data"]);
      } else {}
      return value;
    });
  }

  //WORKING

  Future<ApiResponse> fetchOccupationCategories() async {
    return await apiProvider
        .makeAPICall("GET", "occupation-categories", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = (value.data["data"] as List)
            .map((e) => OccupationCategory.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchOccupationSubCategories(
      OccupationCategory occupationCategory) async {
    return await apiProvider.makeAPICall("GET",
        "occupation-subcategories/${occupationCategory.id}", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = (value.data["data"] as List)
            .map((e) => OccupationSubCategory.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> saveWorkingDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "update/working-details", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchWorkingDetails() async {
    return await apiProvider
        .makeAPICall("GET", "working-details", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = WorkingDetails.fromJson(value.data["data"]);
      } else {}
      return value;
    });
  }

  Future<ApiResponse> fetchSchemeDetails() async {
    return await apiProvider
        .makeAPICall("GET", "govt-scheme-details", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = SchemeDetails.fromJson(value.data["data"]);
      } else {}
      return value;
    });
  }

  //FAMILY
  Future<ApiResponse> saveFamilyDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "update/family-details", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchFamilyDetails() async {
    return await apiProvider
        .makeAPICall("GET", "family-details", {}).then((value) {
      if (Status.COMPLETED == value.status) {
        value.data = FamilyDetails.fromJson(value.data["data"]);
      } else {}
      return value;
    });
  }

  //SCHEME
  Future<ApiResponse> saveSchemeDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "update/govt-scheme-details", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }
}
