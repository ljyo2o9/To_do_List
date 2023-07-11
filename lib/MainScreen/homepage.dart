import 'package:flutter/material.dart';

import 'package:to_do_list/MainScreen/appbar.dart';
import 'package:to_do_list/MainScreen/body.dart';
import 'package:to_do_list/MainScreen/floatingActionButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: body(context),
      floatingActionButton: floatingActionButton(context),
    );
  }
}
