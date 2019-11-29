import 'dart:convert';

class InstituteListModel {
  dynamic cityName;
  dynamic location;
  dynamic remarks;
  dynamic email1;
  dynamic email2;
  dynamic stateName;
  dynamic countryName;
  String pincode;
  dynamic districtName;
  dynamic phone2;
  dynamic phone1;
  String address;
  String name;
  String instituteId;

  static InstituteListModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    InstituteListModel instituteListModelBean = InstituteListModel();
    instituteListModelBean.cityName = map['city_name'];
    instituteListModelBean.location = map['location'];
    instituteListModelBean.remarks = map['remarks'];
    instituteListModelBean.email1 = map['email_1'];
    instituteListModelBean.email2 = map['email_2'];
    instituteListModelBean.stateName = map['state_name'];
    instituteListModelBean.countryName = map['country_name'];
    instituteListModelBean.pincode = map['pincode'];
    instituteListModelBean.districtName = map['district_name'];
    instituteListModelBean.phone2 = map['phone_2'];
    instituteListModelBean.phone1 = map['phone_1'];
    instituteListModelBean.address = map['address'];
    instituteListModelBean.name = map['name'];
    instituteListModelBean.instituteId = map['institute_id'];
    return instituteListModelBean;
  }

  Map toJson() => {
    "city_name": cityName,
    "location": location,
    "remarks": remarks,
    "email_1": email1,
    "email_2": email2,
    "state_name": stateName,
    "country_name": countryName,
    "pincode": pincode,
    "district_name": districtName,
    "phone_2": phone2,
    "phone_1": phone1,
    "address": address,
    "name": name,
    "institute_id": instituteId,
  };

  @override
  String toString() {
    return 'InstituteListModel{cityName: $cityName, location: $location, remarks: $remarks, email1: $email1, email2: $email2, stateName: $stateName, countryName: $countryName, pincode: $pincode, districtName: $districtName, phone2: $phone2, phone1: $phone1, address: $address, name: $name, instituteId: $instituteId}';
  }


}


class InstituteList
{
  static List<InstituteListModel> fromJson(String raw_json){

    Iterable l = json.decode(raw_json);
    List<InstituteListModel> institutes = l.map((model)=> InstituteListModel.fromMap(model)).toList();
    return institutes;
  }
}