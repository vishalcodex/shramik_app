import 'blog_model.dart';

class Category {
  String? catId;
  String? catName;
  String? urltitle;
  String? categoryImage;
  List<Blog>? blogs;

  Category({this.catId, this.catName, this.urltitle, this.categoryImage});

  Category.fromJson(Map<String, dynamic> json) {
    catId = json['id'].toString();
    catName = json['name'];
    // urltitle = json['urltitle'];
    categoryImage = json['image'];
    if (json["blogs"] != null) {
      blogs = (json["blogs"] as List).map((e) => Blog.fromJson(e)).toList();
    } else {
      blogs = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['urltitle'] = this.urltitle;
    data['category_image'] = this.categoryImage;
    return data;
  }
}
