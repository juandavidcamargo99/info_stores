import 'package:flutter/material.dart';
import 'package:info_store/persistence/store_dao.dart';
import 'package:info_store/view/home_view.dart';

void main() {
  StoreDAO.addStoresFromServer().then((value){
    runApp(const HomeView());
  });
}