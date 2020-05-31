class ScheduleModel {
  int id;
  String dateStart;
  String dateEnd;
  int scheduleFkHealthRegister;

  ScheduleModel(
      {this.id, this.dateStart, this.dateEnd, this.scheduleFkHealthRegister});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    scheduleFkHealthRegister = json['schedule_fk_healthRegister'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['date_start'] = this.dateStart;
    data['date_end'] = this.dateEnd;
    data['schedule_fk_healthRegister'] = this.scheduleFkHealthRegister;
    return data;
  }
}
