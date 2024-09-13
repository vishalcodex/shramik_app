class SchemeDetails {
  int? id;
  int? userId;
  int? optGovtSchemeBefore;
  String? name;
  String? createdAt;
  String? updatedAt;

  SchemeDetails(
      {this.id,
      this.userId,
      this.optGovtSchemeBefore,
      this.name,
      this.createdAt,
      this.updatedAt});

  SchemeDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    optGovtSchemeBefore = json['opt_govt_scheme_before'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['opt_govt_scheme_before'] = this.optGovtSchemeBefore;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
