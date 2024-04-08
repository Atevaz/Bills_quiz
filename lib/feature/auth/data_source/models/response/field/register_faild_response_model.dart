class RegisterFaildRequestModelData {

  List<String?>? name;
  List<String?>? email;
  List<String?>? phone;
  List<String?>? regionId;
  List<String?>? cityId;
  List<String?>? fcmToken;
  List<String?>? deviceType;
  List<String?>? servicesIds;



  RegisterFaildRequestModelData({
    this.name,
    this.phone,
    this.email,
    this.regionId,
    this.cityId,
    this.servicesIds,
    this.fcmToken,
    this.deviceType,
  });


  RegisterFaildRequestModelData.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      final v = json['name'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      name = arr0;
    }
    if (json['phone'] != null) {
      final v = json['phone'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      phone = arr0;
    }
    if (json['email'] != null) {
      final v = json['email'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      email = arr0;
    }
    if (json['region_id'] != null) {
      final v = json['region_id'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      regionId = arr0;
    }
    if (json['city_id'] != null) {
      final v = json['city_id'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      cityId = arr0;
    }
    if (json['services_ids'] != null) {
      final v = json['services_ids'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      servicesIds = arr0;
    }
    if (json['fcm_token'] != null) {
      final v = json['fcm_token'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      fcmToken = arr0;
    }
    if (json['device_type'] != null) {
      final v = json['device_type'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      deviceType = arr0;
    }
  }
}

class RegisterFaildRequestModel {

  int? status;
  int? code;
  String? message;
  RegisterFaildRequestModelData? data;

  RegisterFaildRequestModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });
  RegisterFaildRequestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code']?.toInt();
    message = json['message']?.toString();
    data = (json['data'] != null) ? RegisterFaildRequestModelData.fromJson(json['data']) : null;
  }

}
