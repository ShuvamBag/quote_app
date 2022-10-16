class AuthorModel {
  String? sId;
  String? name;
  String? link;
  String? bio;
  String? description;
  int? quoteCount;
  String? slug;
  String? dateAdded;
  String? dateModified;

  AuthorModel(
      {this.sId,
        this.name,
        this.link,
        this.bio,
        this.description,
        this.quoteCount,
        this.slug,
        this.dateAdded,
        this.dateModified});

  AuthorModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    link = json['link'];
    bio = json['bio'];
    description = json['description'];
    quoteCount = json['quoteCount'];
    slug = json['slug'];
    dateAdded = json['dateAdded'];
    dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['link'] = this.link;
    data['bio'] = this.bio;
    data['description'] = this.description;
    data['quoteCount'] = this.quoteCount;
    data['slug'] = this.slug;
    data['dateAdded'] = this.dateAdded;
    data['dateModified'] = this.dateModified;
    return data;
  }
}