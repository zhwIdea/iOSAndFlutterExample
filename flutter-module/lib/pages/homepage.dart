import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class Homepage extends StatefulWidget{
  final String? data;
  const Homepage({Key? key, this.data}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("进入到Flutter页面");
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 120),
            alignment: Alignment.center,
            child: const Text("这是一个Flutter页面",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue
              ),
            ),
          ),
          SizedBox(height: 30,),

          Container(
            alignment: Alignment.center,
            child: const Text("下面内容是原生传过来的值",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            color: Colors.lime,
            margin:const EdgeInsets.only(left: 60,right: 60),
            child:Text(widget.data ?? "",
              style:const TextStyle(
                  fontSize: 16,
                  color: Colors.black
              ),),
          ),
        ],
      ),
    );
  }
}
