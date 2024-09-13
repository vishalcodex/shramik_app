class Ads {
  int? id;
  String? image;
  String? title;
  String? description;

  Ads({this.id, this.image, this.title, this.description});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // image = Urls.baseUrl + json['image'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
