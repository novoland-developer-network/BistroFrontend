import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'app.dart';
import 'life.dart';
import 'news.dart';
import 'mine.dart';
import 'router/router.dart';

//import 'common/access_control_filter.dart';

void main() => runApp(const Bistro());

class Bistro extends StatelessWidget {
  const Bistro({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '小酒馆',
      theme: ThemeData(
          fontFamily: "SongTiHeavy",
          primaryColor: const Color(0xFFff857a),
          primaryColorDark: Colors.black54,
          backgroundColor: const Color(0xFFFFF7F8),
          bottomAppBarColor: const Color(0xFFFFF7F8),
          appBarTheme: const AppBarTheme(color: Colors.white), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(secondary: Colors.deepOrangeAccent)),
      home: const BistroFrame(title: 'Flutter Demo Home Page', ),
      // 国际化
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('zh', 'CN'),
      // ],
      // locale: const Locale('zh'),
      // 路由
      routes: router,
    );
  }
}

class BistroFrame extends StatefulWidget {
  const BistroFrame({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  _BistroFrameState createState() => _BistroFrameState();
}

class _BistroFrameState extends State<BistroFrame> {
  late Widget _body;
  int _index = 0;

  void initData() {
    //页面初始化时要干的事
    _body = IndexedStack(
      children: <Widget>[
        const App(),
        Life(),
        const App(),
        News(),
        Mine(),
      ],
      index: _index,
    );
  }

  @override
  Widget build(BuildContext context) {
    initData();

    return Scaffold(
      body: _body,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            bottomAppBarItem(
              index: 0,
              icon: Icons.apps,
              title: '应用',
            ),
            bottomAppBarItem(
              index: 1,
              icon: Icons.forum,
              title: '讨论',
            ),
            bottomAppBarItem(
              index: 2,
              isShow: false,
            ),
            bottomAppBarItem(
              index: 3,
              icon: Icons.business,
              title: '资讯',
            ),
            bottomAppBarItem(
              index: 4,
              icon: Icons.perm_identity,
              title: '我的',
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).backgroundColor,
        onPressed: () => {},
        child: Icon(
          Icons.search,
          color: Theme.of(context).primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget bottomAppBarItem({
    required int index, // 序列
    IconData? icon, // 图标
    String? title, // 标签
    bool isShow = true, // 是否需要显示
  }) {
    //设置默认未选中的状态
    double size = 13;
    Color color = Colors.black87;

    if (_index == index) {
      //选中的话
      size = 15;
      color = Theme.of(context).primaryColor;
    }
    TextStyle style = TextStyle(
      fontSize: size,
    );
    Widget child;
    if (isShow) {
      child = GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 25.0,
              height: 23.0,
              child: Icon(
                icon,
                color: color,
                size: size * 1.7,
              ),
            ),
            Text(
              title!,
              style: style,
            )
          ],
        ),
        onTap: () {
          if (_index != index) {
            setState(() {
              _index = index;
            });
          }
        },
      );
    } else {
      child = Container();
    }

    //构造返回的Widget
    return SizedBox(
      height: 49,
      width: MediaQuery.of(context).size.width / 5,
      child: child,
    );
  }
}
