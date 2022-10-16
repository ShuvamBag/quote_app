class SearchModel {
  int? count;
  int? totalCount;
  int? page;
  int? totalPages;
  int? lastItemIndex;
  List<Results>? results;

  SearchModel(
      {this.count,
        this.totalCount,
        this.page,
        this.totalPages,
        this.lastItemIndex,
        this.results});

  SearchModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalCount = json['totalCount'];
    page = json['page'];
    totalPages = json['totalPages'];
    lastItemIndex = json['lastItemIndex'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['totalCount'] = this.totalCount;
    data['page'] = this.page;
    data['totalPages'] = this.totalPages;
    data['lastItemIndex'] = this.lastItemIndex;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? sId;
  String? content;
  String? author;
  List<String>? tags;
  String? authorId;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  Results(
      {this.sId,
        this.content,
        this.author,
        this.tags,
        this.authorId,
        this.authorSlug,
        this.length,
        this.dateAdded,
        this.dateModified});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    author = json['author'];
    tags = json['tags'].cast<String>();
    authorId = json['authorId'];
    authorSlug = json['authorSlug'];
    length = json['length'];
    dateAdded = json['dateAdded'];
    dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['content'] = this.content;
    data['author'] = this.author;
    data['tags'] = this.tags;
    data['authorId'] = this.authorId;
    data['authorSlug'] = this.authorSlug;
    data['length'] = this.length;
    data['dateAdded'] = this.dateAdded;
    data['dateModified'] = this.dateModified;
    return data;
  }
}
