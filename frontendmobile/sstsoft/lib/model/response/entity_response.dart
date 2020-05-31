class Entity {
  String url;
  int id;
  String name;
  String image;
  String webpage;
  String address;
  String phone;
  int entityTypeFkEntity;

  Entity(
      {this.url,
      this.id,
      this.name,
      this.image,
      this.webpage,
      this.address,
      this.phone,
      this.entityTypeFkEntity});

  Entity.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    name = json['name'];
    image = json['image'];
    webpage = json['webpage'];
    address = json['address'];
    phone = json['phone'];
    entityTypeFkEntity = json['entityType_fk_entity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['webpage'] = this.webpage;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['entityType_fk_entity'] = this.entityTypeFkEntity;
    return data;
  }
}