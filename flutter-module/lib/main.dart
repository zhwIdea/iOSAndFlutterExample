import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'boost_config/boost_route.dart';
import 'boost_config/boost_lifecycle_page.dart';
import 'pages/homepage.dart';

void main() {
  /// 这里的CustomFlutterBinding调用务必不可缺少，用于控制Boost状态的resume和pause
  CustomFlutterBinding();

  /// 添加全局生命周期监听类
  PageVisibilityBinding.instance.addGlobalObserver(AppLifecycleObserver());
  runApp(const MyApp());
}

/// 创建一个自定义的Binding，继承和with的关系如下，里面什么都不用写
class CustomFlutterBinding extends WidgetsFlutterBinding with BoostFlutterBinding {}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // 配置页面路由
  Map<String, FlutterBoostRouteFactory> routerMap = boostRouterMap;

  // routeFactory方法用于通过传入的页面名称从routeMap获取到对应的路由配置方法，并传入所需参数进行调用
  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? func = routerMap[settings.name!];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
      debugShowCheckedModeBanner: false,

      /// 必须加上builder参数，否则showDialog等会出问题
      builder: (_, __) {
       // return const Homepage();
        return home;
      },
    );
  }

  @override
  // 在重写的build方法中，构建FlutterBoostApp，将routeFactory和appBuilder这两个方法作为参数传入。
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
    );
  }
}


