class SubCaste {
  int? id;
  int? casteId;
  String? name;
  String? createdAt;
  String? updatedAt;

  SubCaste({this.id, this.casteId, this.name, this.createdAt, this.updatedAt});

  SubCaste.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    casteId = json['caste_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['caste_id'] = this.casteId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
