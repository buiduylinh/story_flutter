import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:truyenthieunhi/pages/sample/SampleProvider.dart';
import 'package:provider/provider.dart';

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Test()
      ),
    );
  }

  _callApi() async {
    var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';
    var response = await get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var itemCount = jsonResponse['to talItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

class Test extends StatelessWidget {
  Test({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(context.watch<SampleProvider>().count.toString()),
        RaisedButton(
          onPressed: () {
            context.read<SampleProvider>().setCount(30);
            print("LinhBD");
          },
          child: Text("Click Here"),
        )
      ],
    );
  }
}
