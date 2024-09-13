class FamilyDetails {
  int? id;
  int? userId;
  String? fatherName;
  String? fatherDob;
  String? fatherContactNumber;
  String? fatherEducation;
  String? fatherPersonType;
  String? motherName;
  String? motherDob;
  String? motherContactNumber;
  String? motherEducation;
  String? motherPersonType;
  String? wifeName;
  String? wifeDob;
  String? wifeContactNumber;
  String? wifeEducation;
  String? wifePersonType;
  String? child1Name;
  String? child1Dob;
  String? child1ContactNumber;
  String? child1Education;
  String? child1PersonType;
  String? child2Name;
  String? child2Dob;
  String? child2ContactNumber;
  String? child2Education;
  String? child2PersonType;
  String? createdAt;
  String? updatedAt;

  FamilyDetails(
      {this.id,
      this.userId,
      this.fatherName,
      this.fatherDob,
      this.fatherContactNumber,
      this.fatherEducation,
      this.fatherPersonType,
      this.motherName,
      this.motherDob,
      this.motherContactNumber,
      this.motherEducation,
      this.motherPersonType,
      this.wifeName,
      this.wifeDob,
      this.wifeContactNumber,
      this.wifeEducation,
      this.wifePersonType,
      this.child1Name,
      this.child1Dob,
      this.child1ContactNumber,
      this.child1Education,
      this.child1PersonType,
      this.child2Name,
      this.child2Dob,
      this.child2ContactNumber,
      this.child2Education,
      this.child2PersonType,
      this.createdAt,
      this.updatedAt});

  FamilyDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fatherName = json['father_name'];
    fatherDob = json['father_dob'];
    fatherContactNumber = json['father_contact_number'];
    fatherEducation = json['father_education'];
    fatherPersonType = json['father_person_type'];
    motherName = json['mother_name'];
    motherDob = json['mother_dob'];
    motherContactNumber = json['mother_contact_number'];
    motherEducation = json['mother_education'];
    motherPersonType = json['mother_person_type'];
    wifeName = json['wife_name'];
    wifeDob = json['wife_dob'];
    wifeContactNumber = json['wife_contact_number'];
    wifeEducation = json['wife_education'];
    wifePersonType = json['wife_person_type'];
    child1Name = json['child1_name'];
    child1Dob = json['child1_dob'];
    child1ContactNumber = json['child1_contact_number'];
    child1Education = json['child1_education'];
    child1PersonType = json['child1_person_type'];
    child2Name = json['child2_name'];
    child2Dob = json['child2_dob'];
    child2ContactNumber = json['child2_contact_number'];
    child2Education = json['child2_education'];
    child2PersonType = json['child2_person_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['father_name'] = this.fatherName;
    data['father_dob'] = this.fatherDob;
    data['father_contact_number'] = this.fatherContactNumber;
    data['father_education'] = this.fatherEducation;
    data['father_person_type'] = this.fatherPersonType;
    data['mother_name'] = this.motherName;
    data['mother_dob'] = this.motherDob;
    data['mother_contact_number'] = this.motherContactNumber;
    data['mother_education'] = this.motherEducation;
    data['mother_person_type'] = this.motherPersonType;
    data['wife_name'] = this.wifeName;
    data['wife_dob'] = this.wifeDob;
    data['wife_contact_number'] = this.wifeContactNumber;
    data['wife_education'] = this.wifeEducation;
    data['wife_person_type'] = this.wifePersonType;
    data['child1_name'] = this.child1Name;
    data['child1_dob'] = this.child1Dob;
    data['child1_contact_number'] = this.child1ContactNumber;
    data['child1_education'] = this.child1Education;
    data['child1_person_type'] = this.child1PersonType;
    data['child2_name'] = this.child2Name;
    data['child2_dob'] = this.child2Dob;
    data['child2_contact_number'] = this.child2ContactNumber;
    data['child2_education'] = this.child2Education;
    data['child2_person_type'] = this.child2PersonType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
