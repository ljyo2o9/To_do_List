import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/MainScreen/homepage.dart';

import 'package:to_do_list/MainScreen/introdution.dart';
import 'package:to_do_list/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? _prefs;
  int skip = 0;

  @override
  void initState() {
    super.initState();
    _skip();
  }

  _skip() async {
    _prefs = await SharedPreferences.getInstance();

    if (_prefs!.getString('skip') != null) {
      skip = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListController(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SafeArea(
                child: skip == 0 ? const Introduce() : const HomePage()),
          );
        },
      ),
    );
  }
}
