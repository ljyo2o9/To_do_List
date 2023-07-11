import 'package:flutter/material.dart';

import 'package:to_do_list/MakeHal/appbar.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
    );
  }
}
