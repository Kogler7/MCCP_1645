import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  final Function()? close;

  const SideMenu({Key? key, this.close}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    String _title = 'title';
    String _text = 'text';
    bool _hasDetail = true;
    return SizedBox(
      height: double.infinity,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                color: Colors.transparent, //参数backColor
                child: SizedBox(
                  width: 200, //参数width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 26,
                              left: 20,
                            ),
                            child: Text(
                              _title, //参数title
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Container(
                              height: 1,
                              width: 70,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[ //参数tiles
                          InkWell(
                            onTap: () {}, //参数onTap
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                height: 32, //参数height
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    _hasDetail //参数hasDetail
                                        ? const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey,
                                      size: 16,
                                    )
                                        : const Text(''),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {}, //参数onTap
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                height: 32, //参数height
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    _hasDetail //参数hasDetail
                                        ? const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey,
                                      size: 16,
                                    )
                                        : const Text(''),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {}, //参数onTap
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                height: 32, //参数height
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    _hasDetail //参数hasDetail
                                        ? const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey,
                                      size: 16,
                                    )
                                        : const Text(''),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ), Material(
                color: Colors.transparent, //参数backColor
                child: SizedBox(
                  width: 200, //参数width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 26,
                              left: 20,
                            ),
                            child: Text(
                              _title, //参数title
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Container(
                              height: 1,
                              width: 70,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //参数tiles
                          InkWell(
                            onTap: () {}, //参数onTap
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                height: 32, //参数height
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    _hasDetail //参数hasDetail
                                        ? const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey,
                                      size: 16,
                                    )
                                        : const Text(''),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {}, //参数onTap
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                height: 32, //参数height
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    _hasDetail //参数hasDetail
                                        ? const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey,
                                      size: 16,
                                    )
                                        : const Text(''),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {}, //参数onTap
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                height: 32, //参数height
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    _hasDetail //参数hasDetail
                                        ? const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey,
                                      size: 16,
                                    )
                                        : const Text(''),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}