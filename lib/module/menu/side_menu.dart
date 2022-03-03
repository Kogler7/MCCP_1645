import 'package:flutter/material.dart';
import 'package:mccp_1645/module/menu/components/list_tile.dart';
import 'package:mccp_1645/module/menu/components/titled_scope.dart';

class SideMenu extends StatefulWidget {
  final Function()? close;

  const SideMenu({Key? key, this.close}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          GestureDetector(
            onTap: widget.close,
            child: Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight, left: 20),
              child: Row(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      right: 5,
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Close menu",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(
                  child: FlutterLogo(),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Eric Who",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Open dashboard",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildScopes(),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  List<Widget> buildScopes() {
    const double width = 280;
    return <Widget>[
      FlatTitledScope(
        width: width,
        title: "云村设置",
        tiles: <Widget>[
          FlatListTile(
            text: "夜间模式",
            onTap: () {},
            hasDetail: true,
          ),
          FlatListTile(
            text: "定时关闭",
            onTap: () {},
          ),
          FlatListTile(
            text: "个性装扮",
            onTap: () {},
            hasDetail: true,
          ),
          FlatListTile(
            text: "音乐黑名单",
            onTap: () {},
          ),
          FlatListTile(
            text: "音乐黑名单",
            onTap: () {},
          ),
        ],
      ),
      FlatTitledScope(
        title: "云村设置",
        width: width,
        tiles: <Widget>[
          FlatListTile(
            text: "夜间模式",
            onTap: () {},
            hasDetail: true,
          ),
          FlatListTile(
            text: "定时关闭",
            onTap: () {},
          ),
          FlatListTile(
            text: "个性装扮",
            onTap: () {},
            hasDetail: true,
          ),
          FlatListTile(
            text: "定时关闭",
            onTap: () {},
          ),
          FlatListTile(
            text: "个性装扮",
            onTap: () {},
            hasDetail: true,
          ),
          FlatListTile(
            text: "音乐黑名单",
            onTap: () {},
          ),
        ],
      ),
      FlatTitledScope(
        title: "云村设置",
        width: width,
        tiles: <Widget>[
          FlatListTile(
            text: "夜间模式",
            onTap: () {},
            hasDetail: true,
          ),
          FlatListTile(
            text: "定时关闭",
            onTap: () {},
          ),
          FlatListTile(
            text: "个性装扮",
            onTap: () {},
            hasDetail: true,
          ),
          FlatListTile(
            text: "音乐黑名单",
            onTap: () {},
          ),
        ],
      ),
    ];
  }
}
