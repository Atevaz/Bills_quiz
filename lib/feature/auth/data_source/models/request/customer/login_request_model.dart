///
/// Code generated by Sita Web Tool https://sita.app/json-to-dart/
///
class LoginRequestModel {

  String? userName;
  String? password;


  LoginRequestModel({
    this.userName,
    this.password,
  });


  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = userName;
    data['password'] = password;
    return data;
  }
}
