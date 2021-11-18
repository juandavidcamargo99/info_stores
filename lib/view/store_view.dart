import 'package:flutter/material.dart';
import 'package:info_store/model/store.dart';
import 'package:info_store/persistence/store_dao.dart';

class StoresListView extends StatefulWidget {
  @override
  _StoresListViewState createState() => _StoresListViewState();
}

class _StoresListViewState extends State<StoresListView> {
//  final stDAO = StoreDAO();
  final _stores = StoreDAO.stores;
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de negocios en el barrio'),
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
        title: Text(st.name, style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
        subtitle: Text(st.address,style: TextStyle(fontSize: 20, color: Colors.green)),
        trailing: Icon(Icons.add_shopping_cart, size: 40, color: Colors.black,),
        onTap: (){
          print(st.name);
        },
        onLongPress: () {
          print(st.address);
        }
    );
  }

}