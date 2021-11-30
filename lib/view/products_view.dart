import 'package:flutter/material.dart';
import '../model/products.dart';
import '../persistence/product_dao.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  _SecondRouteState createState() => _SecondRouteState();

}
class _SecondRouteState extends State<SecondRoute> {
  //
  final _products = ProductDAO.products;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
      ),
      body: _buildProductList(),
    );
  }
  Widget _buildProductList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _products.length,
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(_products[i]);
        }
    );
  }
  Widget _buildRow(Product pr) {
    return ListTile(
      title: Text(pr.store, style: TextStyle(fontSize: 20, color: Colors.blue)),
      subtitle:Text(pr.product, style: TextStyle(fontSize: 20, color: Colors.cyan)),
    );
  }
}
