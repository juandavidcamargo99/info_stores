import 'dart:convert' as JSON;
import 'package:info_store/model/store.dart';
import 'package:info_store/persistence/server_connection.dart';

class StoreDAO{
  static final List<Store> stores = [];

  static Future<void> addStoresFromServer() async{
    var srvConn = ServerConnection();
    await srvConn.select('Store').then((stores_data) {
      var json = JSON.jsonDecode(stores_data);
      List records = json['data'];
      for (var tienda_json in records) {
        stores.add(Store.fromJson(tienda_json));
      }
    });
  }
}