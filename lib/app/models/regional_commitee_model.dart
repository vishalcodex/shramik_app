class RegionalCommitee {
  int? id;
  int? mPCommitteeId;
  String? name;
  String? createdAt;
  String? updatedAt;

  RegionalCommitee(
      {this.id, this.mPCommitteeId, this.name, this.createdAt, this.updatedAt});

  RegionalCommitee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mPCommitteeId = json['m_p_committee_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['m_p_committee_id'] = this.mPCommitteeId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
