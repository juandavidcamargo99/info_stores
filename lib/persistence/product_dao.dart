import 'dart:convert' as JSON;
import '../model/products.dart';
import '../persistence/server_connection.dart';

class ProductDAO{
  static final List<Product> products = [];

  static Future<void> addStoresFromServer() async{
    var srvConn = ServerConnection();
    await srvConn.select('Products').then((products_data) {
      var json = JSON.jsonDecode(products_data);
      List records = json['data'];
      records.forEach((tienda_json) {
        products.add(Product.fromJson(tienda_json));
      });
    });
  }
}
