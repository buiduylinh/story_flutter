import 'package:flutter/material.dart';
import 'package:truyenthieunhi/pages/sample/LoginProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Hello Build");

    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              context.read<LoginProvider>().changeNameStatus(value);
            },
          ),
          TextField(
            onChanged: (value) {
              context.read<LoginProvider>().changePassStatus(value);
            },
          ),
          Button()
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text(context.watch<LoginProvider>().getStatus().toString()),
    );
  }
}
