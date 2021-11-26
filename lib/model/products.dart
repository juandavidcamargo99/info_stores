class Product{
  final String store;
  final String product;
  final String pdescription;

  Product(
      this.store,
      this.product,
      this.pdescription,
      );
  Product.fromJson(Map<String, dynamic> json)
  :
        store = json['store'],
        product = json['product'],
        pdescription = json['pdescription'];
}
