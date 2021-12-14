import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_stores/persistence/database_manager.dart';
import '../model/product.dart';
import '../model/store.dart';

class OrderView extends StatefulWidget {

  final List<Product> order;

  OrderView(this.order);

  @override
  _OrderListViewState createState() => _OrderListViewState();

}


class _OrderListViewState extends State<OrderView> {
  final _biggerFont = const TextStyle(fontSize: 18.0, color: Colors.blueAccent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        automaticallyImplyLeading: true
      ),
      body: _buildOrderList(),
    );
  }

  Widget _buildOrderList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.order.length * 2,
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          int index = i ~/ 2;
          return _buildRow(widget.order[index]);
        });
  }

  Widget _buildRow(Product pdt) {
    return ListTile(
      title: Text(
        pdt.nombre,
        style: _biggerFont,
      ),
      subtitle: Text(
        pdt.precio.toString(),
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
      trailing: Text(pdt.cantidad.toString())
    );
  }
}