class Blog {
  String? blogId;
  String? blogName;
  String? filename;
  String? catId;
  String? blogDetails;
  String? urltitle;
  String? shortDescription;
  String? srno;
  String? catName;

  Blog(
      {this.blogId,
      this.blogName,
      this.filename,
      this.catId,
      this.blogDetails,
      this.urltitle,
      this.shortDescription,
      this.srno,
      this.catName});

  Blog.fromJson(Map<String, dynamic> json) {
    blogId = json['id'].toString();
    blogName = json['title'];
    // filename = Urls.baseUrl + json['filename'];
    filename = json['image'];
    catId = json['news_category_id'].toString();
    blogDetails = json['description'];
    urltitle = json['urltitle'];
    shortDescription = json['description'];
    srno = json['srno'];
    catName = json['cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog_id'] = this.blogId;
    data['blog_name'] = this.blogName;
    data['filename'] = this.filename;
    data['cat_id'] = this.catId;
    data['blog_details'] = this.blogDetails;
    data['urltitle'] = this.urltitle;
    data['short_description'] = this.shortDescription;
    data['srno'] = this.srno;
    data['cat_name'] = this.catName;
    return data;
  }
}
