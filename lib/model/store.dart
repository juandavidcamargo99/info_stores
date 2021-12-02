import 'dart:convert';

enum BussinessType{ Tienda, Drogueria, Ferreteria, Lavanderia }

class Store {
  final String id;
  final String name;
  final String adress;
  final String cellphone;
  final String email;
  final String url;
  final BusinessType type;
  final String description;


  Store(
    this.id,
    this.name,
    this.adress,
    this.cellphone,
    this.email,
    this.url,
    this.type,
    this.description,
      );

  Store.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'],
        adress = json['adress'],
        cellphone = json['cellphone'].toString(),
        email = json['email'],
        url = json['url'],
        description = json['description'],
        type = BusinessType.values.firstWhere((element) => 
               element.toString() == 'BusinessType.'+json['type'].toString());
