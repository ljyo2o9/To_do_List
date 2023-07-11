// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:to_do_list/MakeHal/base.dart';

FloatingActionButton floatingActionButton(context) {
  return FloatingActionButton(
    child: const Icon(Icons.add),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SafeArea(child: BasePage()),
        ),
      );
    },
  );
}
