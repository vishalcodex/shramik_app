import 'package:shramik/app/providers/api_endpoints.dart';

import 'city_model.dart';
import 'district_model.dart';
import 'taluka_model.dart';

class PersonalDetails {
  int? id;
  int? userId;
  String? phone;
  String? name;
  String? whatsapp;
  String? telegram;
  String? email;
  String? dob;
  String? marriageAnniversaryDate;
  String? bloodGroup;
  String? gender;
  String? aadharcardNumber;
  String? pancardNumber;
  String? currentResidentAddress;
  int? currentDistrictId;
  int? currentTalukaId;
  int? currentCityId;
  String? currentPincode;
  String? nativeAddress;
  int? nativeDistrictId;
  int? nativeTalukaId;
  int? nativeCityId;
  String? nativePincode;
  String? nomineeRelation;
  String? nomineeDob;
  String? nomineeName;
  String? nomineeContactNumber;
  String? nomineeEducation;
  String? image;
  String? createdAt;
  String? updatedAt;
  District? currentDistrict;
  Taluka? currentTaluka;
  City? currentCity;
  District? nativeDistrict;
  Taluka? nativeTaluka;
  City? nativeCity;

  PersonalDetails(
      {this.id,
      this.userId,
      this.phone,
      this.whatsapp,
      this.telegram,
      this.email,
      this.dob,
      this.marriageAnniversaryDate,
      this.bloodGroup,
      this.gender,
      this.aadharcardNumber,
      this.pancardNumber,
      this.currentResidentAddress,
      this.currentDistrictId,
      this.currentTalukaId,
      this.currentCityId,
      this.currentPincode,
      this.nativeAddress,
      this.nativeDistrictId,
      this.nativeTalukaId,
      this.nativeCityId,
      this.nativePincode,
      this.nomineeRelation,
      this.nomineeDob,
      this.nomineeContactNumber,
      this.nomineeEducation,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.currentDistrict,
      this.currentTaluka,
      this.currentCity,
      this.nativeDistrict,
      this.nativeTaluka,
      this.nativeCity});

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['username'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    telegram = json['telegram'];
    email = json['email'];
    dob = json['dob'];
    marriageAnniversaryDate = json['marriage_anniversary_date'];
    bloodGroup = json['blood_group'];
    gender = json['gender'];
    aadharcardNumber = json['aadharcard_number'];
    pancardNumber = json['pancard_number'];
    currentResidentAddress = json['current_resident_address'];
    currentDistrictId = json['current_district_id'];
    currentTalukaId = json['current_taluka_id'];
    currentCityId = json['current_city_id'];
    currentPincode = json['current_pincode'];
    nativeAddress = json['native_address'];
    nativeDistrictId = json['native_district_id'];
    nativeTalukaId = json['native_taluka_id'];
    nativeCityId = json['native_city_id'];
    nativePincode = json['native_pincode'];
    nomineeRelation = json['nominee_relation'];
    nomineeDob = json['nominee_dob'];
    nomineeName = json['nominee_name'];
    nomineeContactNumber = json['nominee_contact_number'];
    nomineeEducation = json['nominee_education'];
    image = Urls.getImageUrl(json['image']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    currentDistrict = json['current_district'] != null
        ? new District.fromJson(json['current_district'])
        : null;
    currentTaluka = json['current_taluka'] != null
        ? new Taluka.fromJson(json['current_taluka'])
        : null;
    currentCity = json['current_city'] != null
        ? new City.fromJson(json['current_city'])
        : null;
    nativeDistrict = json['native_district'] != null
        ? new District.fromJson(json['native_district'])
        : null;
    nativeTaluka = json['native_taluka'] != null
        ? new Taluka.fromJson(json['native_taluka'])
        : null;
    nativeCity = json['native_city'] != null
        ? new City.fromJson(json['native_city'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['phone'] = this.phone;
    data['username'] = this.name;
    data['whatsapp'] = this.whatsapp;
    data['telegram'] = this.telegram;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['marriage_anniversary_date'] = this.marriageAnniversaryDate;
    data['blood_group'] = this.bloodGroup;
    data['gender'] = this.gender;
    data['aadharcard_number'] = this.aadharcardNumber;
    data['pancard_number'] = this.pancardNumber;
    data['current_resident_address'] = this.currentResidentAddress;
    data['current_district_id'] = this.currentDistrictId;
    data['current_taluka_id'] = this.currentTalukaId;
    data['current_city_id'] = this.currentCityId;
    data['current_pincode'] = this.currentPincode;
    data['native_address'] = this.nativeAddress;
    data['native_district_id'] = this.nativeDistrictId;
    data['native_taluka_id'] = this.nativeTalukaId;
    data['native_city_id'] = this.nativeCityId;
    data['native_pincode'] = this.nativePincode;
    data['nominee_relation'] = this.nomineeRelation;
    data['nominee_dob'] = this.nomineeDob;
    data['nominee_name'] = this.nomineeName;
    data['nominee_contact_number'] = this.nomineeContactNumber;
    data['nominee_education'] = this.nomineeEducation;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.currentDistrict != null) {
      data['current_district'] = this.currentDistrict!.toJson();
    }
    if (this.currentTaluka != null) {
      data['current_taluka'] = this.currentTaluka!.toJson();
    }
    if (this.currentCity != null) {
      data['current_city'] = this.currentCity!.toJson();
    }
    if (this.nativeDistrict != null) {
      data['native_district'] = this.nativeDistrict!.toJson();
    }
    if (this.nativeTaluka != null) {
      data['native_taluka'] = this.nativeTaluka!.toJson();
    }
    if (this.nativeCity != null) {
      data['native_city'] = this.nativeCity!.toJson();
    }
    return data;
  }
}
