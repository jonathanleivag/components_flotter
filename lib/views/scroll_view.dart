import 'dart:async';

import 'package:flutter/material.dart';

class ScrollView0 extends StatefulWidget {
  const ScrollView0({Key? key}) : super(key: key);

  @override
  _ScrollViewState createState() => _ScrollViewState();
}

class _ScrollViewState extends State<ScrollView0> {
  final List<int> _items = [];
  int _ultimoItems = 0;
  bool _isLoading = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _addItems();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fechData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll view'),
      ),
      body: Stack(children: [
        _crearList(),
        _crearLoading(),
      ]),
    );
  }

  Widget _crearList() => RefreshIndicator(
        onRefresh: _newItem,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            int _image = _items[index];

            return FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/500/300?random=$_image'));
          },
        ),
      );

  void _addItems() {
    for (var i = 0; i < 10; i++) {
      _ultimoItems++;
      _items.add(_ultimoItems);
    }
    setState(() {});
  }

  Future<void> _fechData() async {
    _isLoading = true;
    setState(() {});
    Timer(const Duration(seconds: 3), _https);
  }

  void _https() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
    _addItems();
  }

  Widget _crearLoading() {
    Widget widget = Container();
    if (_isLoading) {
      widget = Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(height: 20.0)
        ],
      );
    } else {
      widget = Container();
    }
    return widget;
  }

  Future<void> _newItem() async {
    Timer(const Duration(seconds: 2), () {
      _items.clear();
      _ultimoItems++;
      _addItems();
    });
    setState(() {});
    return Future.delayed(const Duration(seconds: 2));
  }
}
