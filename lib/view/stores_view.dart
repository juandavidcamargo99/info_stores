import 'package:flutter/material.dart';
import '../model/store.dart';
import '../persistence/store_dao.dart';
import '../view/products_view.dart';


class StoresListView extends StatefulWidget {
  const StoresListView({Key? key}) : super(key: key);

  @override
  _StoresListViewState createState() => _StoresListViewState();

}

class _StoresListViewState extends State<StoresListView> {
//  final stDAO = StoreDAO();
  final _stores = StoreDAO.stores;


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de negocios en el barrio'),
        backgroundColor: Colors.green,
      ),
      body: _buildStoresList(),
    );

  }

  Widget _buildStoresList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _stores.length,
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(_stores[i]);
        }
    );
  }

  Widget _buildRow(Store st) {

    return ListTile(
      title: Text(st.name, style: const TextStyle(fontSize: 20, color: Colors.blue)),
      subtitle: Text(st.description,style: const TextStyle(fontSize: 20, color: Colors.cyan)),
      trailing: ElevatedButton(
          onPressed: () {
            launch(st.url);
            },
          child: const Text('Visitar sitio del vendedor')
      ),
      onTap: () {
        var prDAO = ProductsDAO();
        prDAO.getProductsFromServer(st.id).then((listaProductos) => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute(listaProductos)),
          ),
        });
      },
    );

  }
}






