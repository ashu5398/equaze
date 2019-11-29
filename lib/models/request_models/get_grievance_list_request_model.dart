class GetGrievanceListRequestModel {
  String status;
  String caseReferenceId;
  String nameOfRequester;
  String assignee;
  String roleId;
  String priorities;
  String date;
  String dateTo;
  String roleName;


  GetGrievanceListRequestModel.custom(this.status, this.caseReferenceId,
      this.nameOfRequester, this.assignee, this.roleId, this.priorities,
      this.date, this.dateTo, this.roleName);

  GetGrievanceListRequestModel();

  static GetGrievanceListRequestModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GetGrievanceListRequestModel getGrievanceListRequestModelBean = GetGrievanceListRequestModel();
    getGrievanceListRequestModelBean.status = map['status'];
    getGrievanceListRequestModelBean.caseReferenceId = map['case_reference_id'];
    getGrievanceListRequestModelBean.nameOfRequester = map['name_of_requester'];
    getGrievanceListRequestModelBean.assignee = map['assignee'];
    getGrievanceListRequestModelBean.roleId = map['role_id'];
    getGrievanceListRequestModelBean.priorities = map['priorities'];
    getGrievanceListRequestModelBean.date = map['date'];
    getGrievanceListRequestModelBean.dateTo = map['date_to'];
    getGrievanceListRequestModelBean.roleName = map['role_name'];
    return getGrievanceListRequestModelBean;
  }

  Map toJson() => {
    "status": status,
    "case_reference_id": caseReferenceId,
    "name_of_requester": nameOfRequester,
    "assignee": assignee,
    "role_id": roleId,
    "priorities": priorities,
    "date": date,
    "date_to": dateTo,
    "role_name": roleName,
  };
}