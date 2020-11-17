import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truyenthieunhi/pages/sample/bloc/user_bloc.dart';
import 'package:truyenthieunhi/generated/r.dart';

class BLoCPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _myFunc();
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Column(
        children: [
          TextField(onChanged: (String content) {
            context.read<UserBloc>().add(TestEvent(content));
          }),
          MyButton()
        ],
      ),
    );
  }

  _myFunc() async {
    await printOrderMessage();
  }

  Future<void> printOrderMessage() async {
    try {
      var order = await fetchUserOrder();
      print('Awaiting user order...');
      print(order);
    } catch (err) {
      print('Caught error: $err');
    }
  }

  Future<String> fetchUserOrder() {
    // Imagine that this function is more complex.
    var str = Future.delayed(
        Duration(seconds: 4), () => "A");
    return str;
  }
}

class MyButton extends StatelessWidget {
  MyButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState state) {
          if (state is TestState) {
            return RaisedButton(
              onPressed: () {},
              child: Text(state.isActive.toString()),
            );
          }
          return RaisedButton(
            onPressed: () {},
            child: Text("false"),
          );
        },
      ),
    );
  }
}
