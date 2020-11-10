class Story {
  int index;
  String imageUrl;
  String name;
  String type;
  int viewNum;
  bool star;

  Story(this.index, this.imageUrl, this.name, this.type, this.viewNum, [this.star = false]);
}
