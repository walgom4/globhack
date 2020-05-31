class GenericDataItemResponse {
  String url;
  int id;
  String name;

  GenericDataItemResponse({this.url, this.id, this.name});

  GenericDataItemResponse.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
