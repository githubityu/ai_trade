import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ai_trade/exports.dart';
import 'package:ai_trade/route/export_route.dart';

class WebPage extends StatelessWidget {
  const WebPage(this.params, {Key? key}) : super(key: key);
  final ParamsWebPage params;

  @override
  Widget build(BuildContext context) {
    params.url.log();
    return Scaffold(
      appBar: AppBar(
        title: Text(params.title),
      ),
      body: MyIFrame(params.url),
    );
  }
}

class TestWebPage extends HookWidget {
  const TestWebPage(this.params, {Key? key}) : super(key: key);
  final ParamsWebPage params;

  @override
  Widget build(BuildContext context) {
    final height2 = useState(300.0);
    params.url.log();
    return Scaffold(
      appBar: AppBar(
        title: Text(params.title),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              ListTile(
                title: Text("header"),
              )
            ],
          )),
          SliverToBoxAdapter(
              child: SizedBox(
            height: height2.value,
            child: MyIFrame(
              params.url,
              heightFunc: (height,_) {
                height.log();
                height2.value = height;
              },
            ),
          )),
          SliverToBoxAdapter(
              child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              ListTile(
                title: Text("foolter"),
              ),
              CupertinoTextField()
            ],
          )),
        ],
      ),
    );
  }
}
