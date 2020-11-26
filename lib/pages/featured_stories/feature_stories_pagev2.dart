import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyenthieunhi/CustomAppbar.dart';
import 'package:truyenthieunhi/generated/r.dart';
import 'package:truyenthieunhi/pages/featured_stories/models/Addition.dart';
import 'package:truyenthieunhi/pages/featured_stories/models/Link.dart';
import 'package:truyenthieunhi/pages/featured_stories/models/Slide.dart';
import 'package:truyenthieunhi/pages/featured_stories/models/Story.dart';
import 'package:truyenthieunhi/pages/featured_stories/models/StoryResponse.dart';
import 'package:truyenthieunhi/pages/featured_stories/models/Title.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:truyenthieunhi/pages/http.dart';

final List<String> imgList = [
  R.img_slide1,
  R.img_slide2,
  R.img_slide3,
  R.img_slide4
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(20),
            child: ClipRRect(
                child: Stack(
              children: <Widget>[
                Image.asset(item, fit: BoxFit.cover, width: 1000.0),
              ],
            )),
          ),
        ))
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.map((url) {
          int index = imgList.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? Color.fromRGBO(0, 0, 0, 0.9)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

class FeatureStoriesPageV2 extends StatefulWidget {
  @override
  _FeatureStoriesPageV2State createState() => _FeatureStoriesPageV2State();
}

class _FeatureStoriesPageV2State extends State<FeatureStoriesPageV2> {
  List list = List();

  List<String> listImage = List();

  _initList() async {
    Response response = await Http.instance.getListStore();

    Slide slide = Slide();
    list.add(slide);

    Store store = Store.fromJson(response.data);

    for (int i = 0; i < store.data.length; i++) {
      StoryTitle title = StoryTitle(store.data[i].title);
      list.add(title);
      for (int j = 0; j < store.data[i].categoryList.length; j++) {
        CategoryList categoryList = store.data[i].categoryList[j];
        Story story = Story(categoryList.id, "", categoryList.title??"", "Truyện Kiều", categoryList.viewTotal);
        list.add(story);
      }
    }

    Addition addition1 = Addition();
    list.add(addition1);

    StoryTitle title3 = StoryTitle("Thể loại truyện");
    list.add(title3);

    Link link = Link("Truyện cổ tích Việt Nam");
    list.add(link);
    Link link1 = Link("Truyện cổ tích thế giới");
    list.add(link1);
    Link link2 = Link("Truyện cổ tích Việt Nam");
    list.add(link2);
    Link link3 = Link("Truyện cổ tích thế giới");
    list.add(link3);
    listImage.add(R.img_slide1);
    listImage.add(R.img_slide2);
    listImage.add(R.img_slide3);
    listImage.add(R.img_slide4);

    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    _initList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppbar(
              child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20, right: 5),
                  child: Image.asset(R.img_menu)),
              Expanded(
                child: Container(
                    child: FlatButton.icon(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  label: Text("Tìm Kiếm Truyện"),
                  icon: Image.asset(R.img_search),
                )),
              ),
              Container(
                  margin: EdgeInsets.only(left: 5, right: 20),
                  child: Image.asset(R.img_vip))
            ],
          )),
          body: ListView.builder(
              itemCount: list.length, itemBuilder: _buildItemView)),
    );
  }

  Widget _buildItemView(BuildContext context, int index) {
    if (list[index] is StoryTitle) {
      StoryTitle title = list[index];
      return _storyTitle(title.content, 17);
    } else if (list[index] is Story) {
      Story story = list[index];
      return _storyRow(story);
    } else if (list[index] is Addition) {
      return _storyAdditionButton();
    } else if (list[index] is Link) {
      Link link = list[index];
      return _storyLink(link.content);
    } else if (list[index] is Slide) {
      return CarouselWithIndicatorDemo();
    }
  }

  Widget _header() {
    return Container(
      height: 100,
    );
  }

  Widget _storyTitle(String title, [double marginTop]) {
    return Container(
      margin: EdgeInsets.only(left: marginTop, top: 16, bottom: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _storyLine() {
    return Divider(
      color: Color(0xFFB5BEB7),
      indent: 20,
      endIndent: 20,
    );
  }

  Widget _storyRow(Story story) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 8),
                child: Text(
                  story.index.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      color: Color(0xFFBF8877)),
                ),
              ),
              Image(
                image: AssetImage(R.img_icon_stories),
                width: 56,
                height: 56,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              story.name,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF0F0F0F)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 24),
                            child: Visibility(
                              child: Image.asset(R.img_star),
                              visible: story.star,
                            ),
                          )
                        ],
                      ),
                      Text(
                        story.type,
                        style:
                            TextStyle(fontSize: 10, color: Color(0xFF4F4F4F)),
                      ),
                      Text(
                        'Lượt nghe : ${story.viewNum}',
                        style:
                            TextStyle(fontSize: 10, color: Color(0xFF4F4F4F)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Color(0xFFB5BEB7),
            indent: 20,
            endIndent: 20,
          )
        ],
      ),
    );
  }

  Widget _storyAdditionButton() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 12, bottom: 12),
      child: Text(
        "Xem thêm",
        style: TextStyle(fontSize: 14, color: Color(0xFF1E562A)),
      ),
    );
  }

  Widget _storyLink(String content) {
    return Container(
      color: Color(0xFFD4F1CF),
      margin: EdgeInsets.only(left: 20, right: 20, top: 6),
      height: 30,
      child: Row(
        children: [
          Image(image: AssetImage(R.img_ver_line)),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 5), child: Text(content))),
          Container(
              margin: EdgeInsets.only(right: 9),
              child: Image(image: AssetImage(R.img_arrow)))
        ],
      ),
    );
  }
}
