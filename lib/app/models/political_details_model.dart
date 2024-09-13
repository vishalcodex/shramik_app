import 'package:shramik/app/models/mp_commitee_model.dart';
import 'package:shramik/app/models/regional_commitee_model.dart';

import 'district_commitee_model.dart';
import 'taluka_commitee_model.dart';
import 'village_ward_commitee_model.dart';

class PoliticalDetails {
  int? id;
  int? userId;
  int? mPCommitteeId;
  int? regionalCommitteeId;
  int? districtCommitteeId;
  int? talukaCommitteeId;
  int? villageWardCommitteeId;
  String? createdAt;
  String? updatedAt;
  MPCommitee? mpCommittee;
  RegionalCommitee? regionalCommittee;
  DistrictCommitee? districtCommittee;
  TalukaCommitee? talukaCommittee;
  VillageWardCommitee? villageWardCommittee;

  PoliticalDetails(
      {this.id,
      this.userId,
      this.mPCommitteeId,
      this.regionalCommitteeId,
      this.districtCommitteeId,
      this.talukaCommitteeId,
      this.villageWardCommitteeId,
      this.createdAt,
      this.updatedAt,
      this.mpCommittee,
      this.regionalCommittee,
      this.districtCommittee,
      this.talukaCommittee,
      this.villageWardCommittee});

  PoliticalDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    mPCommitteeId = json['m_p_committee_id'];
    regionalCommitteeId = json['regional_committee_id'];
    districtCommitteeId = json['district_committee_id'];
    talukaCommitteeId = json['taluka_committee_id'];
    villageWardCommitteeId = json['village_ward_committee_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mpCommittee = json['mp_committee'] != null
        ? new MPCommitee.fromJson(json['mp_committee'])
        : null;
    regionalCommittee = json['regional_committee'] != null
        ? new RegionalCommitee.fromJson(json['regional_committee'])
        : null;
    districtCommittee = json['district_committee'] != null
        ? new DistrictCommitee.fromJson(json['district_committee'])
        : null;
    talukaCommittee = json['taluka_committee'] != null
        ? new TalukaCommitee.fromJson(json['taluka_committee'])
        : null;
    villageWardCommittee = json['village_ward_committee'] != null
        ? new VillageWardCommitee.fromJson(json['village_ward_committee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['m_p_committee_id'] = this.mPCommitteeId;
    data['regional_committee_id'] = this.regionalCommitteeId;
    data['district_committee_id'] = this.districtCommitteeId;
    data['taluka_committee_id'] = this.talukaCommitteeId;
    data['village_ward_committee_id'] = this.villageWardCommitteeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['mp_committee'] = this.mpCommittee;
    if (this.mpCommittee != null) {
      data['mp_committee'] = this.mpCommittee!.toJson();
    }
    if (this.regionalCommittee != null) {
      data['regional_committee'] = this.regionalCommittee!.toJson();
    }
    if (this.districtCommittee != null) {
      data['district_committee'] = this.districtCommittee!.toJson();
    }
    if (this.talukaCommittee != null) {
      data['taluka_committee'] = this.talukaCommittee!.toJson();
    }
    if (this.villageWardCommittee != null) {
      data['village_ward_committee'] = this.villageWardCommittee!.toJson();
    }
    return data;
  }
}
