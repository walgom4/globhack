import 'package:dio/dio.dart';

class HealthRegistryModel {
  String url;
  int id;
  bool flu;
  bool fever;
  bool cough;
  bool soreThroat;
  bool nasalCongestion;
  bool fatigue;
  bool difficultBreathe;
  bool musclePain;
  bool diarrhea;
  bool threwUp;
  String other;
  String userFkHealth;
  double temperature;
  MultipartFile photoTemperature;
  String photoTemperatureUrl;
  MultipartFile photoWorkspace;
  String photoWorkspaceUrl;
  MultipartFile photoSelfie;
  String photoSelfieUrl;
  String observations;
  bool healthCondition;
  MultipartFile medicalFile;
  bool ill;
  String whoIll;
  String date;
  bool home;
  bool bad;

  HealthRegistryModel({
    this.url,
    this.id,
    this.flu = false,
    this.fever = false,
    this.cough = false,
    this.soreThroat = false,
    this.nasalCongestion = false,
    this.fatigue = false,
    this.difficultBreathe = false,
    this.musclePain = false,
    this.diarrhea = false,
    this.threwUp = false,
    this.other,
    this.userFkHealth,
    this.temperature,
    this.photoTemperature,
    this.photoTemperatureUrl,
    this.photoWorkspace,
    this.photoWorkspaceUrl,
    this.photoSelfie,
    this.photoSelfieUrl,
    this.observations,
    this.healthCondition = false,
    this.medicalFile,
    this.ill = false,
    this.whoIll,
    this.date,
    this.home = false,
    this.bad = false,
  });

  HealthRegistryModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    flu = json['flu'];
    fever = json['fever'];
    cough = json['cough'];
    soreThroat = json['sore_throat'];
    nasalCongestion = json['nasal_congestion'];
    fatigue = json['fatigue'];
    difficultBreathe = json['difficult_breathe'];
    musclePain = json['muscle_pain'];
    diarrhea = json['diarrhea'];
    threwUp = json['threw_up'];
    other = json['other'];
    userFkHealth = json['user_fk_health'];
    temperature = json['temperature'];
    photoTemperatureUrl = json['photo_temperature'];
    photoWorkspaceUrl = json['photo_workspace'];
    photoSelfieUrl = json['photo_selfie'];
    observations = json['observations'];
    healthCondition = json['health_condition'];
    medicalFile = json['medical_file'];
    ill = json['ill'];
    whoIll = json['who_ill'];
    date = json['date'];
    home = json['home'];
    bad = json['bad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    data['flu'] = this.flu;
    data['fever'] = this.fever;
    data['cough'] = this.cough;
    data['sore_throat'] = this.soreThroat;
    data['nasal_congestion'] = this.nasalCongestion;
    data['fatigue'] = this.fatigue;
    data['difficult_breathe'] = this.difficultBreathe;
    data['muscle_pain'] = this.musclePain;
    data['diarrhea'] = this.diarrhea;
    data['threw_up'] = this.threwUp;
    data['other'] = this.other;
    data['user_fk_health'] = this.userFkHealth;
    data['temperature'] = this.temperature;
    data['photo_temperature'] = this.photoTemperature;
    data['photo_workspace'] = this.photoWorkspace;
    data['photo_selfie'] = this.photoSelfie;
    data['observations'] = this.observations;
    data['health_condition'] = this.healthCondition;
    data['medical_file'] = this.medicalFile;
    data['ill'] = this.ill;
    data['who_ill'] = this.whoIll;
    data['date'] = this.date;
    data['home'] = this.home;
    data['bad'] = this.bad;
    return data;
  }
}
