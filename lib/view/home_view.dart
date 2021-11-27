import 'dart:html';
import 'package:flutter/material.dart';
import 'package:info_stores/view/stores_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Lista de nombres',

      home: Scaffold(
        appBar: AppBar(
          title: const Text('lISTA'),
        ),
        body: Center(
          child:StoresListView(),
        ),
      ),
    );
  }
}
