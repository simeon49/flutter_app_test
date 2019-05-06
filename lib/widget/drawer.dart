/**
 * 左侧抽屉栏
 */
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // 头部
          UserAccountsDrawerHeader(
            accountName: Text('Simeon', style: TextStyle(fontWeight: FontWeight.bold)),
            currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://resources.ninghao.org/images/wanghao.jpg'),),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
                fit: BoxFit.cover,
                // colorFilter: ColorFilter.mode(
                //     Colors.yellow[400].withOpacity(0.6), BlendMode.hardLight),
              ),
            ),
          ),

          // 子选项
          ListTile(
            title: Text('Message', textAlign: TextAlign.right),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
