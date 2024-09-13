class DistrictCommitee {
  int? id;
  int? regionalCommitteeId;
  String? name;
  String? createdAt;
  String? updatedAt;

  DistrictCommitee(
      {this.id,
      this.regionalCommitteeId,
      this.name,
      this.createdAt,
      this.updatedAt});

  DistrictCommitee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regionalCommitteeId = json['regional_committee_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['regional_committee_id'] = this.regionalCommitteeId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
