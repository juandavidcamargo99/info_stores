import 'dart:convert';

enum BussinessType{ Tienda, Drogueria, Ferreteria, Lavanderia }

class Store {
  String id;
  String name;
  String address;
  String cellphone;
  String email;
  String description;
  BussinessType type;

  Store(
      this.id,
      this.name,
      this.address,
      this.cellphone,
      this.email,
      this.description,
      this.type);

  Store.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'].toString(),
        address = json['address'].toString(),
        cellphone = json['cellphone'].toString(),
        email = json['email'].toString(),
        description = json['description'].toString(),
        type = BussinessType.values.firstWhere((element) =>
        element.toString() == 'BussinessType.' + json['type'].toString());
}
