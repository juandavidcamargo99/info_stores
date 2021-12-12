import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_stores/view/google_maps.dart';
import '../model/product.dart';
import '../model/store.dart';

class ProductsListView extends StatefulWidget {

  final Store store;
  final List<Product> LstPr;

  ProductsListView(this.LstPr, this.store);

  @override
  _ProductsListViewState createState() => _ProductsListViewState();

}


class _ProductsListViewState extends State<ProductsListView> {
  final _biggerFont = const TextStyle(fontSize: 18.0, color: Colors.blueAccent);

  void handleTap(int item) {
    switch (item) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GoogleMapsWidget(widget.store)),
        );
        break;
      case 1:
        print('dsa');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          PopupMenuButton<int>(
              onSelected: (item) => handleTap(item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Mapa')),
                PopupMenuItem<int>(value: 0, child: Text('Carrito Compras')),
              ]
          ),
        ],
      ),
      body: _buildStoreList(),
    );
  }

  Widget _buildStoreList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.LstPr.length,
        itemBuilder: (
            context,
            i,
            ) {
          return _buildRow(widget.LstPr[i]);
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
      trailing: Icon(
        Icons.ac_unit_outlined,
        size: 20,
        color: Colors.amber,
      ),
      onTap: () {



      },
    );
  }
}