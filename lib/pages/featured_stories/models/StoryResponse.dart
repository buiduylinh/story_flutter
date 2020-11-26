class Store {
  List<Data> data;
  int status;
  String message;

  Store({this.data, this.status, this.message});

  Store.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int id;
  String title;
  String description;
  String createdAt;
  String updatedAt;
  int status;
  int flagging;
  List<CategoryList> categoryList;

  Data(
      {this.id,
        this.title,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.flagging,
        this.categoryList});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    flagging = json['flagging'];
    if (json['category_list'] != null) {
      categoryList = new List<CategoryList>();
      json['category_list'].forEach((v) {
        categoryList.add(new CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['flagging'] = this.flagging;
    if (this.categoryList != null) {
      data['category_list'] = this.categoryList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  int id;
  String title;
  int sort;
  String categoryType;
  int viewTotal;
  String path;
  String image;
  String storyDescription;
  int timeTotal;
  String createdAt;
  String updatedAt;
  int statusVip;
  int type;
  int status;
  int flagging;

  CategoryList(
      {this.id,
        this.title,
        this.sort,
        this.categoryType,
        this.viewTotal,
        this.path,
        this.image,
        this.storyDescription,
        this.timeTotal,
        this.createdAt,
        this.updatedAt,
        this.statusVip,
        this.type,
        this.status,
        this.flagging});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sort = json['sort'];
    categoryType = json['category_type'];
    viewTotal = json['view_total'];
    path = json['path'];
    image = json['image'];
    storyDescription = json['story_description'];
    timeTotal = json['time_total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    statusVip = json['status_vip'];
    type = json['type'];
    status = json['status'];
    flagging = json['flagging'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sort'] = this.sort;
    data['category_type'] = this.categoryType;
    data['view_total'] = this.viewTotal;
    data['path'] = this.path;
    data['image'] = this.image;
    data['story_description'] = this.storyDescription;
    data['time_total'] = this.timeTotal;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status_vip'] = this.statusVip;
    data['type'] = this.type;
    data['status'] = this.status;
    data['flagging'] = this.flagging;
    return data;
  }
}
