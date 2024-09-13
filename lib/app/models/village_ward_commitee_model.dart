class VillageWardCommitee {
  int? id;
  int? talukaCommitteeId;
  String? name;
  String? createdAt;
  String? updatedAt;

  VillageWardCommitee(
      {this.id,
      this.talukaCommitteeId,
      this.name,
      this.createdAt,
      this.updatedAt});

  VillageWardCommitee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    talukaCommitteeId = json['taluka_committee_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['taluka_committee_id'] = this.talukaCommitteeId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
