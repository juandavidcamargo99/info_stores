import 'dart:html';
import 'package:flutter/material.dart';
import 'stores_view.dart';

class HomeView extends StatelessWidget {
  List<String> images = [
    "images/tiendas.png",
    "images/pedidos.png",
    "images/clientes.png",
    "images/buzon.png"
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Lista de nombres',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('lISTA'),
          backgroundColor: Colors.cyan

        ),
        body: Container(
            padding: EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
              ),
              itemBuilder: (context, index) => buildCell(context, index),
            )),
        ),
    );
  }

  Widget buildCell(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _navigateTo(context, index);
      }, // handle your image tap here
      child: Image.asset(
        images[index],
        fit: BoxFit.cover, // this is the solution for border
        width: 110.0,
        height: 110.0,
      ),
    );
  }

  _navigateTo(context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoresListView()),
      );
    }
    return;
  }
}
