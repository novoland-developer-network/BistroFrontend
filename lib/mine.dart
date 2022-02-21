import 'package:flutter/material.dart';

import 'layout/LayoutScaffold.dart';

///
/// 【我的】页
///
class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      appBar: AppBar(
        title: const Text('我的'),
      ),

    );
  }
}
