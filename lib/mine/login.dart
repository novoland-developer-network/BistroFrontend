import 'package:flutter/material.dart';

///
/// 登录页
///
class Login extends StatefulWidget {
  final Function successCallback;

  const Login({
    required Key key,
    required this.successCallback,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
          title: const Text(
            '登录',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
      body: const Text('登录'),
    );;
  }
}
