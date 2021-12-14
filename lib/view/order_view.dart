import 'package:flutter/material.dart';
import '../persistence/database_manager.dart';

class OrderView extends StatelessWidget {
  @override
  _OrderListViewState createState() => _OrderListViewState();

}

class _OrderListViewState extends State<OrderListView> {
  final _biggerFont = const TextStyle(fontSize: 18.0, color: Colors.blueAccent);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de compras'),
        automaticallyImplyLeading: true,
      ),
      body: _buildStoreList(),
    );
  }

  Widget _buildStoreList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: listaProductosPedidoTemp(),
        itemBuilder: (
            context,
            i,
            ) {
          return _buildRow();
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
      trailing: IconButton(
        icon: Icon(Icons.add_shopping_cart, color: Colors.cyan),
        onPressed: () {
          pdt.cantidad = 1;
          DataBaseManager.db.insertarNuevoProductoTemp(pdt);

        },
      ),
      onTap: () {

      },
    );
  }
}
