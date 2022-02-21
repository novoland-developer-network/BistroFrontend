import 'package:flutter/material.dart';
import 'layout/layout_scaffold.dart';

///
/// 应用页
///
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutScaffold(
      appBar: AppBar(
        title: const Text('应用'),
      ),
      body: null,
    );
  }
}
