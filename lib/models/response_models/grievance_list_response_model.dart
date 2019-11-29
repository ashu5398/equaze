import 'dart:convert';

class GrievanceListResponseModel {
  String priorityId;
  String nameOfRequester;
  String designationId;
  String remarks;
  String raiseRequestAs;
  String id;
  String estimatedResolutionTime;
  String title;
  String lastModifiedBy;
  String statusName;
  String description;
  String createdAt;
  dynamic userId;
  String instituteId;
  String caseReferenceId;
  String subCategory;
  String createdBy;
  dynamic assignee;
  dynamic sectionId;
  String contactNumber;
  String category;
  String idCardUrl;
  String lastModifiedAt;
  String subSubCategory;
  String queryDirectedAgainst;
  String queryDirectedAgainstDesignation;

  static GrievanceListResponseModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GrievanceListResponseModel grievanceListResponseModelBean = GrievanceListResponseModel();
    grievanceListResponseModelBean.priorityId = map['priority_id'];
    grievanceListResponseModelBean.nameOfRequester = map['name_of_requester'];
    grievanceListResponseModelBean.designationId = map['designation_id'];
    grievanceListResponseModelBean.remarks = map['remarks'];
    grievanceListResponseModelBean.raiseRequestAs = map['raise_request_as'];
    grievanceListResponseModelBean.id = map['id'];
    grievanceListResponseModelBean.estimatedResolutionTime = map['estimated_resolution_time'];
    grievanceListResponseModelBean.title = map['title'];
    grievanceListResponseModelBean.lastModifiedBy = map['last_modified_by'];
    grievanceListResponseModelBean.statusName = map['status_name'];
    grievanceListResponseModelBean.description = map['description'];
    grievanceListResponseModelBean.createdAt = map['created_at'];
    grievanceListResponseModelBean.userId = map['user_id'];
    grievanceListResponseModelBean.instituteId = map['institute_id'];
    grievanceListResponseModelBean.caseReferenceId = map['case_reference_id'];
    grievanceListResponseModelBean.subCategory = map['sub_category'];
    grievanceListResponseModelBean.createdBy = map['created_by'];
    grievanceListResponseModelBean.assignee = map['assignee'];
    grievanceListResponseModelBean.sectionId = map['section_id'];
    grievanceListResponseModelBean.contactNumber = map['contact_number'];
    grievanceListResponseModelBean.category = map['category'];
    grievanceListResponseModelBean.idCardUrl = map['id_card_url'];
    grievanceListResponseModelBean.lastModifiedAt = map['last_modified_at'];
    grievanceListResponseModelBean.subSubCategory = map['sub_sub_category'];
    grievanceListResponseModelBean.queryDirectedAgainst = map['query_directed_against'];
    grievanceListResponseModelBean.queryDirectedAgainstDesignation = map['query_directed_against_designation'];
    return grievanceListResponseModelBean;
  }
}


class GrievanceList
{
  static List<GrievanceListResponseModel> fromJson(String rawJson)
  {
    Iterable l = json.decode(rawJson);
    List<GrievanceListResponseModel> grievances = l.map((model)=> GrievanceListResponseModel.fromMap(model)).toList();
    return grievances;
  }
}