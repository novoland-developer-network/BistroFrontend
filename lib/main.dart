import 'package:flutter/material.dart';

//import 'common/access_control_filter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart'
    if (dart.library.html) 'package:flutter_native_splash/flutter_native_splash_web.dart';

// import 'package:flutter_localizations/flutter_localizations.dart';
import 'app.dart';
import 'life.dart';
import 'mine.dart';
import 'news.dart';
import 'router/router.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const Bistro());
}

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
        // primaryColor: const Color(0xFF5f2500),
        primaryColorDark: Colors.white60,
        backgroundColor: const Color(0xFFFFF7F8),
        // backgroundColor: const Color(0xFFcf9237),
        bottomAppBarColor: const Color(0xFFFFF7F8),
        appBarTheme: const AppBarTheme(color: Colors.white),
        // appBarTheme: const AppBarTheme(color: Color(0xFF5f2500)),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.amber,
        ).copyWith(
          secondary: Colors.deepOrangeAccent,
        ),
      ),
      home: const BistroFrame(
        title: '小酒馆',
      ),
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
  const BistroFrame({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _BistroFrameState createState() => _BistroFrameState();
}

class _BistroFrameState extends State<BistroFrame> {
  late Widget _body;
  int _index = 3;

  static const List<Map<String, dynamic>> _iconList = [
    {
      "title": "满席",
      "icon": Icons.storefront_outlined,
      "display": true,
    },
    {
      "title": "道听",
      "icon": Icons.forum_outlined,
      "display": true,
    },
    {
      "display": false,
    },
    {
      "title": "途说",
      "icon": Icons.supervisor_account_outlined,
      "display": true,
    },
    {
      "title": "在下",
      "icon": Icons.person_outline,
      "display": true,
    },
  ];

  @override
  initState() {
    //页面初始化时要干的事
    super.initState();

    initialization();
  }

  void initData() {
    _body = IndexedStack(
      children: <Widget>[
        const App(),
        News(),
        News(),
        const Life(),
        const Mine(),
      ],
      index: _index,
    );
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    initData();

    List<Widget> bottomNavigationBarData = [];
    for (var i = 0; i < 5; i++) {
      Widget itemWidget = bottomAppBarItem(index: i);
      bottomNavigationBarData.add(itemWidget);
    }

    return Scaffold(
      body: _body,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: bottomNavigationBarData,
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
  }) {
    Map<String, dynamic> item = _iconList[index];

    //设置默认未选中的状态
    double size = 14;
    Color color = Colors.black87;
    bool isShow = item["display"];

    TextStyle style = TextStyle(
      fontSize: size,
    );

    Widget child;
    if (!isShow) {
      child = Container();
    } else {
      IconData? icon = item["default"];
      String title = item["title"];

      if (_index == index) {
        //选中的话
        color = Theme.of(context).primaryColor;
        style = const TextStyle(
          fontSize: 0,
        );
        icon = item["icon"];
      }

      child = GestureDetector(
        child: icon != null
            ? SizedBox(
                width: 25.0,
                height: 23.0,
                child: Icon(
                  icon,
                  color: color,
                  size: size * 1.7,
                ),
              )
            : Container(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: style,
                ),
              ),
        onTap: () {
          if (_index != index) {
            setState(() {
              _index = index;
            });
          }
        },
      );
    }

    //构造返回的Widget
    return SizedBox(
      height: 49,
      width: MediaQuery.of(context).size.width / 5,
      child: child,
    );
  }
}
