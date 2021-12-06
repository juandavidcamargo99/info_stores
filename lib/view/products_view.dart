import 'package:flutter/material.dart';
import '../model/products.dart';
import '../persistence/product_dao.dart';

class SecondRoute extends StatefulWidget {

  final List<Product> LstPr;

  SecondRoute(this.LstPr);
  @override

  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  //
  final _biggerFont = const TextStyle(fontSize: 18.0, color: Colors.blueAccent);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos"),
      ),
      body: _buildProductList(),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.LstPr.length,
      itemBuilder: (context, i,) {return _buildRow(widget.LstPr[i]);}
    );
  }

  Widget _buildRow(Product pr) {

    return ListTile(
      title: Text(pr.nombre, style: const TextStyle(fontSize: 20, color: Colors.blue)),
      subtitle:Text(pr.unidad, style: const TextStyle(fontSize: 20, color: Colors.cyan)),
    );
  }
}
