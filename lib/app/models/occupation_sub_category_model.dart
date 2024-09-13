class OccupationSubCategory {
  int? id;
  int? occupationCategoryId;
  String? name;
  String? createdAt;
  String? updatedAt;

  OccupationSubCategory(
      {this.id,
      this.occupationCategoryId,
      this.name,
      this.createdAt,
      this.updatedAt});

  OccupationSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    occupationCategoryId = json['occupation_category_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['occupation_category_id'] = this.occupationCategoryId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
