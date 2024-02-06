import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/flutter_boost.dart';
import '../pages/homepage.dart';
import '../pages/category.dart';
import '../pages/simple_page.dart';

// 对每一个页面的路由方式进行配置
Map<String, FlutterBoostRouteFactory> boostRouterMap = {
  'homepage': (settings, uniqueId) {
    return CupertinoPageRoute( // CupertinoPageRoute：类似iOS页面的Push效果
        settings: settings,
        builder: (_) {
          Map<String, dynamic>? map = settings.arguments as Map<String,
              dynamic>;
          String data = map['data'] as String;
          return Homepage(
            data: data,
          );
        });
  },
  'categoryPage': (settings, uniqueId) {
    return CupertinoPageRoute(
        settings: settings,
        builder: (_) {
          Map<String, dynamic>? map = settings.arguments as Map<String,
              dynamic>;
          String data = map['data'] as String;
          return CategoryPage(
            data: data,
          );
        });
  },
  'simplePage': (settings, uniqueId) {
    return CupertinoPageRoute(
        settings: settings,
        builder: (_) {
          Map<String, dynamic>? map = settings.arguments as Map<String,
              dynamic>;
          String data = map['data'] as String;
          return SimplePage(
            data: data,
          );
        });
  },
};


