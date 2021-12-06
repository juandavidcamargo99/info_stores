import 'dart:convert' as JSON;
import '../model/products.dart';
import '../persistence/server_connection.dart';

class ProductsDAO{

  Future<List<Product>> getProductsFromServer(String idtienda) async{
    var srvConn = ServerConnection();

    final List<Product> products = [];
    await srvConn.getProducts(idtienda).then((productsData) {
      List records = productsData.split("|");
      records.forEach((element) {
        products.add(Product.fromString(element));
      });
    });
    return products;
  }
}
