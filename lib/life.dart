import 'package:flutter/material.dart';
import 'package:bistro/layout/layout_scaffold.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Life extends StatefulWidget {
  const Life({Key? key}) : super(key: key);
  final title = '听说';

  @override
  State<Life> createState() => _LifeState();
}

class _LifeState extends State<Life> {
  List<Map> _list = [];

  @override
  void initState() {
    super.initState();
    _list = [
      {
        'id': '1',
        'thumbnail': 'res/assets/images/logo.jpg',
        'title': '标题1',
        'author':
            '苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉',
        'hasLiked': false
      },
      {
        'id': '2',
        'thumbnail': 'res/assets/images/dololo.jpg',
        'title': '标题2',
        'author': '启辰',
        'hasLiked': true
      },
      {
        'id': '3',
        'thumbnail': 'res/assets/images/ch4o5.png',
        'title': '标题3',
        'author': '乱世人魔',
        'hasLiked': false
      },
      {
        'id': '4',
        'thumbnail': 'res/assets/images/fire.jpg',
        'title': '标题4',
        'author': 'Singularity',
        'hasLiked': false
      },
      {
        'id': '5',
        'thumbnail': 'res/assets/images/tiefutu.jpg',
        'title': '标题5',
        'author': '浅帅',
        'hasLiked': true
      },
      {
        'id': '6',
        'thumbnail': 'res/assets/images/logo.jpg',
        'title': '标题6',
        'author':
            '苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉',
        'hasLiked': false
      },
      {
        'id': '7',
        'thumbnail': 'res/assets/images/dololo.jpg',
        'title': '标题7',
        'author': '启辰',
        'hasLiked': true
      },
      {
        'id': '8',
        'thumbnail': 'res/assets/images/ch4o5.png',
        'title': '标题8',
        'author': '乱世人魔',
        'hasLiked': false
      },
      {
        'id': '9',
        'thumbnail': 'res/assets/images/fire.jpg',
        'title': '标题9',
        'author': 'Singularity',
        'hasLiked': false
      },
      {
        'id': '10',
        'thumbnail': 'res/assets/images/tiefutu.jpg',
        'title': '标题10',
        'author': '浅帅',
        'hasLiked': true
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: MasonryGridView.count(
        shrinkWrap: true,
        itemCount: _list.length,
        crossAxisCount: 2,
        itemBuilder: cardBuilder,
        padding: const EdgeInsets.only(top: 23),
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 3.0,
      ),
    );
  }

  Widget cardBuilder(BuildContext context, int index) {
    var item = _list[index];

    return Card(
      key: ValueKey(item["id"]),
      elevation: 8,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          InkWell(
            child: Image.asset(
              item["thumbnail"],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              item["title"].toString(),
              maxLines: 2,
              style: const TextStyle(
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            isThreeLine: true,
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Row(
                    children: <Widget>[
                      // Icon(
                      //   Icons.person_outline,
                      //   color: Theme.of(context).primaryColor,
                      // ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 100),
                        child: Text(
                          item['author'].toString(),
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Icon(
                    item["hasLiked"] ? Icons.favorite : Icons.favorite_border,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    setState(() {
                      _list[index]["hasLiked"] = !item["hasLiked"];
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
