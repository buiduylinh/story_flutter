import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyenthieunhi/generated/r.dart';

class FeatureStoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            _storieTitle("Truyện nổi bật", 17),
            _storieRow(1),
            _storieLine(),
            _storieRow(2),
            _storieLine(),
            _storieRow(3),
            _storieLine(),
            _storieAdditionButton(),
            _storieTitle("Truyện mới nhất", 17),
            _storieRow(1),
            _storieLine(),
            _storieRow(2),
            _storieLine(),
            _storieRow(3),
            _storieLine(),
            _storieAdditionButton(),
            _storieTitle("Thể loại truyện", 17),
            _storieLink("Truyện cổ tích Việt Nam"),
            _storieLink("Truyện cổ tích thế giới"),
            _storieLink("Truyện cổ tích thế giới"),
            _storieLink("Truyện cổ tích thế giới"),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 100,
    );
  }

  Widget _storieTitle(String title, [double marginTop]) {
    return Container(
      margin: EdgeInsets.only(left: marginTop, top: 16, bottom: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _storieLine() {
    return Divider(
      color: Color(0xFFB5BEB7),
      indent: 20,
      endIndent: 20,
    );
  }

  Widget _storieRow(int number) {
    return Container(
      height: 56,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 8),
            child: Text(
              number.toString(),
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
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Thánh Gióng - Truyện cổ tích...",
                  style: TextStyle(fontSize: 14, color: Color(0xFF0F0F0F)),
                ),
                Text(
                  "Truyện Kiều",
                  style: TextStyle(fontSize: 10, color: Color(0xFF4F4F4F)),
                ),
                Text(
                  "Lượt nghe : 1511",
                  style: TextStyle(fontSize: 10, color: Color(0xFF4F4F4F)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _storieAdditionButton() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 12, bottom: 12),
      child: Text(
        "Xem thêm",
        style: TextStyle(fontSize: 14, color: Color(0xFF1E562A)),
      ),
    );
  }

  Widget _storieLink(String content) {
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
