import 'dart:convert';

enum BusinessType{ Tienda, Drogueria, Ferreteria, Lavanderia }

class Store {
  final String id;
  final String name;
  final String address;
  final String cellphone;
  final String email;
  final String url;
  final String description;
  final BusinessType type;


  Store(this.id,
      this.name,
      this.address,
      this.cellphone,
      this.email,
      this.url,
      this.description,
      this.type);

  Store.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'],
        address = json['address'],
        cellphone = json['cellphone'].toString(),
        email = json['email'],
        url = json['url'].toString(),
        description = json['description'],
        type = BusinessType.values.firstWhere((element) =>
        element.toString() == 'BusinessType.' + json['type'].toString());
}