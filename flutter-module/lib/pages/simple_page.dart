import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class SimplePage extends StatefulWidget {
  final String? data;

  const SimplePage({Key? key, this.data}) : super(key: key);

  @override
  State<SimplePage> createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> with PageVisibilityObserver{
  String textStr = "转朱阁，低绮户，照无眠。不应有恨，何事长向别时圆？人有悲欢离合，月有阴晴圆缺，此事古难全。但愿人长久，千里共婵娟。";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "这是一个Flutter页面",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Map<String, Object> result = {'data': '返回页面时传参'};
              BoostNavigator.instance.pop(result);
            },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.lime,
              margin: const EdgeInsets.only(left: 60, right: 60, top: 80),
              child: Text(textStr,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                BoostNavigator.instance.push(
                  "NewsVC",
                  arguments: {"data": textStr},
                );
              },

              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
              ),
              child: const Text(
                "跳转到原生页面",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
