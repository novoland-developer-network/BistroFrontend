import 'package:flutter/material.dart';

class LayoutScaffold extends StatelessWidget {
  final AppBar appBar;
  final Widget? body;

  const LayoutScaffold({
    Key? key,
    required this.appBar,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Text title = appBar.title as Text;

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(
            title.data ?? '',
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          bottom: appBar.bottom,
        ),
        preferredSize: appBar.preferredSize,
      ),
      body: body,
    );
  }
}
