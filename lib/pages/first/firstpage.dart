import 'package:flutter/material.dart';
import 'package:truyenthieunhi/extentions/app_extentions.dart';
import 'package:truyenthieunhi/generated/r.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _headerFirstSection(),
        _textTitle(),
        _loginAppleButton(),
        _loginFaceBookButton(),
        _loginGoogleButton(),
        _policyText()
      ],
    ));
  }

  Widget _headerFirstSection() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, 71, 0, 0),
      child: Stack(
        children: [
          Image.asset(R.img_anhnen_first),
          Image.asset(R.img_anh_bagia_first)
        ],
      ),
    );
  }

  Widget _textTitle() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 14),
      child: Text(
        "Truyện Cổ Tích Audio",
        style: TextStyle(
            fontSize: 24, color: fromHex("0F0F0F"), fontFamily: 'Pacifico'),
      ),
    );
  }

  Widget _loginAppleButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 9, 20, 0),
      height: 44,
      child: RaisedButton(
        color: Colors.black,
        onPressed: () {},
        child: Text(
          "Login with Apple",
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _loginFaceBookButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 9, 20, 0),
      height: 44,
      child: RaisedButton(
        color: fromHex("1E562A"),
        onPressed: () {},
        child: Text(
          "Facebook",
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _loginGoogleButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 9, 20, 0),
      height: 44,
      child: FlatButton(
        color: Colors.white,
        onPressed: () {},
        child: Text(
          "Google",
          style: TextStyle(color: Color(0xFF1E562A), fontSize: 19),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: fromHex("1E562A"))),
      ),
    );
  }

  Widget _policyText() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        alignment: Alignment.bottomCenter,
        child: Text(
          "Điều khoản người dùng và Bảo mật thông tin",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
