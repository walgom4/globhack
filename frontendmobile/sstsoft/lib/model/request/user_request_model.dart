import 'package:dio/dio.dart';

class UserRequestModel {
  String identification;
  String username;
  int idTypeFkUser;
  String email;
  String password;
  String name;
  String lastName;
  String phone;
  String address;
  String birthday;
  String genderFkUser;
  String epsFkUser;
  String job;
  String boss;
  String areaFkUser;
  MultipartFile photo;
  String transportFkUser;
  bool risk;
  String whoRisk;
  bool healthSystem;
  String whoHealth;
  String emergencyContactName;
  String emergencyContactRelationship;
  String emergencyContactPhone;

  UserRequestModel(
      {this.identification,
      this.username,
      this.idTypeFkUser,
      this.email,
      this.password,
      this.name,
      this.lastName,
      this.phone,
      this.address,
      this.birthday,
      this.genderFkUser,
      this.epsFkUser,
      this.job,
      this.boss,
      this.areaFkUser,
      this.photo,
      this.transportFkUser,
      this.risk,
      this.whoRisk,
      this.healthSystem,
      this.whoHealth,
      this.emergencyContactName,
      this.emergencyContactRelationship,
      this.emergencyContactPhone});

  UserRequestModel.fromJson(Map<String, dynamic> json) {
    identification = json['identification'];
    username = json['username'];
    idTypeFkUser = json['idType_fk_user'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    lastName = json['last_name'];
    phone = json['phone'];
    address = json['address'];
    birthday = json['birthday'];
    genderFkUser = json['gender_fk_user'];
    epsFkUser = json['eps_fk_user'];
    job = json['job'];
    boss = json['boss'];
    areaFkUser = json['area_fk_user'];
    photo = json['photo'];
    transportFkUser = json['transport_fk_user'];
    risk = json['risk'];
    whoRisk = json['who_risk'];
    healthSystem = json['health_system'];
    whoHealth = json['who_health'];
    emergencyContactName = json['emergency_contact_name'];
    emergencyContactRelationship = json['emergency_contact_relationship'];
    emergencyContactPhone = json['emergency_contact_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identification'] = this.identification;
    data['username'] = this.username;
    data['idType_fk_user'] = this.idTypeFkUser;
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['birthday'] = this.birthday;
    data['gender_fk_user'] = this.genderFkUser;
    data['eps_fk_user'] = this.epsFkUser;
    data['job'] = this.job;
    data['boss'] = this.boss;
    data['area_fk_user'] = this.areaFkUser;
    data['photo'] = this.photo;
    data['transport_fk_user'] = this.transportFkUser;
    data['risk'] = this.risk;
    data['who_risk'] = this.whoRisk;
    data['health_system'] = this.healthSystem;
    data['who_health'] = this.whoHealth;
    data['emergency_contact_name'] = this.emergencyContactName;
    data['emergency_contact_relationship'] = this.emergencyContactRelationship;
    data['emergency_contact_phone'] = this.emergencyContactPhone;
    return data;
  }
}
