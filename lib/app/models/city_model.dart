class City {
  int? id;
  int? talukaId;
  String? name;
  String? createdAt;
  String? updatedAt;

  City({this.id, this.talukaId, this.name, this.createdAt, this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    talukaId = json['taluka_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['taluka_id'] = this.talukaId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
