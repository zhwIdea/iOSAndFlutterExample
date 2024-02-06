import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class CategoryPage extends StatefulWidget {
  final String? data;
  const CategoryPage({Key? key, this.data}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("进入到Flutter页面");
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("这是Flutter的分类页面"),
      ),
      body: Center(
        child: Container(
          child: Center(
            child: InkWell(
              child: Text(widget.data ?? ""),
              onTap: (){
                BoostNavigator.instance.push("Article");
              },
            ),
          ),
        ),
      ),
    );
  }
}
