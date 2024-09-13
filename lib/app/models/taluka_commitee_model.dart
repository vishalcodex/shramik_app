class TalukaCommitee {
  int? id;
  int? districtCommitteeId;
  String? name;
  String? createdAt;
  String? updatedAt;

  TalukaCommitee(
      {this.id,
      this.districtCommitteeId,
      this.name,
      this.createdAt,
      this.updatedAt});

  TalukaCommitee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtCommitteeId = json['district_committee_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district_committee_id'] = this.districtCommitteeId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
