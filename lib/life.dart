import 'package:flutter/material.dart';
import 'package:bistro/layout/LayoutScaffold.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Life extends StatelessWidget {
  const Life({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      appBar: AppBar(
        title: const Text('讨论'),
        bottom: PreferredSize(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              )
            ],
          ),
          preferredSize: const Size.fromHeight(50),
        ),
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        itemBuilder: cardBuilder,
        padding: const EdgeInsets.only(top: 23),
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 3.0,
      ),
    );
  }

  Widget cardBuilder(BuildContext context, int index) {
    return Card(
      elevation: 4,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          InkWell(
            child: Image.asset(
              [
                'res/assets/images/logo.jpg',
                'res/assets/images/dololo.jpg',
                'res/assets/images/Spider-Man.jpg',
                'res/assets/images/ch4o5.png',
                'res/assets/images/fire.jpg',
                'res/assets/images/tiefutu.jpg',
                'res/assets/images/big-dog.jpg',
              ][index % 7],
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              '苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉苏月桉',
              maxLines: 2,
              style: TextStyle(
                fontSize: 13,
              ),
              overflow: TextOverflow.visible,
            ),
            isThreeLine: true,
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.person_outline,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            '苏月桉苏月桉苏月桉苏月苏月苏月苏月'.substring(0, 11),
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Icon(
                    [
                      Icons.favorite_border,
                      Icons.favorite,
                    ][index % 2],
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
