import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    print(appBar.preferredSize);

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          actions: appBar.actions,
          leading: appBar.leading,
          title: Text(
            title.data ?? '',
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          bottom: appBar.bottom,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,  //设置为透明
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        preferredSize: const Size.fromHeight(60),
      ),
      body: body,
    );
  }
}
