import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/config/export.dart';

class TabPage extends StatefulWidget {
  final Function()? open;

  const TabPage({
    Key? key,
    this.open,
  }) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuerySize;
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,//刘海
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 10,
                    ),
                    child: IconButton(
                      onPressed: widget.open,
                      icon: const Icon(
                        KTabIcon.menu,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Center(
                        child: Text(
                          "Opendoor",
                          style: TextStyle(
                            color: Color(0xff266ed5),
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 15,
                      top: 10,
                    ),
                    child: CircleAvatar(
                      child: FlutterLogo(
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: SizedBox(
                height: 40,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.grey,
                  controller: _tabController,
                  tabs: const <Widget>[
                    Tab(
                      child: Text("My house"),
                    ),
                    Tab(
                      child: Text("Market"),
                    ),
                    Tab(
                      child: Text("Tools"),
                    ),
                    Tab(
                      child: Text("Neighbourhood"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-155,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(" "),
    );
  }
}
