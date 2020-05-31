class Resources {
  String url;
  int id;
  String code;
  String image;
  String resourceUrl;
  String text;

  Resources(
      {this.url, this.id, this.code, this.image, this.resourceUrl, this.text});

  Resources.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    code = json['code'];
    image = json['image'];
    resourceUrl = json['resource_url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    data['code'] = this.code;
    data['image'] = this.image;
    data['resource_url'] = this.resourceUrl;
    data['text'] = this.text;
    return data;
  }
}