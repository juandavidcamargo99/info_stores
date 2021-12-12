import 'package:flutter/material.dart';
import '../model/store.dart';
import '../persistence/product_dao.dart';
import '../persistence/store_dao.dart';
import 'package:url_launcher/url_launcher.dart';
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
        title: const Text('Negocios cerca tuyo'),
      ),
      body: _buildStoresList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );*/
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
      subtitle: Text(st.address, style : TextStyle(fontSize: 15, color: Colors.cyan)),
      trailing: IconButton(
          onPressed: () { launch(st.url); },
          icon:Icon(Icons.travel_explore_outlined),
          color: Colors.deepPurple,
      ),
      leading: Image.network("https://drive.google.com/uc?export=view&id=" + st.logo),
      onTap: (){
        var prDAO = ProductsDAO();
        prDAO.getProductsFromServer(st.id).then((listaProductos) => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductsListView(listaProductos, st)),
          ),
        });
      },
    );
  }
}






