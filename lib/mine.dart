import 'package:flutter/material.dart';

import 'layout/layout_scaffold.dart';

///
/// 【我的】页
///
class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      appBar: AppBar(
        title: const Text('在下'),
      ),

    );
  }
}
