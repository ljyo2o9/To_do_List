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
  String skip = 'nskip';

  @override
  void initState() {
    super.initState();
    _skip();
  }

  _skip() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      if (_prefs!.getString('skip') != null) {
        skip = 'skip';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListController(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          print(skip);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SafeArea(
                child: skip == 'nskip' ? const Introduce() : const HomePage()),
          );
        },
      ),
    );
  }
}
