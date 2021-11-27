import 'package:flutter/material.dart';
import 'package:info_store/model/store.dart';
import 'package:info_store/persistence/stores_dao.dart';
import 'package:info_store/view/products_view.dart';


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
      ),
      body: _buildStoresList(
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );
        },
        label: const Text('Productos'),
        icon: const Icon(Icons.add_shopping_cart_sharp),
        backgroundColor: Colors.greenAccent,
      ),
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
      title: Text(st.name, style: TextStyle(fontSize: 20, color: Colors.blue)),
      subtitle: Text(st.description,style: TextStyle(fontSize: 20, color: Colors.cyan)),
      trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Visitar sitio del vendedor')
      ),
    );

  }
}





