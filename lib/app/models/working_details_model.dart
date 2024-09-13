import 'occupation_category.dart';
import 'occupation_sub_category_model.dart';

class WorkingDetails {
  int? id;
  int? userId;
  String? midcName;
  int? occupationCategoryId;
  int? occupationSubcategoryId;
  String? companyName;
  String? companyAddress;
  String? companyPincode;
  String? accountablePersonName;
  String? accountablePersonContactNumber;
  String? pfNumber;
  String? stateLaborInsuranceScheme;
  String? createdAt;
  String? updatedAt;
  OccupationCategory? occupationCategory;
  OccupationSubCategory? occupationSubcategory;

  WorkingDetails(
      {this.id,
      this.userId,
      this.midcName,
      this.occupationCategoryId,
      this.occupationSubcategoryId,
      this.companyName,
      this.companyAddress,
      this.companyPincode,
      this.accountablePersonName,
      this.accountablePersonContactNumber,
      this.pfNumber,
      this.stateLaborInsuranceScheme,
      this.createdAt,
      this.updatedAt,
      this.occupationCategory,
      this.occupationSubcategory});

  WorkingDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    midcName = json['midc_name'];
    occupationCategoryId = json['occupation_category_id'];
    occupationSubcategoryId = json['occupation_subcategory_id'];
    companyName = json['company_name'];
    companyAddress = json['company_address'];
    companyPincode = json['company_pincode'];
    accountablePersonName = json['accountable_person_name'];
    accountablePersonContactNumber = json['accountable_person_contact_number'];
    pfNumber = json['pf_number'];
    stateLaborInsuranceScheme = json['state_labor_insurance_scheme'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    occupationCategory = json['occupation_category'] != null
        ? new OccupationCategory.fromJson(json['occupation_category'])
        : null;
    occupationSubcategory = json['occupation_subcategory'] != null
        ? new OccupationSubCategory.fromJson(json['occupation_subcategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['midc_name'] = this.midcName;
    data['occupation_category_id'] = this.occupationCategoryId;
    data['occupation_subcategory_id'] = this.occupationSubcategoryId;
    data['company_name'] = this.companyName;
    data['company_address'] = this.companyAddress;
    data['company_pincode'] = this.companyPincode;
    data['accountable_person_name'] = this.accountablePersonName;
    data['accountable_person_contact_number'] =
        this.accountablePersonContactNumber;
    data['pf_number'] = this.pfNumber;
    data['state_labor_insurance_scheme'] = this.stateLaborInsuranceScheme;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.occupationCategory != null) {
      data['occupation_category'] = this.occupationCategory!.toJson();
    }
    if (this.occupationSubcategory != null) {
      data['occupation_subcategory'] = this.occupationSubcategory!.toJson();
    }
    return data;
  }
}
