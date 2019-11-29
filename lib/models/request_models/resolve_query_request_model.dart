class ResolveQueryRequestModel {
  String newStatus;
  String updatedBy;
  String userRemarks;
  String newAssignee;
  String remarksFromInstitute;
  String caseReferenceId;
  String action;
  String instituteId;


  ResolveQueryRequestModel.create(this.newStatus, this.updatedBy,
      this.userRemarks, this.newAssignee, this.remarksFromInstitute,
      this.caseReferenceId, this.action, this.instituteId);


  ResolveQueryRequestModel();

  static ResolveQueryRequestModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ResolveQueryRequestModel resolveQueryRequestModelBean = ResolveQueryRequestModel();
    resolveQueryRequestModelBean.newStatus = map['new_status'];
    resolveQueryRequestModelBean.updatedBy = map['updated_by'];
    resolveQueryRequestModelBean.userRemarks = map['user_remarks'];
    resolveQueryRequestModelBean.newAssignee = map['new_assignee'];
    resolveQueryRequestModelBean.remarksFromInstitute = map['remarks_from_institute'];
    resolveQueryRequestModelBean.caseReferenceId = map['case_reference_id'];
    resolveQueryRequestModelBean.action = map['action'];
    resolveQueryRequestModelBean.instituteId = map['institute_id'];
    return resolveQueryRequestModelBean;
  }

  Map toJson() => {
    "new_status": newStatus,
    "updated_by": updatedBy,
    "user_remarks": userRemarks,
    "new_assignee": newAssignee,
    "remarks_from_institute": remarksFromInstitute,
    "case_reference_id": caseReferenceId,
    "action": action,
    "institute_id": instituteId,
  };

  @override
  String toString() {
    return 'ResolveQueryRequestModel{newStatus: $newStatus, updatedBy: $updatedBy, userRemarks: $userRemarks, newAssignee: $newAssignee, remarksFromInstitute: $remarksFromInstitute, caseReferenceId: $caseReferenceId, action: $action, instituteId: $instituteId}';
  }


}