import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:truyenthieunhi/pages/sample/json/model/image.dart' as Linh;

class JsonPage extends StatefulWidget {

  JsonPage({Key key}) : super(key: key);

  @override
  _JsonPageState createState() => _JsonPageState();


}

class _JsonPageState extends State<JsonPage> {
  List<dynamic> list = List<dynamic>();

  _getJson(BuildContext context) async {
    String value = await loadAsset(context);
    print(value);
    setState(() {
      list = jsonDecode(value);
    });
  }

  Future<String> loadAsset(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('assets/data.txt');
  }

  @override
  void initState() {
    super.initState();
    _getJson(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          Linh.Image image = Linh.Image.fromJson(list[index]);
          return Column(
            children: [Text(image.name), Image.network(image.icon), Text(image.desc)],
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
